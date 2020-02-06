<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    protected $table = 'brands';
    protected $fillable = [
        'brandName','brandCoverImage','brandLogo', 'brandStatus', 'brandDescription',' 	brandProduct','metaTitle','metaKeyword','metaDescription','orderBy'
    ];

   
    protected $hidden = [
        'created_at', 'updated_at',
    ];

}