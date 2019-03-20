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

Route::get('/registration', 'RegistersController@getCities', function () {
    return view('register');
});

Route::get('/', function () {
    return view('login');
});

Route::get('/register', 'RegistersController@register');

Route::get('/login', 'LoginController@login');


