<!doctype html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Invoice - #{{$identifier}}</title>

    <style type="text/css">
        @page {
            margin: 0px;
        }
        body {
            margin: 0px;
        }
        * {
            font-family: DejaVu Sans, Verdana, Arial, sans-serif;
        }
        a {
            color: #fff;
            text-decoration: none;
        }
        table {
            font-size: x-small;
        }
        tfoot tr td {
            font-weight: bold;
            font-size: x-small;
        }
        .invoice table {
            margin: 15px;
        }
        .invoice h3 {
            margin-left: 15px;
        }
        .information {
            background-color: #60A7A6;
            color: #FFF;
        }
        .information .logo {
            margin: 5px;
        }
        .information table {
            padding: 10px;
        }
    </style>

</head>
<body>

<div class="information">
    <table width="100%">
        <tr>
            <td align="left" style="width: 40%;">
                <h3>{{$name}} {{$surname}}</h3>
                <pre>
{{$address}}
{{$postalcode}} {{$city}}
Poland
<br /><br />
Date: {{$created_at}}
Status: Paid
</pre>

            </td>
            <td align="center">
                <img style="width: 120px" alt="logo" class="logo" src="{{ public_path('images\logo.png') }}">
            </td>
            <td align="right" style="width: 40%;">

                <h3>"U Jacka"</h3>
                <pre>
                    https://ujacka.com

                    Nowowiejska 26
                    67-019 Wroclaw
                    Poland
                </pre>
            </td>
        </tr>

    </table>
</div>


<br/>

<div class="invoice">
    <h3>Invoice specification #{{$identifier}}</h3>
    <table width="100%">
        <thead>
        <tr>
            <th>Description</th>
            <th>Quantity</th>
            <th>Total</th>
        </tr>
        </thead>
        <tbody>
        @foreach($products as $product)
            <tr>
                <td>{{$product->Name}}</td>
                <td>{{$product->amount}}</td>
                <td align="left">{{$product->total}} zl</td>
            </tr>
        @endforeach
        </tbody>

        <tfoot>
        <tr>
            <td colspan="1"></td>
            <td align="left">Total</td>
            <td align="left" class="gray">{{$price}} zl</td>
        </tr>
        </tfoot>
    </table>
</div>

<div class="information" style="position: absolute; bottom: 0;">
    <table width="100%">
        <tr>
            <td align="left" style="width: 50%;">
                &copy; {{ date('Y') }} {{ config('app.url') }} - All rights reserved.
            </td>
            <td align="right" style="width: 50%;">
                U Jacka
            </td>
        </tr>

    </table>
</div>
</body>
</html>