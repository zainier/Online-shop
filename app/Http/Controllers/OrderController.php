<?php

namespace App\Http\Controllers;


use App\Mail\OrderConfirmed;
use App\Mail\OrderPlaced;
use App\Order;
use App\Product;
use App\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use View;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Illuminate\Routing\Controller as BaseController;
use App\Mail\OrderShipped;
use Illuminate\Support\Facades\Mail;

class OrderController extends BaseController
{

    public static $ORDER_CONFIRMED = 2;
    public static $ORDER_CANCELED = 5;
    public static $ORDER_SHIPPED = 4;

    public function postOrder()
    {


        $user_id = Auth::user()->id;
        $address = Auth::user()->address;

        $cart_products = Cart::with('Products')->where('user_id','=',$user_id)->get();

        $cart_total=Cart::with('Products')->where('user_id','=',$user_id)->sum('total');

        if(!$cart_products){

            return Redirect::route('index')->with('error','Your cart is empty.');
        }

        $order = Order::create(
            array(
                'user_id'=>$user_id,
                'address'=>$address,
                'total'=>$cart_total,
                'id_status'=>1
            ));

        foreach ($cart_products as $order_products) {

            $order->orderItems()->attach($order_products, array(
                'amount'=>$order_products->amount,
                'price'=>$order_products->Products->Value,
                'total'=>$order_products->Products->Value*$order_products->amount
            ));

        }

        Cart::where('user_id','=',$user_id)->delete();
/*
        //Send email to Client
        $order = Order::all()->last();
        $products = self::getOrderProducts($order->id);
        $data = (['id_order' => $order->id,
            'status' => OrderController::getStatus($order->id)->type,
            'products' => $products,
            'price' => $order->total,
            'created_at' => $order->created_at]);

        self::placed($data);
*/
        return redirect()->route('orders');
    }

    public function loadCategories(){
        $categories = \DB::table('categories')->select('name', 'slug')->get();
        return $categories;
    }


    public function countProductsInCart() {
        if (Auth::check()) {
            $user_id = Auth::user()->id;
            $cart_count = Cart::where('user_id', '=', $user_id)->count();
            return $cart_count > 0 ? $cart_count : 0;
        }
    }
    public function getIndex(){

        $user_id = Auth::user()->id;
        $cart_count = $this->countProductsInCart();
        if(Auth::user()->admin){

            $orders=Order::all();

        }else{

            $orders=Order::with('orderItems')->where('user_id','=',$user_id)->get();
        }

        if(!$orders){

            return Redirect::route('index')->with('error','There is no order.');
        }
        $categories = $this->loadCategories();
        return View::make('my-orders')
            ->with('orders', $orders)
             ->with('categories', $categories)
             ->with('cart_count',$cart_count);
    }

    public static function updateStatus($id_order, $status){
        DB::table('orders')
            ->where('id', $id_order)
            ->update(['id_status' => $status]);
    }


    public static function confirm($data){
        Mail::to(OrderController::getUserEmail($data['id_order']))->send(new OrderConfirmed($data));
    }

    public static function ship($data)
    {
        Mail::to(OrderController::getUserEmail($data['id_order']))->send(new OrderShipped($data));
    }

    private function placed($data){
        Mail::to(OrderController::getUserEmail($data['id_order']))->send(new OrderPlaced($data));
    }

    private static function getUserEmail($orderId){
        $email = DB::table('orders')
            ->join('users', 'orders.user_id', '=', 'users.id')
            ->select('email')
            ->where('orders.id','=', $orderId)
            ->value('email');

        return $email;
    }

    public static function getOrderProducts($id_order){
        $products =  DB::table('order_product')
            ->join('products', 'products.Id_Product', '=', 'order_product.Id_Product')
            ->select('Name','amount','total')
            ->where('order_id', '=', $id_order)
            ->get();

        return $products;
    }

    public static function getStatus($id_order){
        $status = DB::table('orders')
            ->join('order_status', 'orders.id_status', '=', 'order_status.id_status')
            ->select('order_status.id_status', 'type')
            ->where('id', $id_order)
            ->get()->values();

        return $status[0];
    }



}
