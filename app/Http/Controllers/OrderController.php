<?php

namespace App\Http\Controllers;


use App\Order;
use App\Product;
use App\Cart;
use Illuminate\Http\Request;
use View;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Illuminate\Routing\Controller as BaseController;

class OrderController extends BaseController
{

    public function postOrder()
    {
        $rules=array(

            'address'=>'required'
        );



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
                'status'=>1
            ));

        foreach ($cart_products as $order_products) {

            $order->orderItems()->attach($order_products, array(
                'amount'=>$order_products->amount,
                'price'=>$order_products->Products->Value,
                'total'=>$order_products->Products->Value*$order_products->amount
            ));

        }

        Cart::where('user_id','=',$user_id)->delete();

        return redirect()->route('orders');
    }

    public function loadCategories(){
        $categories = \DB::table('categories')->select('name', 'slug')->get();
        return $categories;
    }
    public function getIndex(){

        $user_id = Auth::user()->id;

        if(Auth::user()->admin){

            $orders=Order::all();

        }else{

            $orders=Order::with('orderItems')->where('user_id','=',$user_id)->get();
        }

        if(!$orders){

            return Redirect::route('index')->with('error','There is no order.');
        }
        $categories = $this->loadCategories();
        return View::make('order')
            ->with('orders', $orders)
             ->with('categories', $categories);
    }
}
