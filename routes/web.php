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
/* Cart */

Route::get('/cart', array('before'=>'auth.basic','as'=>'cart','uses'=>'CartController@getIndex'));
Route::post('/cart/add', array('before'=>'auth.basic','uses'=>'CartController@postAddToCart'));
Route::get('/cart/delete/{id}', array('before'=>'auth.basic','as'=>'delete_product_from_cart','uses'=>'CartController@getDelete'));
Route::post('/cart/update', array('before'=>'auth.basic','as'=>'update','uses'=>'CartController@update'));

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get('product/{Name}', [
    'uses' => '\App\Http\Controllers\ProductController@show',
    'as'   => 'show.product',
]);
