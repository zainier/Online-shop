@extends('layout')

@section('title', 'Shopping Cart')

@section('extra-css')
    <link rel="stylesheet" href="{{ asset('css/algolia.css') }}">
@endsection

@section('content')

    @component('components.breadcrumbs')
        <a href="#">Home</a>
        <i class="fa fa-chevron-right breadcrumb-separator"></i>
        <span>Koszyk</span>
    @endcomponent

    <div class="cart-section container">
        <div>
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

            @if ($cart_count > 0)

            <h2>{{ $cart_count }} item(s) in Shopping Cart</h2>

            <div class="cart-table">
                @foreach($cart_products as $item)
                <div class="cart-table-row">
                    <div class="cart-table-row-left">
                        <a href="{{ route('show.product', $item->Products->Name) }}">
                        <img src='{{url('../images/products/'.$item->Products->Name.'.jpg')}}' alt="{{$item->Products->Name}}" class="cart-table-img"></a>
                        <div class="cart-item-details">
                            <div class="cart-table-item"><a href="{{ route('show.product', $item->Products->Name) }}">{{ $item->Products->Name }}</a></div>
                            <div class="cart-table-description">{{ $item->Products->Value }} zł</div>
                        </div>
                    </div>
                    <div class="cart-table-row-right">
                        <div class="cart-table-actions">
                            <a href="{{URL::route('delete_product_from_cart',array($item->id))}}">Usuń</a>
                        </div>
                        <div>

                            <form action="/cart/update" method="post" class="form-inline" style="width:60%">
                            {!! csrf_field() !!}
                                <input type="hidden" name="product" value="{{$item->Products->Id_Product}}" />
                                <input type="hidden" name="cart_id" value="{{$item->id}}" />
                                <input type="hidden" name="value" value="{{$item->Products->Value}}" />
                                    <select name="amount"  class="form-control form-control-lg quantity" title="Cart Quantity" style="width:60%">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                            <button class="btn btn-sm btn-default"><i class="fa fa-refresh" aria-hidden="true">Zmień</i></button>
                            </form>


                        </div>
                        <div>{{$item->total}} zł</div>
                    </div>
                </div> <!-- end cart-table-row -->
                @endforeach

            </div> <!-- end cart-table -->

            @if (! session()->has('coupon'))

                <a href="#" class="have-code">Masz kupon? Nie czakaj i korzystaj się!</a>

                <div class="have-code-container">
                    <form action="{{ route('coupon.store') }}" method="POST">
                        {{ csrf_field() }}
                        <input type="text" name="coupon_code" id="coupon_code">
                        <button type="submit" class="button button-plain">Apply</button>
                    </form>
                </div> <!-- end have-code-container -->
            @endif

            <div class="cart-totals">
                <div class="cart-totals-left">
                </div>

                <div class="cart-totals-right">
                    <div>
                        Subtotal <br>
                        @if (session()->has('coupon'))
                            Code ({{ session()->get('coupon')['name'] }})
                            <form action="{{ route('coupon.destroy') }}" method="POST" style="display:block">
                               {{ csrf_field() }}
                               {{ method_field('delete') }}
                               <button type="submit" style="font-size:14px;">Usuń</button>
                           </form>
                            <hr>
                            New Subtotal <br>
                        @endif

                        <span class="cart-totals-total">Total</span>
                    </div>
                    <div class="cart-totals-subtotal">

                        @if (session()->has('coupon'))
                            -{{ presentPrice($discount)+1 }} <br>&nbsp;<br>
                            <hr>
                            {{ presentPrice($newSubtotal)+1 }} <br>
                        @endif
                        <br>
                        <span class="cart-totals-total">{{ $cart_total }} zł</span>
                    </div>
                </div>
            </div> <!-- end cart-totals -->

            <div class="cart-buttons">
                <a href="{{ route('shop.index') }}" class="button">Continue Shopping</a>
                <a href="{{ route('checkout.index') }}" class="button-primary">Proceed to Checkout</a>
            </div>

            @else

                <h3>No items in Cart!</h3>
                <div class="spacer"></div>
                <a href="{{ route('shop.index') }}" class="button">Continue Shopping</a>
                <div class="spacer"></div>

            @endif

@include('partials.might-like')



        </div>

    </div> <!-- end cart-section -->




@endsection

@section('extra-js')
    <script src="{{ asset('js/app.js') }}"></script>
    <script>

    </script>

    <!-- Include AlgoliaSearch JS Client and autocomplete.js library -->
    <script src="https://cdn.jsdelivr.net/algoliasearch/3/algoliasearch.min.js"></script>
    <script src="https://cdn.jsdelivr.net/autocomplete.js/0/autocomplete.min.js"></script>
    <script src="{{ asset('js/algolia.js') }}"></script>
@endsection
