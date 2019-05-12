@component('mail::layout')
    {{-- Header --}}
@slot('header')
@component('mail::header', ['url' => config('app.url')])
    Sklep internetowy "U Jacka"
@endcomponent
@endslot
    {{-- Body --}}
    W naszym sklepie o godzinie {{ $created_at }}, zostało złożone zamówienie.

    Suma zakupów wraz z kosztami wysyłki wyniesie: {{ $price }} zł

    Zamówione produkty:

@component('mail::table')
        | Produkt   | Ilość         | Cena      |
        |:------:   |:-----------   |:--------: |
@foreach($products as $product)
    | {{$product->Name}}     | {{$product->amount}} |        {{$product->total}} zł|
@endforeach
@endcomponent

    Bardzo proszę o informacje czy ma być wystawiona FV VAT Brak informacji będzie skutkował nie wystawieniem FV.

    Aktualny stan realizacji Twojego zamówienia możesz obejrzeć w historii zamówień.

    Aby skontaktować się z obsługą sklepu: napisz: ujacka@gmail.com lub zadzwoń: 600-321-604 lub 668-311-402
    DANE DO PRZELEWU
    Zakład Handlowy "U Jacka"
    Maciej Koperek
    ul. Dębowa 42
    40-106 Katowice
    Numer Konta: 09-1050-1214-1000-0090-7189-8853

    {{-- Footer --}}
@slot('footer')
@component('mail::footer')
    © {{ date('Y') }} U Jacka. All rights reserved.
@endcomponent
@endslot
@endcomponent



