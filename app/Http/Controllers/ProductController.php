<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function loadProducts($products = null){
        if(is_null($products)){
            $products = \DB::table('products')->get()->all();
        }
        else{
            $products = \DB::table('products')
                ->join('categories', 'products.Id_Category', '=', 'categories.Id_Category')
                ->where('CategoryName', '=', $products)
                ->get()->all();
        }
        $categories = $this->loadCategories();
        return view('products', ['products' => $products],['categories' => $categories]);
    }

    public function loadCategories(){
        $categories = \DB::table('categories')->pluck('Id_Category','CategoryName');
        return $categories;
    }
}
