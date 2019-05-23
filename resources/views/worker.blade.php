<!DOCTYPE html>
<html lang="en">
<head>
    <title>Orders</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-header" style="background-color: #222;
    border-color: #080808; width:100%; height: 100px;">
    <div class="navbar-header" >
        <nav class="navbar navbar-light bg-light" >
            <a class="navbar-brand" href="{{url('products') }}" style="padding-bottom:15px" >
                <img src="../images/logo.png" width="75" height="75" alt="">
            </a>
        </nav>
    </div>
    <ul class=" navbar-header navbar-nav  navbar-light bg-light navbar-right" style="
    																				margin-left: 0;
        																			padding-left: 0;
    																				padding-top: 20px;
    																				margin-right:10px;
    																				size:30px;">
        <li style="list-style-type: none;">
            <a href="{{action('LoginController@logout')}}" class="navbar-brand" style="font-size:18px;margin-right:5px;">
                <span class="glyphicon glyphicon-log-in d-inline-block align-top" style="margin-right:8px;"></span>Log out
            </a>
        </li>
    </ul>
</nav>
<div class="col-md-6">
    <h1>Panel pracownika - {{ Session::get('name') }}</h1><br>
    @if(session('alert_error'))
        <div class="alert alert-danger">
            {{ session('alert_error') }}
        </div>
    @endif
    @if(session('alert'))
        <div class="alert alert-success">
            {{ session('alert') }}
        </div>
    @endif
    <div style=" margin: auto;">
        <table  class="table table-bordered" cellspacing="0" width="100%">
            <tr>
                <th class="th-sm" rowspan="2">№</th>
                <th class="th-sm" rowspan="2">Czas zamówienia</th>
                <th class="th-sm" colspan="6">Dane klienta</th>
                <th class="th-sm" rowspan="2">Do zapłaty</th>
                <th class="th-sm" rowspan="2">Status</th>
                <th class="th-sm" rowspan="2">Wysłanie zamówienia</th>
                <th class="th-sm" rowspan="2">Zatwierdzenie zamówienia</th>
                <th class="th-sm" rowspan="2">Generowanie faktury</th>
                <th class="th-sm" rowspan="2">Anulowanie zamówienia</th>
            </tr>

            <tr>
                <th class="th-sm">Klient</th>
                <th class="th-sm">Adres</th>
                <th class="th-sm">Kod pocztowy</th>
                <th class="th-sm">Miasto</th>
                <th class="th-sm">Numer telefonu</th>
                <th class="th-sm">E-mail</th>
            </tr>
            @foreach($orders as $order)
                <tr><td style="white-space:nowrap;font-size:11px">{{$order->id}}</td>
                    <td style="white-space:nowrap;font-size:11px">{{$order->created_at}}</td>
                    <td style="white-space:nowrap;font-size:11px">{{$order->name}}  {{$order->surname}}</td>
                    <td style="white-space:nowrap;font-size:11px">{{$order->address}}</td>
                    <td style="white-space:nowrap;font-size:11px">{{$order->postalcode}}</td>
                    <td style="white-space:nowrap;font-size:11px">{{$order->cityName}}</td>
                    <td style="white-space:nowrap;font-size:11px">{{$order->phonenumber}}</td>
                    <td style="white-space:nowrap;font-size:11px">{{$order->email}}</td>
                    <td style="white-space:nowrap;font-size:11px">{{$order->total}}</td>
                    <td style="white-space:nowrap;font-size:11px">{{$order->type}}</td>

                    <td>
                        <a class="btn btn-primary btn-xs" href="{{ route('shipOrder', $order->id) }}">
                            <span class="glyphicon glyphicon-send"></span>Wysłać</a>
                    </td>
                    <td>
                        <a class="btn btn-success btn-xs" href="{{ route('confirmOrder', $order->id) }}">
                            <span class="glyphicon glyphicon-edit"></span>Zatwierdzić</a>
                    </td>
                    <td>
                        <a class="btn btn-info btn-xs" href="{{ route('invoice', $order->id) }}">
                            <span class="glyphicon glyphicon-file"></span>Faktura</a>
                    </td>
                    <td>
                        <a class="btn btn-danger btn-xs" href="{{ route('cancelOrder', $order->id) }}">
                            <span class="glyphicon glyphicon-trash"></span>Anulować</a>
                    </td>
                </tr>
            @endforeach
        </table>
    </div>
</div>
</body>
</html>
