<?php

namespace App\Http\Livewire;

use App\Order;
use App\OrderDetail;
use App\Product;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class ProductDetail extends Component
{
    public $product, $jumlah_pesanan, $nomer_sepatu;

    public function mount($id)
    {
        $productDetail = Product::find($id);

        if ($productDetail) {
            $this->product = $productDetail;
        }
    }

    public function masukkanKeranjang()
    {
        $this->validate([
            'jumlah_pesanan' => 'required',
            'nomer_sepatu' => 'required|numeric|between:35,45',
        ]);

        // Validasi jika belum login
        if (!Auth::user()) {
            return redirect()->route('login');
        }

        // Menghitung total harga
        $total_harga = $this->jumlah_pesanan * $this->product->harga;

        // Cek apakah user punya data pesanan utama yang statusnya 0
        $pesanan = Order::where('user_id', Auth::user()->id)->where('status', 0)->first();

        // Menyimpan / Update Pesanan Utama
        if (empty($pesanan)) {
            Order::create([
                'user_id' => Auth::user()->id,
                'total_harga' => $total_harga,
                'status' => 0,
                'kode_unik' => mt_rand(100, 999),
            ]);

            $pesanan = Order::where('user_id', Auth::user()->id)->where('status', 0)->first();
            $pesanan->kode_pemesanan = 'AS-' . $pesanan->id;
            $pesanan->update();
        } else {
            $pesanan->total_harga = $pesanan->total_harga + $total_harga;
            $pesanan->update();
        }

        // Menyimpan pesanan detail
        OrderDetail::create([
            'product_id' => $this->product->id,
            'order_id' => $pesanan->id,
            'jumlah_pesanan' => $this->jumlah_pesanan,
            'nomer_sepatu' => $this->nomer_sepatu,
            'total_harga' => $total_harga
        ]);

        $this->emit('masukKeranjang');

        session()->flash('message', 'Sukses Masuk Keranjang');

        return redirect()->back();
    }

    public function render()
    {
        return view('livewire.product-detail');
    }
}