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
If you decide to clone this project, you will need to make an .env file:

rename .env.example .env<br>
composer update<br>
php artisan key:generate<br>

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
    Available features:<br>
    a) Add to cart<br>

5. <b>Admin Panel</b><br>
    Page is available at the address "http://127.0.0.1:8000/admin/login". You must have administrator privileges to log in.<br>
    Available features:<br>
    a) Products - CRUD<br>
    b) Users - CRUD<br>
    
6. <b>Worker Panel</b><br>
    Page is available at the address "http://127.0.0.1:8000/worker". You must have worker privileges to log in.<br>
    Available features:<br>
    a) Show user's orders<br>
    b) Invoices<br>
    ![image](https://user-images.githubusercontent.com/26176166/58289265-3a786780-7db6-11e9-8918-cf700c0cc139.png)<br><br>
    b) Сhange the status of the order<br>
    ![image](https://user-images.githubusercontent.com/26176166/57583973-7407c380-74d6-11e9-9b3a-52f79b88b341.png)
    
    c) Automatic sending of messages to the client after changing the status of the order<br>
    ![image](https://user-images.githubusercontent.com/26176166/57584044-4707e080-74d7-11e9-885e-647c746b81ac.png)
    ![image](https://user-images.githubusercontent.com/26176166/57584113-107e9580-74d8-11e9-814d-cfbc3c71616f.png)<br>
    ![image](https://user-images.githubusercontent.com/26176166/57584198-dfeb2b80-74d8-11e9-9331-0c40e00441d5.png)<br>
    ![image](https://user-images.githubusercontent.com/26176166/57584411-4a9d6680-74db-11e9-89b9-1b9fae315668.png)









    


7. <b>Cart and making orders</b><br>
    Page is available at the address "http://127.0.0.1:8000/cart"<br>
    Available features:<br>
    a) Remove products from cart<br>
    b) Change number of ordering products<br>
    c) Submit the order<br>
    
8. <b>Orders</b><br>
    Page is available at the address "http://127.0.0.1:8000/user/orders" after login. You can look at your orders history
    
    
   
   





