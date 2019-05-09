<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrderProductTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
    Schema::create('order_product', function(Blueprint $table)
    {
      $table->increments('id');
      $table->integer('order_id');
      $table->integer('Id_Product');
      $table->decimal('amount', 10, 2);
	$table->decimal('price', 10, 2);
      $table->decimal('total', 10, 2);
    }); 
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('order_product', function (Blueprint $table) {
            //
        });
    }
}
