<nav class="navbar navbar-header" style="background-color: #222;
border-color: #080808; width:100%; ">
    <div class="navbar-header" style="" >
        <nav class="navbar navbar-light bg-light">
            <a class="navbar-brand" href="start_in.php">
                <img src="images/logo.png" width="75" height="75" alt="">
            </a>
        </nav>
    </div>
    <ul class=" navbar-header navbar-nav  navbar-light bg-light navbar-right" style="
																				margin-left: 0;
    																			padding-left: 0;
																				padding-top: 25px;
																				margin-right:10px;
																				size:30px;">
        <li style="list-style-type: none;">
            <a href="" class="navbar-brand" style="font-size:18px; margin-right:100px;">
                <span class="glyphicon glyphicon-shopping-cart d-inline-block align-top" style="margin-right:8px;"></span>Do koszyka
            </a>
        </li>
        <li style="list-style-type: none;">
            <a href="" class="navbar-brand" style="font-size:18px;margin-right:5px;">
                <span class="glyphicon glyphicon-log-in d-inline-block align-top" style="margin-right:8px; "></span>Wyloguj sie
            </a>
        </li>
    </ul>
    <div class="container-fluid" style="padding-bottom:15px;">
        <ul class="nav navbar-nav" style="font-size:25px;  margin-top:0; height:130px;"><hr>
            <li style ="margin-left: 15px; margin-right:15px;"><a href="">
                    <b>Strona glowna</b></a>
            </li>
            <li style=" margin-left: 15px;margin-right:15px;"><a href="">
                    <b>Promocje</b></a>
            </li>
            @foreach($categories as $category => $id_category)
                <li style='margin-left:15px; margin-right:15px;'><a href=''><b>{{$category}}</b></a></li>
            @endforeach
        </ul>
    </div>
</nav>