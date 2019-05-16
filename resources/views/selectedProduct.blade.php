<!DOCTYPE html>
<html lang="pl">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Sklep internetowy U Jacka | Informacja o produkcie</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
    <link rel="stylesheet" href="../css/font-awesome.css">
    <link rel="stylesheet" href="../css/responsive.css">
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
    @include('header')


<div class="container">

    <div class="row" >

					<div class='col-md-4' style='height:400px; '>
						<h3 class='pp-title'><b>{{$product->Name}}</b></h3>
						<div class='top' style='height:300px; width:400px;  '><img src='{{url('../images/products/'.$product->Name.'.jpg')}}' height=300px width=400px style='border-radius:8px;'></div>
						<div style='text-align:right; font-size:30px; color:red;'><b>{{$product->Value}} zł / {{$product->UnitOfMeasurement}}</b></div>
					</div>
                    <div class='col-md-4'>
                    </div>
        <ul class="list-group" >
            <aside class="col-md-4" style="margin-left:350px;  ">
                <ul class="list-group" >
                    <li class="list-group-item">
                        <div class="row" style="background:#fafafa; border-radius:15px;" >
                        <form action="/cart/add"  type="hidden" name="add_to_cart" method="post" accept-charset="UTF-8">
                            {!! csrf_field() !!}
                            <input type="hidden" name="product" value="{{$product->Id_Product}}" />
                            <select class='form-control' name="amount" style="width: ;">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                            <p align="center"><button class="btn btn-success">Dodaj do koszyka</button></p>
                        </form>

                    </div>
                    </li>
                </ul>
            </aside>

            <aside class="col-md-4" style="margin-left:350px;  ">
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


                 <div class="col-sm-12 col-md-6 " style="margin-top:175px; margin-right: 800px; ">
                    <h3 class="text-left">SIMILAR PRODUCTS</h3><br>
                      @foreach($similar_product->slice(0, 4) as $similar)
                        <div class="col-xs-6 col-md-6 text-center">
                    <a href="{{ route('show.product', $similar->Name) }}">
                            <img src='{{url('../images/products/'.$similar->Name.'.jpg')}}' height=150px width=200px >
                            <p id="Similar-Title">{{ str_limit($similar->Name, $limit = 28, $end = '...') }}</p>

                    </a>
                </div>
            @endforeach
        </div>

    </div>

</div>

<br><br><br><br>
@include('includes.footer')
</body>
</html>
