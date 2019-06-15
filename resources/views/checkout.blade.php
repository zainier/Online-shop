@extends('layout')

@section('title', 'Checkout')

@section('extra-css')
    <style>
        .mt-32 {
            margin-top: 32px;
        }
    </style>

    <script src="https://js.stripe.com/v3/"></script>

@endsection

@section('content')

    <div class="container">

        @if (session()->has('success_message'))
            <div class="spacer"></div>
            <div class="alert alert-success">
                {{ session()->get('success_message') }}
            </div>
        @endif

        @if(count($errors) > 0)
            <div class="spacer"></div>
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{!! $error !!}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <h1 class="checkout-heading stylish-heading">Checkout</h1>
        <div class="checkout-section">
            <div>
                <form action="/order" method="POST" id="payment-form">
                    {{ csrf_field() }}
                    <h2>Billing Details</h2>

                    <div class="form-group">
                        <label for="email">Email Address</label>
                        @if (auth()->user())
                            <input type="email" class="form-control" id="email" name="email"
                                   value="{{ auth()->user()->email }}" readonly>
                        @else
                            <input type="email" class="form-control" id="email" name="email" value="{{ old('email') }}"
                                   required>
                        @endif
                    </div>
                    <div class="form-group">
                        <label for="name">Name</label>
                        @if (auth()->user())
                            <input type="text" class="form-control" id="name" name="name"
                                   value="{{ auth()->user()->name }}" readonly>
                        @else
                            <input type="text" class="form-control" id="name" name="name" value="{{ old('name') }}"
                                   required>
                        @endif
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        @if (auth()->user())
                            <input type="text" class="form-control" id="address" name="address"
                                   value="{{ auth()->user()->address }}" readonly>
                        @else
                            <input type="text" class="form-control" id="address" name="address"
                                   value="{{ old('address') }}" required>
                        @endif
                    </div>

                    <div class="half-form">
                        <div class="form-group">
                            <label for="city">City</label>
                            <select id='item_category' name='Id_City' class='form-control' required>
                                @foreach($cities as $city => $id )
                                    <option value="{{ $id }}">{{ $city }}</option>
                                @endforeach
                                <option disabled='disabled' selected='selected'>Wybierz swoje miasto</option>
                            </select>
                            </select>
                        </div>
                    </div> <!-- end half-form -->

                    <div class="half-form">
                        <div class="form-group">
                            <label for="postalcode">Postal Code</label>
                            @if (auth()->user())
                                <input type="text" class="form-control" id="postalcode" name="postalcode"
                                       value="{{ auth()->user()->postalcode }}">
                            @else
                                <input type="text" class="form-control" id="postalcode" name="postalcode"
                                       value="{{ old('postalcode') }}">
                            @endif
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            @if (auth()->user())
                                <input type="text" class="form-control" id="phone" name="phone"
                                       value="{{ auth()->user()->phonenumber }}">
                            @else
                                <input type="text" class="form-control" id="phone" name="phone"
                                       value="{{ old('phone') }}" required>
                            @endif

                        </div>
                    </div> <!-- end half-form -->

                    <div class="spacer"></div>


                    <div class="form-group">

                        <div id="card-element">
                            <!-- a Stripe Element will be inserted here. -->
                        </div>

                        <!-- Used to display form errors -->
                        <div id="card-errors" role="alert"></div>
                    </div>
                    <div class="spacer"></div>

                    <button type="submit" id="complete-order" class="button-primary full-width">Complete Order</button>


                </form>


            </div>


            <div class="checkout-table-container">
                <h2>Your Order</h2>

                <div class="checkout-table">
                    @foreach ($cart_products as $item)
                        <div class="checkout-table-row">
                            <div class="checkout-table-row-left">
                                <img src='{{url('../images/products/'.$item->Products->Name.'.jpg')}}'
                                     alt="{{$item->Products->Name}}" class="cart-table-img" style="max-height:75px;">
                                <div class="cart-item-details">
                                    <div class="cart-table-item"><a
                                                href="{{ route('show.product', $item->Products->Name) }}">{{ $item->Products->Name }}</a>
                                    </div>
                                    <div class="cart-table-description">{{ $item->Products->Value }} zł</div>
                                </div>
                            </div> <!-- end checkout-table -->


                        </div> <!-- end checkout-table-row -->
                    @endforeach

                </div> <!-- end checkout-table -->

                <div class="checkout-totals">
                    <div class="checkout-totals-left">
                        <br>
                        @if (session()->has('coupon'))
                            Discount ({{ session()->get('coupon')['name'] }}) :
                            <br>
                            <hr>
                            New Subtotal <br>
                        @endif
                        <span class="checkout-totals-total">Total</span>
                        <div class="cart-totals-subtotal">
                            <span class="cart-totals-total">{{ $cart_total }} zł</span>
                        </div>

                    </div>

                    <div class="checkout-totals-right">
                        @if (session()->has('coupon'))
                            -{{ presentPrice($discount) }} <br>
                            <hr>
                            {{ presentPrice($newSubtotal) }} <br>
                        @endif


                    </div>
                </div> <!-- end checkout-totals -->
            </div>

        </div> <!-- end checkout-section -->
    </div>

@endsection

@section('extra-js')
    <script src="https://js.braintreegateway.com/web/dropin/1.13.0/js/dropin.min.js"></script>

@endsection