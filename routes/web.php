<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Storage;

/*AUTHENTICATION*/

Route::get('registration', 'RegisterController@getCities');

Route::get('/', function () {
    return view('login');
});

Route::post('index', 'ProductController@checkLoginStatus');
Route::post('register', 'RegisterController@register');

Route::post('login', 'LoginController@login');


Route::get('worker', function() {
    return 'Welcome Worker';
});

Route::get('logout', 'LoginController@logout');


/* PRODUCTS AND CATEGORIES*/


Route::get('products','ProductController@checkLoginStatus');

Route::get('products/{category}','ProductController@checkLoginStatus')->name('category');

/* CART AND ORDERS*/

Route::get('/cart', array('before'=>'auth.basic','as'=>'cart','uses'=>'CartController@getIndex'));
Route::post('/cart/add', array('before'=>'auth.basic','uses'=>'CartController@postAddToCart'));
Route::get('/cart/delete/{id}', array('before'=>'auth.basic','as'=>'delete_product_from_cart','uses'=>'CartController@getDelete'));
Route::post('/cart/update', array('before'=>'auth.basic','as'=>'update','uses'=>'CartController@update'));

Route::post('/order', array('before'=>'auth.basic','uses'=>'OrderController@postOrder'));
Route::get('/user/orders', array('before'=>'auth.basic','as'=>'orders','uses'=>'OrderController@getIndex'));
Route::get('/order', array('before'=>'auth.basic','uses'=>'OrderController@postOrder'));

/* USER'S ORDERS*/

Route::get('worker','WorkerPanelController@checkLoginStatus')->name('worker');
Route::get('ship_order/{id_order}','WorkerPanelController@shipOrder')->name('shipOrder');
Route::get('confirm_order/{id_order}','WorkerPanelController@confirmOrder')->name('confirmOrder');
Route::get('cancel_order/{id_order}','WorkerPanelController@cancelOrder')->name('cancelOrder');
Route::get('invoice/{id_order}', 'InvoiceController@invoice')->name('invoice');

/* USER'S Coupons*/
Route::post('/coupon','CouponsController@store')->name('coupon.store');
Route::delete('/coupon','CouponsController@destroy')->name('coupon.destroy');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get('product/{Name}',array('before'=>'auth.basic','as'  => 'show.product','uses'=>'ProductController@show'));



