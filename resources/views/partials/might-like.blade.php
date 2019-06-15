<div class="might-like-section">
    <div class="container">
        <h2>Może Ci się spodobać również...</h2>
        <div class="might-like-grid">
            @foreach ($mightAlsoLike as $product)
                <a href="{{ route('show.product', $product->Name) }}" class="might-like-product">
                    <img src='{{url('../images/products/'.$product->Name.'.jpg')}}' alt="{{$product->Name}}">
                    <div class="might-like-product-name">{{ $product->Name }}</div>
                    <div class="might-like-product-price">{{ $product->Value }} zł / {{$product->UnitOfMeasurement}}</div>
                </a>
            @endforeach

        </div>
    </div>
</div>
