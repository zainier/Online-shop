<ul>
    @guest
    <li><a href="{{ route('register') }}">Sign Up</a></li>
    <li><a href="{{ route('login') }}">Login</a></li>
    @else

    <li>
            <a href="{{url('profile')}}">Moje konto</a>
        </li>
    <li>
        <a href='{{URL::route('orders')}}'>
            Twoje zamowienia
        </a>
    </li>

    @endguest
    <li><a href="{{ route('cart') }}">Mój koszyk
        @if($cart_count > 0)
            <span class="cart-count"><span>{{$cart_count}}</span></span>
        @endif
    <li>
        <a href="{{action('LoginController@logout') }}">
            Wyloguj się
        </a>
    </li>
    </a></li>
    {{-- @foreach($items as $menu_item)
        <li>
            <a href="{{ $menu_item->link() }}">
                {{ $menu_item->title }}
                @if ($menu_item->title === 'Cart')
                    @if (Cart::instance('default')->count() > 0)
                    <span class="cart-count"><span>{{ Cart::instance('default')->count() }}</span></span>
                    @endif
                @endif
            </a>
        </li>
    @endforeach --}}
</ul>
