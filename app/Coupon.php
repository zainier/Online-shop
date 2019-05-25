<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    protected $table = 'coupons';

    protected $fillable = [
        'id', 'code', 'type', 'value', 'percent_off',
    ];
    public static function findByCode($code){
        return self::where('code', $code)->first();
    }

    public  function discount($total){
        if($this->type == 'fixed'){
        return $this->value;
    }elseif($this->type == 'percent'){
        return round(($this->percent_off / 100) * $total);
    }
    }
}
