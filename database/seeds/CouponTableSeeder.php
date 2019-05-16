<?php

use Illuminate\Database\Seeder;

class CouponTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Coupon::create([
            'code' => 'ABC123',
            'type' =>'fixed',
            'value' =>30,
        ]);

        Coupon::create([
            'code' => 'DFE456',
            'type' =>'percent',
            'percent_off' =>50,
        ]);

    }
}
