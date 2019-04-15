<?php
Class Order extends Eloquent {

protected $table = 'orders';

protected $fillable = array('user_id','address','total');

public function orderItems()
    {
        return $this->belongsToMany('App\Product') ->withPivot('amount','total');
    }

}
