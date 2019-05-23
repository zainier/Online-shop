<ul>
    @guest
    <li><a href="{{ route('register') }}">Sign Up</a></li>
    <li><a href="{{ route('login') }}">Login</a></li>
    @else
    <li>
        <a href=href='{{URL::route('cart')}}'>Mój koszyk</a>
    </li>
    <li>
        <a href="{{action('LoginController@logout') }}"
            >
            Logout
        </a>
    </li>
    @endguest
    <li><a href="{{ route('cart') }}">Cart

    <span class="cart-count"><span>5</span></span>

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
