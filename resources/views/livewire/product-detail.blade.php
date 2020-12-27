<div class="container">
	<div class="row mb-2">
		<div class="col">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="{{ route('home') }}" class="text-dark">Home</a></li>
					<li class="breadcrumb-item"><a href="{{ route('products') }}" class="text-dark">List Sepatu</a></li>
					<li class="breadcrumb-item active" aria-current="page">Sepatu Detail</li>
				</ol>
			</nav>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			@if(session()->has('message'))
			<div class="alert alert-success">
				{{ session('message') }}
			</div>
			@endif
		</div>
	</div>

	<div class="row">
		<div class="col-md-6">
			<div class="card detail-product">
				<div class="card-body">
					<img src="{{ url('assets/product') }}/{{ $product->gambar }}" alt="Product Image" class="img-fluid w-100">
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<h2><strong>{{ $product->nama }}</strong></h2>
			<h4>Rp. {{ number_format($product->harga) }}</h4>
			<h5>
				@if ($product->is_ready == 1)
				<span class="badge badge-success"> <i class="fas fa-check"></i> Ready Stok</span>
				@else
				<span class="badge badge-danger"> <i class="fas fa-times"></i> Stok Habis</span>
				@endif
			</h5>
			<hr>
			<div class="row">
				<div class="col">
					<form wire:submit.prevent="masukkanKeranjang">
						<table class="table" style="border-top : hidden">
							<tr>
								<td>Brand</td>
								<td>:</td>
								<td>
									<img src="{{ url('assets/brand') }}/{{ $product->brand->gambar }}" alt="Brand Image" class="img-fluid"
										width="50">
								</td>
							</tr>
							<tr>
								<td>Warna</td>
								<td>:</td>
								<td>
									{{ $product->warna }}
								</td>
							</tr>
							<tr>
								<td>Jumlah</td>
								<td>:</td>
								<td>
									<input id="jumlah_pesanan" type="number"
										class="form-control @error('jumlah_pesanan') is-invalid @enderror" wire:model="jumlah_pesanan"
										value="{{ old('jumlah_pesanan') }}" autocomplete="jumlah_pesanan" autofocus>

									@error('jumlah_pesanan')
									<span class="invalid-feedback" role="alert">
										<strong>{{ $message }}</strong>
									</span>
									@enderror
								</td>
							</tr>
							<tr>
								<td>Ukuran Sepatu</td>
								<td>:</td>
								<td>
									<input id="nomer_sepatu" type="number"
										class="form-control @error('nomer_sepatu') is-invalid @enderror" wire:model="nomer_sepatu"
										value="{{ old('nomer_sepatu') }}" autocomplete="nomer_sepatu" autofocus>

									@error('nomer_sepatu')
									<span class="invalid-feedback" role="alert">
										<strong>{{ $message }}</strong>
									</span>
									@enderror
								</td>
							</tr>
							<tr>
								<td>Deskripsi</td>
								<td>:</td>
								<td class="text-justify">
									{{ $product->deskripsi }}
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<button type="submit" class="btn btn-dark btn-block" @if($product->is_ready !== 1) disabled @endif >
										<i class="fas fa-shopping-cart"></i> Masukan
										Keranjang
									</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>