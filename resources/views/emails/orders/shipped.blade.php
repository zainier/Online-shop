@component('mail::layout')
    {{-- Header --}}
@slot('header')
@component('mail::header', ['url' => config('app.url')])
    Sklep internetowy "U Jacka"
@endcomponent
@endslot
    {{-- Body --}}
    Witam,

    Status twojego zamówienia (ID: {{ $id_order }}) został zmieniony na {{ $status }}

    Uprzejmie informuję,
    że transakcja jest obecnie w trakcie REALIZACJI (Kompletowania) i przygotowywana do Wysyłki.

    Przesyłka będzie wysłana w jak najkrótszym możliwym czasie.

    Pozdrawiam
    Sklep internetowy "U Jacka"

    {{-- Footer --}}
@slot('footer')
@component('mail::footer')
    © {{ date('Y') }} U Jacka. All rights reserved.
@endcomponent
@endslot
@endcomponent

