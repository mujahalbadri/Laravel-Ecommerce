<?php

namespace App\Http\Livewire;

use App\Order;
use App\User;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class Checkout extends Component
{
    public $total_harga, $nohp, $alamat;

    public function mount()
    {
        if (!Auth::user()) {
            return redirect()->route('login');
        }

        $this->nohp = Auth::user()->nohp;
        $this->alamat = Auth::user()->alamat;

        $order = Order::where('user_id', Auth::user()->id)->where('status', 0)->first();

        if (!empty($order)) {
            $this->total_harga = $order->total_harga + $order->kode_unik;
        } else {
            return redirect()->route('home');
        }
    }

    public function checkout()
    {
        $this->validate([
            'nohp' => 'required|numeric',
            'alamat' => 'required'
        ]);

        // Simpan no hp dan alamat ke data user
        $user = User::where('id', Auth::user()->id)->first();
        $user->nohp = $this->nohp;
        $user->alamat = $this->alamat;
        $user->update();

        // Update data order
        $order = Order::where('user_id', Auth::user()->id)->where('status', 0)->first();
        $order->status = 1;
        $order->update();

        $this->emit('masukKeranjang');

        session()->flash('message', 'Checkout Sukses');

        return redirect()->route('history');
    }

    public function render()
    {
        return view('livewire.checkout');
    }
}