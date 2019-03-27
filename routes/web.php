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

Route::get('/registration', 'RegistersController@getCities');

Route::get('/', function () {
    return view('login');
});

Route::get('welcome', function () {
    return "Welcome :)";
});

Route::post('/register', 'RegistersController@register');

Route::post('/login', 'LoginController@login');

Route::get('/admin', function() {
    return 'Welcome Admin';
});


Route::get('/worker', function() {
    return 'Welcome Worker';
});

Route::get('/products','CategoriesController@loadCategories');

//Route::get('/products','ProductsController@loadProducts');
