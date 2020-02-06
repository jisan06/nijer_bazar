<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = [
        'checkout_id', 'product_id', 'qty', 'weight', 'price', 'discount'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'created_at', 'updated_at',
    ];

    public function checkout()
    {
        return $this->belongsTo(Checkout::class);
    }

    public function products()
    {
        return $this->hasMany(Product::class);
    }

    public function getRouteKeyName(){
        return 'name';
    }
}