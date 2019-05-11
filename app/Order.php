<?php
namespace App;
use Illuminate\Database\Eloquent\Model;

Class Order extends Model {

protected $table = 'orders';

protected $fillable = array('user_id','address','total','id_status');

public function orderItems()
    {
        return $this->belongsToMany('App\Product','order_product','order_id', 'Id_Product' )->withPivot('amount','total');
    }

}
