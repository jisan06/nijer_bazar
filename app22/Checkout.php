<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Checkout extends Model
{
    use SoftDeletes;
    
    protected $fillable = [
        'shipping_id', 'customer_id', 'status'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'created_at', 'updated_at',
    ];

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    public function shipping()
    {
        return $this->belongsTo(Shipping::class);
    }

    public function orders()
    {
        return $this->hasMany(Order::class);
    }

    public function transaction()
    {
        return $this->hasOne(Transaction::class);
    }
}