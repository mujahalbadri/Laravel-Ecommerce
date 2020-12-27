<div class="container">
	<div class="row mb-2">
		<div class="col">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="{{ route('home') }}" class="text-dark">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Keranjang</li>
				</ol>
			</nav>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			@if(session()->has('message'))
			<div class="alert alert-danger">
				{{ session('message') }}
			</div>
			@endif
		</div>
	</div>

	<div class="row">
		<div class="col">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<td class="text-center">No.</td>
							<td>Gambar</td>
							<td>Product</td>
							<td>Ukuran Sepatu</td>
							<td>Jumlah</td>
							<td>Harga</td>
							<td><strong>Total Harga</strong></td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						@forelse ($order_details as $order_detail)
						<tr>
							<td class="text-center">{{ $loop->iteration }}</td>
							<td><img src="{{ url('assets/product') }}/{{ $order_detail->product->gambar }}" alt="Product Image"
									class="img-fluid" width="200">
							</td>
							<td>{{ $order_detail->product->nama }}</td>
							<td>{{ $order_detail->nomer_sepatu }}</td>
							<td>{{ $order_detail->jumlah_pesanan }}</td>
							<td>Rp. {{ number_format($order_detail->product->harga) }}</td>
							<td><strong>Rp. {{ number_format($order_detail->total_harga) }}</strong>
							</td>
							<td>
								<i wire:click="destroy({{ $order_detail->id }})" class="fas fa-trash text-danger"></i>
							</td>
						</tr>
						@empty
						<tr>
							<td colspan="7" class="text-center">Keranjang Kosong</td>
						</tr>
						@endforelse

						@if (!empty($order))
						<tr>
							<td colspan="6" class="text-right">Total Harga : </td>
							<td><strong>Rp. {{ number_format($order->total_harga) }}</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="6" class="text-right">Kode Unik : </td>
							<td><strong>Rp. {{ number_format($order->kode_unik) }}</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="6" class="text-right">Total Yang harus dibayar : </td>
							<td><strong>Rp. {{ number_format($order->total_harga+$order->kode_unik) }}</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="6"></td>
							<td colspan="2">
								<a href="{{ route('checkout') }}" class="btn btn-success btn-block">
									<i class="fas fa-arrow-right"></i> Check Out
								</a>
							</td>
						</tr>
						@endif
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>