<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Inventory_Adjustments extends Model
{
    protected $table ="inventory_adjustments";

    public function patient() {
        return $this->belongsTo('App\Inventory_Adjustments');
    }
}