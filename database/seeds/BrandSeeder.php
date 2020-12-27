<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BrandSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('brands')->insert([
            'nama' => 'Adidas',
            'gambar' => 'adidas.png'
        ]);

        DB::table('brands')->insert([
            'nama' => 'Nike',
            'gambar' => 'nike.png'
        ]);

        DB::table('brands')->insert([
            'nama' => 'Puma',
            'gambar' => 'puma.png'
        ]);

        DB::table('brands')->insert([
            'nama' => 'New Balance',
            'gambar' => 'nb.png'
        ]);
    }
}