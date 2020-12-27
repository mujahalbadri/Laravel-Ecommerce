<?php

namespace App\Http\Livewire;

use App\Brand;
use Livewire\Component;

class Navbar extends Component
{
    public function render()
    {
        return view('livewire.navbar', [
            'brands' => Brand::all()
        ]);
    }
}