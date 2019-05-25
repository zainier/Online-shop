@extends('layout')

@section('title', $product->name)

@section('extra-css')
    <link rel="stylesheet" href="{{ asset('css/algolia.css') }}">
@endsection

@section('content')

    @component('components.breadcrumbs')
        <a href="/products">Home</a>
        <i class="fa fa-chevron-right breadcrumb-separator"></i>
        <span><a href="{{ route('shop.index') }}">Shop</a></span>
        <i class="fa fa-chevron-right breadcrumb-separator"></i>
        <span>{{ $categoryName }}</span>
        <i class="fa fa-chevron-right breadcrumb-separator"></i>
        <span>{{ $product->Name }}</span>
    @endcomponent

    <div class="container">
        @if (session()->has('success_message'))
            <div class="alert alert-success">
                {{ session()->get('success_message') }}
            </div>
        @endif

        @if(count($errors) > 0)
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
    </div>

    <div class="product-section container">
        <div>
            <div class="product-section-image">
                <img src='{{url('../images/products/'.$product->Name.'.jpg')}}' alt="{{$product->Name}}" class="active" id="currentImage">
            </div>
            <div class="product-section-images">
                <div class="product-section-thumbnail selected">
                    <img src='{{url('../images/products/'.$product->Name.'.jpg')}}' alt="{{$product->Name}}">
                </div>


            </div>
        </div>
        <div class="product-section-information">
            <h1 class="product-section-title">{{ $product->Name }}</h1>
            <div class="product-section-subtitle">{{ $product->details }}</div>
            <div>{!! $stockLevel !!}</div>
            <div class="product-section-price">{{ $product->Value }} zł / {{$product->UnitOfMeasurement}}</div>



            <p>&nbsp;</p>
            <form action="/cart/add"  type="hidden" name="add_to_cart" method="post" accept-charset="UTF-8">
                {!! csrf_field() !!}
                <input type="hidden" name="product" value="{{$product->Id_Product}}" />
                <div class="form-group">
                    <label for="exampleFormControlSelect1">Ile chcesz zamowić?</label>
                    <select class="form-control form-control-lg" name="amount" id="exampleFormControlSelect1">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                    </select>
                </div>

                <button type="submit" class="button button-plain">Dodaj do koszyka</button>
            </form>


        </div>
    </div> <!-- end product-section -->

    @include('partials.might-like')

@endsection

@section('extra-js')
    <script>
        (function(){
            const currentImage = document.querySelector('#currentImage');
            const images = document.querySelectorAll('.product-section-thumbnail');

            images.forEach((element) => element.addEventListener('click', thumbnailClick));

            function thumbnailClick(e) {
                currentImage.classList.remove('active');

                currentImage.addEventListener('transitionend', () => {
                    currentImage.src = this.querySelector('img').src;
                    currentImage.classList.add('active');
                })

                images.forEach((element) => element.classList.remove('selected'));
                this.classList.add('selected');
            }

        })();
    </script>

    <!-- Include AlgoliaSearch JS Client and autocomplete.js library -->
    <script src="https://cdn.jsdelivr.net/algoliasearch/3/algoliasearch.min.js"></script>
    <script src="https://cdn.jsdelivr.net/autocomplete.js/0/autocomplete.min.js"></script>
    <script src="{{ asset('js/algolia.js') }}"></script>

@endsection
