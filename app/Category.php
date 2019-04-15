<?php
namespace App;
use Illuminate\Database\Eloquent\Model;
use App\Product;
class Category extends Model
{
    protected $table = 'categories';
    protected $fillable = ['category'];
    /**
     * One Category can have many Products.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function product() {
        return $this->hasMany('App\Product', 'Id_Product');
    }
}
