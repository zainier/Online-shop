<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Sklep internetowy U Jacka </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/bootstrap.js"></script>


</head>
<body style="background:#dddddd">
@include('includes/header')
<div class="container" style="width:80%">
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">Wprowadź nowe dane</h2>
                    <h4 class = "form-signin-heading" align="center" style="color:red;">
                        @if(count($errors) > 0)
                            @foreach($errors->all() as $error)
                                {{$error}}
                            @endforeach
                        @endif
                    </h4>
                </div>
                <div class="card-body">
                    <form method="POST" action = "{{ url('/editEmail') }}">@csrf

                        <div class="form-row">
                            <div class="name">Email</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="email" name="Email">
                                    <label class="label--desc">Email</label>
                                </div>
                            </div>
                        </div>
                            <button class="btn btn--radius-2 btn--red" type="submit" name="submit">Edytuj</button>
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
                        <button class="btn btn--radius-2 btn--red" type="submit" name="submit">Edytuj</button>
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
                        <button class="btn btn--radius-2 btn--red" type="submit" name="submit">Edytuj</button>
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
                        <button class="btn btn--radius-2 btn--red" type="submit" name="submit">Edytuj</button>
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
                        <button class="btn btn--radius-2 btn--red" type="submit" name="submit">Edytuj</button>
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
                        <button class="btn btn--radius-2 btn--red" type="submit" name="submit">Edytuj</button>
                    </form>

                </div>
            </div>
        </div>
    </div>
    </div>
</div><br><br><br><br><br><br><br>
@include('includes.footer')
</body>
</html>
