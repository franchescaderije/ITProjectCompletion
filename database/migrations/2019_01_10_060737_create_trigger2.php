<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTrigger2 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared('
        
        CREATE TRIGGER adjust 
        AFTER INSERT ON `inventory_adjustments` 
        FOR EACH ROW
        BEGIN
                  
         UPDATE `vaccine_lists` 
         SET vaccine_lists.quantity = vaccine_lists.quantity - NEW.amount_qty
         WHERE vaccine_lists.id = NEW.vaccine_lists_id
         AND NEW.adjustment_reason = "Damaged"
         AND NEW.adjustment_reason != "Consumed";

         UPDATE `vaccine_lists` 
         SET vaccine_lists.quantity = vaccine_lists.quantity + NEW.amount_qty
         WHERE vaccine_lists.id = NEW.vaccine_lists_id
         AND NEW.adjustment_reason = "Restock"
         AND NEW.adjustment_reason != "Consumed";


        END
        
        ');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::unprepared('DROP TRIGGER `adjust`');
    }
}
