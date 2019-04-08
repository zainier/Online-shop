
<html lang="en">
<head>
    <title>Sklep internetowy U Jacka | Logowanie</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="{{url('products')}}"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{url('vendor/bootstrap/css/bootstrap.min.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{url('fonts/font-awesome-4.7.0/css/font-awesome.min.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{url('vendor/animate/animate.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{url('vendor/css-hamburgers/hamburgers.min.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{url('vendor/select2/select2.min.css')}}">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="{{url('css/util.css')}}">
    <link rel="stylesheet" type="text/css" href="{{url('css/main.css')}}">

    <!--===============================================================================================-->
</head>
<body>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-pic js-tilt"  align="center" data-tilt>
                <img src="images/logo.png" height="300" width="450" alt="logo">
            </div>

            <form class="login100-form validate-form" role = "form"
                  action = "{{url('/login')}}" method = "POST">@csrf
                <h4 class = "form-signin-heading">
                    @if(count($errors) > 0)
                        @foreach($errors->all() as $error)
                            {{$error}}
                        @endforeach
                    @endif
                </h4>
                <span class="login100-form-title">
						Wprowadź swój login i hasło
					</span>

                <div class="wrap-input100 validate-input" data-validate = "">
                    <input class="input100" type="text" name="email" placeholder="Email" >
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
                </div>

                <div class="wrap-input100 validate-input" data-validate = "Wymagane jest hasło">
                    <input class="input100" type="password" name="password" placeholder="Hasło">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
                </div>

                <div class="container-login100-form-btn">
                    <button class="login100-form-btn" name="submit">
                        Zaloguj
                    </button>
                </div>

                <div class="text-center p-t-12">
						<span class="txt1">
							Nie masz konta?
						</span>
                    <br>
                    <a class="txt2" href="{{url('registration')}}">
                        Nie marnuj czasu! Dołącz się do nas!
                        <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                    </a>
                </div>

            </form>
        </div>
    </div>
</div>



<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/tilt/tilt.jquery.min.js"></script>
<script >
    $('.js-tilt').tilt({
        scale: 1.1
    })
</script>
<!--===============================================================================================-->
<script src="js/main.js"></script>

</body>
</html>
