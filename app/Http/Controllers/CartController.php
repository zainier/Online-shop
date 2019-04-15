<?php

namespace App\Http\Controllers;

use App\Cart;
use App\Product as Product;
use Validator;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Illuminate\Routing\Controller as BaseController;
use App\Http\Traits\CartTrait;
use View;

class CartController extends BaseController {

  public function postAddToCart()
  {
    $rules=array(

      'amount'=>'required|numeric',
      'product'=>'required|numeric|exists:products,Id_Product'
    );

    $validator = Validator::make(Input::all(), $rules);

      if ($validator->fails())
      {
          return Redirect::route('index')->with('error','The product could not added to your cart!');
      }

      $user_id = Auth::user()->id;
      $product_id = Input::get('product');
      $amount = Input::get('amount');

      $product_id = Product::find($product_id);
      $total = $amount*$product_id->Value;

       $count = Cart::where('Id_Product','=',$product_id)->where('user_id','=',$user_id)->count();

       if($count){

         return Redirect::route('index')->with('error','The product already in your cart.');
       }

      Cart::create(
        array(
        'user_id'=>$user_id,
        'Id_Product'=>$product_id->Id_Product,
        'amount'=>$amount,
        'total'=>$total
        ));

      return redirect()->route('cart');
  }


  public function getIndex(){

    $user_id = Auth::user()->id;

    $cart_products=Cart::with('Products')->where('user_id','=',$user_id)->get();

    $cart_total=Cart::with('Products')->where('user_id','=',$user_id)->sum('total');

    if(!$cart_products){

      return Redirect::route('index')->with('error','Your cart is empty');
    }
    
    return View::make('cart')
          ->with('cart_products', $cart_products)
          ->with('cart_total',$cart_total);
  }
      public function update() {
        
        $user_id = Auth::user()->id;

        $amount = Input::get('amount');

        $product_id = Input::get('product');

        $cart_id = Input::get('cart_id');
        $value = Input::get('value');

        $product = Product::find($product_id);
        $total = $amount*$value;

        $cart = Cart::where('user_id', '=', $user_id)->where('Id_Product', '=', $product_id)->where('id', '=', $cart_id);

        $cart->update(array(
            'user_id'    => $user_id,
            'Id_Product' => $product_id,
            'amount'        => $amount,
            'total'      => $total
        ));
        return redirect()->route('cart');
    }

  public function getDelete($id){

    $cart = Cart::find($id)->delete();

    return redirect()->route('cart');
  }

}
