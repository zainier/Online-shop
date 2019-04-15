<?php
namespace App;
use App\ProductPhoto;
use App\Brand;
use App\Category;
use Illuminate\Database\Eloquent\Model;
class Product extends Model {
    protected $primaryKey = 'Id_Product';
    protected $table = 'products';
    protected $fillable = [
        'Id_Category',
        'Name',
        'NajlepszaOferta',
        'UnitOfMeasurement',
        'Value',
        'AmountAvailable',
    ];
    //protected $gaurded = ['id'];
    /**
     * One Product can have one Category.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function category() {
        return $this->hasOne('App\Category', 'id');
    }
    /**
     * One Product can have many photos.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function photos() {
        return $this->hasMany('App\ProductPhoto');
    }
    /**
     * Return a product can have one featured photo where "featured" column = true (or 1)
     *
     * @return mixed
     */
    /*public function featuredPhoto() {
        return $this->hasOne('App\ProductPhoto')->whereFeatured(true);
    }
*/
    /**
     * Show a product when clicked on (Admin side).
     *
     * @param $id
     * @return mixed
     */
   /* public static function LocatedAt($id) {
        return static::where(compact('id'))->firstOrFail();
    }
*/
    /**
     * Show a Product when clicked on.
     *
     * @param $Name
     * @return mixed
     */
   public static function ProductLocatedAt($Name) {
        return static::where(compact('Name'))->firstOrFail();
    }
}
