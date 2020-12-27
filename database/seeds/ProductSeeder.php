<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('products')->insert([
            'nama' => 'Adidas Galaxy 5 Shoes',
            'harga' => 650000,
            'warna' => 'Hitam',
            'deskripsi' => 'Make every mile count. One mile, two miles or five, these adidas running shoes make each step a good one.',
            'gambar' => 'adidas_galaxy5.jpg',
            'brand_id' => 1
        ]);
    }
}