
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Sklep internetowy U Jacka | Informacja o produkcie</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <style>
        .btn{
            font-size: 40px;
            height: 70px;
        }
    </style>
</head>
<body>
@include('includes.header')
@php$request->get('item_id', 1); @endphp
<div class="container">
    <div class="row" >
        <ol class="breadcrumb">
            <li><a href="index.php">Strona głowna</a></li>

            @if(isset($request))
@php(echo 'hi')

            $sql = "SELECT * FROM products WHERE ProductID = '$_GET[item_id]' ";
            $run = mysqli_query($conn, $sql);

            while($rows = mysqli_fetch_assoc($run)) {
            $item_id = $rows['ProductID'];
            $item_cat_id = $rows['CategoryID'];
            $item_cat = mysqli_fetch_assoc(mysqli_query($conn, "SELECT CategoryName FROM categories WHERE CategoryID = $item_cat_id"))['CategoryName'];
            echo "
									    <li><a href='products.blade.php?category=$item_cat_id'>$item_cat</a></li>
									    <li class='active'><b>$rows[ProductName]</b></li>
								";
            ?>
        </ol>
    </div>
    <div class="row" >
        <?php

        echo "
					<div class='col-md-4' style='height:400px; '>
						<h3 class='pp-title'><b>$rows[ProductName]</b></h3>
						<div class='top' style='height:300px; width:400px;  '><img src='css/images/{$rows['ProductName']}.jpg' style='border-radius:8px;' height=300px width=400px></div>

						<div style='text-align:right; font-size:30px; color:red;'><b>$rows[ProductValue] zł / $rows[UnitOfMeasurement]<b></div>
					</div>


				";
        }
        @endif
        ?>

        <ul class="list-group" >
            <aside class="col-md-4" style="margin-left:350px;  ">
                <a href="buy.php?chk_item_id=<?php echo $item_id;?>" class="btn btn-success btn-lg btn-block" style="border-radius:5px;">Kupuję</a>
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
        <?php

        $rel_sql = "SELECT * FROM products ORDER BY rand() LIMIT 4";
        $rel_run = mysqli_query($conn, $rel_sql);

        while($rel_rows = mysqli_fetch_assoc($rel_run) ){
            $item_title = str_replace(' ', '_', $rel_rows['ProductName']);
            echo "

							<div class='col-md-3' >
								<div><img src='css/images/{$rel_rows['ProductName']}.jpg' style='border-radius:8px;' height=150px width=200px></div>
									<div >
										<h3 class='item-title'><a href='item.php?item_id=$rel_rows[ProductID]&item_title=$item_title'><b>$rel_rows[ProductName]</b></a></h3>
										<div class='pull-right' style='font-size:20px; color:red;'><b> $rel_rows[ProductValue] zł / $rows[UnitOfMeasurement]</b></div>

									</div>
							</div>

					";
        }
        ?>
    </div>
</div><br><br><br><br>
@include('includes.footer')
</body>
</html>
