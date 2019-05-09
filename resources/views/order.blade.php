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
@include('header')
<div class="container" style="width:60%">
    <h3>Your Orders</h3>
    <div class="menu">
        <div class="accordion">
            @foreach($orders as $order)
                <div class="accordion-group">
                    <div class="accordion-heading country">
                        @if(Auth::user()->admin)
                            <a class="accordion-toggle" data-toggle="collapse" href="#order{{$order->id}}">Order #{{$order->id}} - {{$order->User->name}} - {{$order->created_at}}</a>
                        @else
                            <a class="accordion-toggle" data-toggle="collapse" href="#order{{$order->id}}"> {{$order->created_at}}</a>
                        @endif
                    </div>
                    <div id="order{{$order->id}}" >
                        <div class="accordion-inner">
                            <table class="table table-striped table-condensed">
                                <thead>
                                <tr>
                                    <th>
                                        Nazwa produktu
                                    </th>
                                    <th>
                                        ilość
                                    </th>
                                    <th>
                                        Cena
                                    </th>
                                    <th>
                                        Całość
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($order->orderItems as $orderitem)
                                    <tr>
                                        <td>{{$orderitem->Name}}</td>
                                        <td>{{$orderitem->pivot->amount}}</td>
                                        <td>{{$orderitem->Value}}</td>
                                        <td>{{$orderitem->pivot->total}}</td>
                                    </tr>
                                @endforeach
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td><b>Całość</b></td>
                                    <td><b>{{$order->total}}</b></td>
                                </tr>
                                <tr>
                                    <td><b>Adres dostawy</b></td>
                                    <td>{{$order->address}}</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div><br><br><br><br><br><br><br>
@include('includes.footer')
</body>
</html>
