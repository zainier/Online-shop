<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Sklep internetowy U Jacka </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->

    <link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>

    <link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/app.css">
    <link rel="stylesheet" href="../css/style.css">

    <script src="../js/bootstrap.js"></script>
    <link rel="stylesheet" href="../css/algolia.css">
    <link rel="stylesheet" href="../css/responsive.css">


</head>
<body style="background:#dddddd">
@include('header')
<div class="container" style="width:60%">

    <div class="cart-section container">
            <div>
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
    @if (! session()->has('coupon'))

                   <a href="#" class="have-code">Have a Code?</a>

                   <div class="have-code-container">
                       <form action="{{ route('coupon.store') }}" method="POST">
                           {{ csrf_field() }}
                           <input type="text" name="coupon_code" id="coupon_code">
                           <button type="submit" class="button button-plain">Apply</button>
                       </form>
                   </div> <!-- end have-code-container -->
               @endif

               <div class="cart-totals">


                   <div class="cart-totals-right">
                       <div>
                           Całość: <br>
                           @if (session()->has('coupon'))
                               Zniżka: ({{ session()->get('coupon')['name'] }})
                               <form action="{{ route('coupon.destroy') }}" method="POST" style="display:block">
                                   {{ csrf_field() }}
                                   {{ method_field('delete') }}
                                   <button type="submit" style="font-size:14px;">Remove</button>
                               </form>
                               <br>
                           @endif
                           <span class="cart-totals-total">Total</span>
                       </div>
                       <div class="cart-totals-subtotal">
                            {{ $cart_total}} <br>
                           @if (session()->has('coupon'))
                               - {{ $discount }} zl<br>
                               <hr>
                               {{ $cart_total - $discount }} <br>
                           @endif
                       </div>
                   </div>
</div>


</div><br><br><br><br><br><br><br>
@include('includes.footer')
</body>
</html>
