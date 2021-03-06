<div class="container">

	{{-- BANNER --}}
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="{{ url('assets/slider/slider1.png') }}" alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="{{ url('assets/slider/slider2.png') }}" alt="Second slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	{{-- PILIH BRAND --}}
	<section class="pilih-brand mt-4">
		<h3><strong>Pilih Brand</strong></h3>
		<div class="row mt-4">
			@foreach ($brands as $brand)
			<div class="col-md-3 mb-3">
				<a href="{{ route('products.brand', $brand->id ) }}">
					<div class="card shadow-sm">
						<div class="card-body text-center">
							<img src="{{ url('assets/brand') }}/{{ $brand->gambar }}" alt="Brand Image"
								class="img-fluid">
						</div>
					</div>
				</a>
			</div>
			@endforeach
		</div>
	</section>

	{{-- BEST PRODUCT --}}
	<section class="product mt-5 mb-5">
		<h3><strong>Best Products</strong>
			<a href="{{ route('products') }}" class="btn btn-dark float-right"><i class="fas fa-eye"></i> Lihat
				Semua</a>
		</h3>
		<div class="row mt-4">
			@foreach ($products as $product)
			<div class="col-md-3">
				<div class="card mb-3">
					<div class="card-body text-center">
						<img src="{{ url('assets/product') }}/{{ $product->gambar }}" alt="Best Product Image"
							class="img-fluid w-100">
						<div class="row mt-2">
							<div class="col-md-12">
								<h5><strong>{{ $product->nama }}</strong></h5>
								<h5>Rp. {{ number_format($product->harga) }}</h5>
							</div>
						</div>
						<div class="row mt-2">
							<div class="col-md-12">
								<a href="{{ route('products.detail', $product->id) }}"
									class="btn btn-dark btn-block">Detail</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			@endforeach
		</div>
	</section>
</div>