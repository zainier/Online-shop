<?php
namespace App\Http\Controllers;
use App\Product;
use App\Category;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use App\Http\Requests\ProductRequest;
use App\Http\Requests\ProductEditRequest;
class ProductController extends Controller
{
    public function loadProducts($products = null){
        if(is_null($products)){
            $products = \DB::table('products')->get()->all();
        }
        else{
            $products = \DB::table('products')
                ->join('categories', 'products.Id_Category', '=', 'categories.id')
                ->where('slug', '=', $products)
                ->get()->all();
        }
        $categories = $this->loadCategories();
        return view('products', ['products' => $products],['categories' => $categories]);
    }
    public function loadCategories(){
        $categories = \DB::table('categories')->select('name', 'slug')->get();
        return $categories;
    }
    public function checkLoginStatus($category = null){
        if(is_null(\Session::get('key'))){
            return redirect('/');
        }
        else{
            return $this->loadProducts($category);
        }
    }
    /**
     * Show a Product in detail
     *
     * @param $product_name
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function show($Name) {
        // Find the product by the product name in URL
        $product = Product::ProductLocatedAt($Name);
        // From Traits/CartTrait.php
        // ( Count how many items in Cart for signed in user )
       // $cart_count = $this->countProductsInCart();
        $similar_product = Product::where('Id_Product', '!=', $product->Id_Product)
            ->where(function ($query) use ($product) {
                $query->where('Id_Category', '=', $product->Id_Category);
            })->get();
        return view('selectedProduct', compact('product',  'categories', 'similar_product'));
    }
}
