<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Option extends Model
{

    public $timestamps = false;


    public function OptionType(){
        return $this->hasMany(OptionType::class);

    }

}
