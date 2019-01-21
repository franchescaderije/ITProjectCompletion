<?php

use Illuminate\Database\Seeder;

class EmployeesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('employees')->insert([
            'position' => 'admin',
            'employee_lname' => 'admin',
            'employee_fname' => 'USC',
            'address' => 'Laperal Bldg, Diego Silang Street, Baguio City',
            'contact' => '09090000000',
            'username' => 'admin',
            'password' => bcrypt('admin'),
        ]);
    }
}
