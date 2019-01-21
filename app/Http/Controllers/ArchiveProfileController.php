<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Patient;
use App\Patient_records;


class ArchiveProfileController extends Controller
{
    public function index($id){
        $patient = DB::table('patient_records')
        ->join('patients','patients.id','=','patient_records.patient_id')
        ->where('patient_id','=',$id)
        ->select('patients.id','patients.patient_mname','patients.patient_fname','patients.patient_lname','patients.id','patient_records.blood_type','patient_records.birth_weight',
         'patient_records.birth_length','patient_records.head_cire','patient_records.chest_cire','patient_records.abdominal_cire',
         'patients.patient_lname','patients.patient_fname','patients.patient_bday','patients.patient_address',
         'patients.patient_gender','patients.father_name','patients.mother_name','patients.mother_occupation','patients.father_occupation',
         'patients.contact_number','patients.type_of_delivery')
        ->get();

        $immunization = DB::table('immunizations')
        ->join('vaccine_types','vaccine_types.id','=','immunizations.vaccine_types_id')
        ->select('vaccine_types.vaccine_type_name','immunizations.vdate_administered')
        ->where('immunizations.patients_id','=',$id)
        ->get();

        return view('pages.archiveprofile', compact('patient','immunization'));
    }
}
