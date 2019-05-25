<?php
namespace App;
use Product;
use App\Http\Traits\CartTrait;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model {

    protected $table = 'carts';

    protected $fillable = [
        'user_id', 'Id_Product', 'amount', 'total',
    ];

    public function Products() {
        return $this->belongsTo('App\Product', 'Id_Product');
    }

    public function User() {
        return $this->belongsTo('App\User', 'user_id');
    }
    public function presentPrice($price)
  {
      $myPrice = self::money_format('$%i', $this->$price / 100);
     return $myPrice;
  }
}
