<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Patient;
use App\Patient_records;

class ArchiveController extends Controller
{
    public function index(){
        $patient = DB::table('patients')
        ->select('id', 'patient_lname', 'patient_fname', 'patient_bday', 'patient_gender')
        ->where (DB::raw("DATEDIFF(CURRENT_DATE , patient_bday)"), '>=',6570)
        ->get();
        return view ('pages.archive', compact('patient'));

    }

    /*public function list(){
        $patientId = DB::table('patient_fname')->where('inactive')
    }*/
}
