@extends('layout')

@section('title', 'Moje konto')

@section('extra-css')
    <link rel="stylesheet" href="{{ asset('css/algolia.css') }}">
@endsection

@section('content')

    @component('components.breadcrumbs')
        <a href="/">Home</a>
        <i class="fa fa-chevron-right breadcrumb-separator"></i>
        <span>Moje konto</span>
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

    <div class="products-section container">
        <div class="sidebar">

            <ul>
              <li class="active"><a href="{{url('profile')}}">Moje konto</a></li>
              <li><a href="{{URL::route('orders')}}">Historia zakupow</a></li>
            </ul>
        </div> <!-- end sidebar -->
        <div class="my-profile">
            <div class="products-header">
                <h1 class="stylish-heading">Moje konto</h1>
            </div>

            <div>

                <div class="card-body">
                    <form method="POST" action = "{{ url('/editEmail') }}">@csrf

                        <div class="form-row">
                            <div class="name">Email</div>
                            <div class="value">
                                <div class="input-group">
                                     <input id="email" type="email" name="Email" value="{{ old('email', $user->email) }}" placeholder="Email" >
                                    <label class="label--desc">Email</label>
                                </div>
                            </div>
                        </div>
                        <button class="button button-plain" type="submit" name="submit">
                            Edytuj
                        </button>
                    </form>
                    <form method="POST" action = "{{ url('/editPassword') }}">@csrf

                        <div class="form-row">
                            <div class="name">Hasło</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="password" name="Password">
                                    <label class="label--desc">Haslo</label>
                                </div>
                            </div>
                        </div>
                        <button class="button button-plain" type="submit" name="submit">
                            Edytuj
                        </button>
                    </form>
                    <form method="POST" action = "{{ url('/editPhoneNumber') }}">@csrf

                        <div class="form-row m-b-55">
                            <div class="name">Telefon</div>
                            <div class="value">
                                <div class="row row-refine">

                                    <div class="col-9">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="PhoneNumber">
                                            <label class="label--desc">Numer telefonu</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button class="button button-plain" type="submit" name="submit">
                            Edytuj
                        </button>
                    </form>
                    <form method="POST" action = "{{ url('/editAddress') }}">@csrf

                        <div class="form-row">
                            <div class="name">Adres</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="Address">
                                    <label class="label--desc">Adres</label>
                                </div>
                            </div>
                        </div>
                        <button class="button button-plain" type="submit" name="submit">
                            Edytuj
                        </button>
                    </form>
                    <form method="POST" action = "{{ url('/editPostalCode') }}">@csrf

                        <div class="form-row">
                            <div class="name">Kod pocztowy</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="PostalCode">
                                    <label class="label--desc">Kod pocztowy</label>
                                </div>
                            </div>
                        </div>
                        <button class="button button-plain" type="submit" name="submit">
                            Edytuj
                        </button>
                    </form>
                    <form method="POST" action = "{{ url('/editCity') }}">@csrf

                        <div class="form-row">
                            <div class="name">Twoje miasto</div>
                            <div class="value">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select id='item_category' name = 'Id_City' class='form-control' required>
                                            @foreach($cities as $city => $id )
                                                <option value="{{ $id }}">{{ $city }}</option>
                                            @endforeach
                                            <option disabled='disabled' selected='selected'>Wybierz swoje miasto</option></select>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button class="button button-plain" type="submit" name="submit">
                            Edytuj</i>
                        </button>
                    </form>

                </div>

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
