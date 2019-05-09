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
<div class="container">
    <div class="row" style="background:#dddddd">
        @foreach($products as $product)
        <div class='col-md-4' style='color:red; background:#dddddd'>
            <div class='col-md-12 single-item noPadding' style='background:white'>
                <div class='top' style='padding-top:15px;'>
                    <img src='{{url('../images/products/'.$product->Name.'.jpg')}}' height=150px width=200px>
                </div>
                <div class='bottom'>
                    <h3 class='item-title' align='center'>
                        <a href="{{ route('show.product', $product->Name) }}"><b>{{$product->Name}}</b></a>
                        <div>
                            <form action="/cart/add" name="add_to_cart" method="post" accept-charset="UTF-8">
                        {!! csrf_field() !!}
                        <input type="hidden" name="product" value="{{$product->Id_Product}}" />
                        <select name="amount" style="width: 100%;">
                             <option value="1">1</option>
                             <option value="2">2</option>
                             <option value="3">3</option>
                             <option value="4">4</option>
                             <option value="5">5</option>
                         </select>
                        <p align="center"><button class="btn btn-info btn-block">dodaj do koszyka</button></p>
                        </form>
                        </div>
                        <div class='pull-right' style='font-size:20px; margin-right:20px;'><b>{{$product->Value}} zl</b></div>
                        <div class='clearfix'></div>
                        </h3>


                </div>
            </div>
        </div>
            @endforeach
    </div>
</div><br><br><br><br><br><br><br>
@include('includes.footer')
</body>
</html>
