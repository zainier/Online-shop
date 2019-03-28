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
@include('includes.header')
<div class="container">
    <div class="row" style="background:#dddddd">
        @foreach($products as $product)
        <div class='col-md-3' style='color:red; background:#dddddd'>
            <div class='col-md-12 single-item noPadding' style='background:white'>
                <div class='top' style='padding-top:15px;'>
                    <img src='{{url('../images/products/'.$product->Name.'.jpg')}}' height=150px width=200px>
                </div>
                <div class='bottom'>
                    <h3 class='item-title' align='center'>
                        <a href='item.php?item_title=$item_title&item_id=$rows[ProductID]'><b>{{$product->Name}}</b></a>
                        </h3>
                        <div class='pull-right' style='font-size:20px; margin-right:20px;'><b>{{$product->Value}} zl</b></div>
                        <div class='clearfix'></div>
                </div>
            </div>
        </div>
            @endforeach
    </div>
</div><br><br><br><br><br><br><br>
@include('includes.footer')
</body>
</html>
