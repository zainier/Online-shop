<?php
namespace App\Http\Controllers;
use App\Product;
use App\Category;
use App\Cart;
use View;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use App\Http\Requests\ProductRequest;
use App\Http\Requests\ProductEditRequest;
class ProductController extends Controller
{
    public function countProductsInCart() {
            if (Auth::check()) {

                $user_id = Auth::user()->id;
                $cart_count = Cart::where('user_id', '=', $user_id)->count();
                return $cart_count;
            }
        }



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
        $cart_count = $this->countProductsInCart();
        $categories = Category::all();
        if (request()->category) {
            $categoryName = optional($categories->where('slug', request()->category)->first())->name;
        } else {
            //$products = Product::where('featured', true);
            $categoryName = 'Oferowane towary';
        }

        return View::make('product')
              ->with([
                  'products' => $products,
                  'cart_count'=>$cart_count,
                  'categories' => $categories,
                  'categoryName' => $categoryName
            ]);
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
        $product = Product::ProductLocatedAt($Name);
        $cart_count = $this->countProductsInCart();
        $stockLevel = getStockLevel($product->AmountAvailable );
        $mightAlsoLike = Product::mightAlsoLike()->get();
        $similar_product= \DB::table('products')->where('Id_Product', '!=', $product->Id_Product)
            ->where(function ($query) use ($product) {
                $query->where('Id_Category', '=', $product->Id_Category);
            })->get();
            $categories = $this->loadCategories();
        return View::make('selectedProduct')
            ->with('product',$product)
            ->with('similar_product',$similar_product)
            ->with('stockLevel',$stockLevel)
            ->with('mightAlsoLike', $mightAlsoLike)
            ->with('categories', $categories)
            ->with('cart_count',$cart_count);
    //return view('selectedProduct', compact('product', 'similar_product', 'categories'));
    }
}
