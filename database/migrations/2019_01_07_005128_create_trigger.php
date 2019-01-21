<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTrigger extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        
        DB::unprepared('
        
        CREATE TRIGGER adjust_inventory 
        AFTER INSERT ON `immunizations` 
        FOR EACH ROW
        BEGIN
         DECLARE x INT;
         SET x = (SELECT `id` FROM `vaccine_lists` WHERE `vaccine_lot_number` = NEW.vaccine_lot_number); 
         
         UPDATE `vaccine_lists` 
         SET vaccine_lists.quantity = vaccine_lists.quantity - 1
         WHERE vaccine_lists.vaccine_lot_number = NEW.vaccine_lot_number;

         INSERT INTO `inventory_adjustments` 
         (`adjustment_date`, `adjustment_reason`, `amount_qty`,`vaccine_lists_id`,`vaccine_types_id`,`created_at`,`updated_at`)
         VALUES (now(),"Consumed",1,x,NEW.vaccine_types_id,now(),null);
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
        DB::unprepared('DROP TRIGGER `adjust_inventory`');
    }
}
