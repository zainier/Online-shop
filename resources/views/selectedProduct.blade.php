<!DOCTYPE html>
<html lang="pl">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Sklep internetowy U Jacka | Informacja o produkcie</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
    <link rel="stylesheet" href="../css/font-awesome.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.js"></script>
    <style>
        .btn{
            font-size: 40px;
            height: 70px;
        }
    </style>
</head>
<body>


<div class="container">
    <div class="row" >
        <ol class="breadcrumb">
            <li><a href="{{url('/products')}}">Strona głowna</a></li>
            <li><a href='products.blade.php?category=$item_cat_id'>{{$product->Id_Category}}</a></li>
            <li class='active'><b>{{$product->ProductName}}</b></li>

        </ol>
    </div>
    <div class="row" >

					<div class='col-md-4' style='height:400px; '>
						<h3 class='pp-title'><b>{{$product->Name}}</b></h3>
						<div class='top' style='height:300px; width:400px;  '><img src='{{url('../images/products/'.$product->Name.'.jpg')}}' height=300px width=400px style='border-radius:8px;'></div>

						<div style='text-align:right; font-size:30px; color:red;'><b>{{$product->ProductValue}} zł / {{$product->UnitOfMeasurement}}</b></div>
					</div>







        <ul class="list-group" >
            <aside class="col-md-4" style="margin-left:350px;  ">

                <br>
                <ul class="list-group" >
                    <li class="list-group-item">
                        <div class="row" style="background:#fafafa; border-radius:15px;" >
                            <div class="col-md-3" ><i class="fa fa-phone fa-2x" style="padding-top: 25px;"></i></div>
                            <div class="col-md-9" >Masz wątpliwośći? <br>Zadzwoń <br> 123 123 123</div>
                        </div>
                    </li>
                </ul>
            </aside>
        </ul>
    </div>
    <br>
    <div class="page-header"  >
        <h2 style="">Inne propozycji</h2>
    </div>
    <div class="row" style='border-radius:8px;' >

    </div>
</div><br><br><br><br>
@include('includes.footer')
</body>
</html>
