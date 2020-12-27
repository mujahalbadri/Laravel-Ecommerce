<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    public function brand()
    {
        return $this->belongsTo(Brand::class, 'brand_id', 'id');
    }

    public function order_detail()
    {
        return $this->hasMany(OrderDetail::class, 'product_id', 'id');
    }
}