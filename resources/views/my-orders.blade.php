@extends('layout')

@section('title', 'Historia zakupow')

@section('extra-css')
    <link rel="stylesheet" href="{{ asset('css/algolia.css') }}">
@endsection

@section('content')

    @component('components.breadcrumbs')
        <a href="/">Home</a>
        <i class="fa fa-chevron-right breadcrumb-separator"></i>
        <span>Historia zakupow</span>
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

    <div class="products-section my-orders container">
        <div class="sidebar">

            <ul>
                <li class="active"><a href="{{url('profile')}}">Moje konto</a></li>
                <li><a href="{{URL::route('orders')}}">Historia zakupow</a></li>
            </ul>
        </div> <!-- end sidebar -->
        <div class="my-profile">
            <div class="products-header">
                <h1 class="stylish-heading">Historia zakupow</h1>
            </div>

            <div>
                @foreach($orders as $order)
                <div class="order-container">
                    <div class="order-header">
                        <div class="order-header-items">
                            <div>
                                <div class="uppercase font-bold">Data złożenia</div>
                                <div>{{ presentDate($order->created_at) }}</div>
                            </div>
                            <div>
                                <div class="uppercase font-bold">Numer zamowienia</div>
                                <div>{{ $order->id }}</div>
                            </div><div>
                                <div class="uppercase font-bold">Łączna cena</div>
                                <div>{{ $order->total }}</div>
                            </div>
                        </div>
                        <div>
                            <div class="order-header-items">

                                <div>|</div>
                                <div><a href="#">Faktura</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="order-products">
                        @foreach($order->orderItems  as $product)
                            <div class="order-product-item">
                                <div><img src='{{url('../images/products/'.$product->Name.'.jpg')}}' alt="Product Image"></div>
                                <div>
                                    <div>
                                        <a href="{{ route('show.product', $product->Name) }}">{{ $product->Name }}</a>
                                    </div>
                                    <div>Cena: {{ $product->Value }}\{{ $product->UnitOfMeasurement }}</div>
                                    <div>Ilość: {{ $product->pivot->amount }}</div>
                                </div>
                            </div>
                        @endforeach

                    </div>
                </div> <!-- end order-container -->
                @endforeach
            </div>

            <div class="spacer"></div>
        </div>
    </div>

@endsection

@section('extra-js')
    <!-- Include AlgoliaSearch JS Client and autocomplete.js library -->
    <script src="https://cdn.jsdelivr.net/algoliasearch/3/algoliasearch.min.js"></script>
    <script src="https://cdn.jsdelivr.net/autocomplete.js/0/autocomplete.min.js"></script>
    <script src="{{ asset('js/algolia.js') }}"></script>
@endsection
