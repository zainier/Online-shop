<?php
namespace App\Http\Controllers;
use App\Order;
use App\Product;
use App\Cart;
use App\Mail\OrderPlaced;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use App\Http\Requests\CheckoutRequest;
use Cartalyst\Stripe\Laravel\Facades\Stripe;
use Cartalyst\Stripe\Exception\CardErrorException;
class CheckoutController extends Controller
{

    public function index()
    {

        $cities = DB::table('cities')->pluck('Id_City','cityName');
        $user_id = Auth::user()->id;
        $cart_products = Cart::with('Products')->where('user_id','=',$user_id)->get();
        $cart_total = Cart::with('Products')->where('user_id','=',$user_id)->sum('total');

        return view('checkout', [
            'cities' => $cities,
            'cart_products'=> $cart_products,
            'cart_total'=>$cart_total,
        ]);
        return view('checkout') ;
    }
    public function store()
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

}


