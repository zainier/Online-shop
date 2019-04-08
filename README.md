<p align="center"><img src="https://laravel.com/assets/img/components/logo-laravel.svg"></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/license.svg" alt="License"></a>
</p>

## About Project

Web system for shopping online at the supermarket «U Jacka»

front-end: HTML3, CSS5(Framework Bootstrap 4.2.1), JS<br/>
back-end: Laravel 5.8<br/>
DB: MySQL(phpMyAdmin) <br/>
Server: Apache HTTP Server<br/>
Server control: XAMPP<br/>


## Serving Laravel

HTTP-server will listen to port 8000. Starting a server - "php artisan serve" in cmd.<br>
DataBase will listen to port 8080. Starting a server - run Apache and MySQL module in XAMPP Control Panel.

## Functionality

1. <b>Registration</b><br>
   Registration is available at the address "http://127.0.0.1:8000/registration"<br>
   The following data is required for registration:<br>
   a) Name and Surname<br>
   b) Sex<br>
   c) Email (must be unique)<br>
   d) Password<br>
   e) Phone number<br>
   f) Adress<br>
   g) Postal code<br>
   h) City (select from the list)<br>
   
2. <b>Sign in</b><br>
    This is the initial page and available at the address "http://127.0.0.1:8000"<br>
    The following data is required for Sign in:<br>
    a) Email<br>
    b) Password<br>
    
3. <b>Sign out</b><br>
    Operation eliminates the current session and redirects user to <i>Sign in</i> page
 
4. <b>Product catalog</b><br>
    Page is available at the address "http://127.0.0.1:8000/products" after login. Highlights all available products in the store. You can choose a specific category of products from the menu.
5. <b>Admin Panel</b><br>
    Page is available at the address "http://127.0.0.1:8000/admin/login". You must have administrator privileges to log in.<br>
    Available features:<br>
    a) Products - CRUD
    
   
    
    
   
   





