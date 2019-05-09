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
<div class="container" style="width:60%">


  <h1>Koszyk</h1>
  <table class="table">
    <tbody>
      <tr>
        <td>
          <b>Nazwa produktu</b>
        </td>
        <td>
          <b>ilość</b>
        </td>
        <td>
          <b>Usuń</b>
        </td>
        <td>
          <b>Cena</b>
        </td>
        <td>
          <b>Wartość</b>
        </td>
      </tr>
      @foreach($cart_products as $cart_item)
        <tr>
          <td>{{$cart_item->Products->Name}}</td>
          <td>
          <b>ilość: {{$cart_item->amount}}</b>
                <form action="/cart/update" method="post" class="form-inline" style="width:60%">
                {!! csrf_field() !!}
                    <input type="hidden" name="product" value="{{$cart_item->Products->Id_Product}}" />
                    <input type="hidden" name="cart_id" value="{{$cart_item->id}}" />
                    <input type="hidden" name="value" value="{{$cart_item->Products->Value}}" />
                        <select name="amount" class="form" title="Cart Quantity" style="width:60%">
                            <option value="" selected disabled hidden></option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
              <button class="btn btn-sm btn-default"><i class="fa fa-refresh" aria-hidden="true">Zmień</i></button>
             </form>
          </td>
          <td>
          <a href="{{URL::route('delete_product_from_cart',array($cart_item->id))}}">Usuń</a>
          </td>
          <td>
          {{$cart_item->Products->Value}}
          </td>
          <td>
          {{$cart_item->total}}
          </td>
        </tr>
      @endforeach
      <tr>
        <td>
        </td>
        <td>
        </td>
        <td>
        </td>
        <td>
          <b>Całość</b>
        </td>
        <td>
        <b>{{$cart_total}}</b>
        </td>
      </tr>
    </tbody>
  </table>
    <form action="/order" method="post" accept-charset="UTF-8">
        {!! csrf_field() !!}
        <button class="btn btn-block btn-primary btn-large">Place order</button>
    </form>
</div>


</div><br><br><br><br><br><br><br>
@include('includes.footer')
</body>
</html>
