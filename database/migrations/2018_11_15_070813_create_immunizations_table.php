<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateImmunizationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('immunizations', function (Blueprint $table) {
            $table->increments('id');
            $table->date('vdate_administered')->notNullable();
            $table->String('vaccine_lot_number');
            $table->integer('vaccine_types_id')->unsigned();
            $table->integer('patients_id')->unsigned();
            $table->integer('medical_records_id')->unsigned();
            $table->timestamps();
          

            $table->foreign('vaccine_types_id')
            ->references('id')->on('vaccine_types')
            ->onDelete('restrict')
            ->onUpdate('cascade');

            $table->foreign('patients_id')
            ->references('id')->on('patients')
            ->onDelete('restrict')
            ->onUpdate('cascade');

            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('immunizations');
    }
}
