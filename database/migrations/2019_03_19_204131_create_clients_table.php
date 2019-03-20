<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */



    public function up()
    {
        Schema::create('clients', function (Blueprint $table) {
            $table->bigIncrements('ClientID');
            $table->string('ClientName', 30);
            $table->string('ClientSurname', 30);
            $table->string('ClientSex', 1)->default(null);
            $table->string('ClientAddress', 50)->default(null);
            $table->string('ClientPostalCode', 10)->default(null);
            $table->integer('ClientCityID')->default(null);
            $table->string('ClientPhoneNumber', 30)->default(null);
            $table->string('ClientEmail', 50);
            $table->string('ClientPassword', 100);

            $table->foreign('ClientCityID')->references('CityID')->on('cities');
            $table->unique('ClientEmail');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('clients');
    }
}
