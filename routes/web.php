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

Route::get('welcome', function () {
    return "Welcome :)";
});

Route::post('register', 'RegisterController@register');

Route::post('login', 'LoginController@login');

Route::get('admin', function() {
    return 'Welcome Admin';
});

Route::get('worker', function() {
    return 'Welcome Worker';
});

Route::get('logout', 'LoginController@logout');


/* PRODUCTS AND CATEGORIES*/

Route::get('products','ProductController@checkLoginStatus');

Route::get('products/{category}','ProductController@checkLoginStatus')->name('category');