<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'category_id','root_category', 'name', 'description1','description2', 'deal_code', 'phone_no', 'image', 'image2', 'qty','stockUnit', 'price', 'weight', 'discount', 'status','youtubeLink','productSection','tag','metaTitle','metaKeyword','metaDescription','orderBy'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'created_at', 'updated_at',
    ];

   
    public function setRouteKeyName(){
        return 'name';
    }
}