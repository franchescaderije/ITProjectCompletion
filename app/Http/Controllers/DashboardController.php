<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Employee;
use App\Vaccine;
use App\Patient;
use App\Delivery;
use App\Service;
use App\Appointment;
use App\Payment;
use App\Vaccines;
use Carbon\Carbon;
use DB;

class dashboardcontroller extends Controller
{
    /**
    * Display a listing of the resource.
    *
    * @return \Illuminate\Http\Response
    */
    public function index()
    {
        $employees = Employee::all();
        $schedpatient = DB::table('appointments')
        ->join('patients','patients.id','=','appointments.patients_id')
        ->leftjoin('payments','payments.appointments_id','=','appointments.id')
        ->select('payments.amount','patients.id', 'patients.patient_lname', 'patients.patient_fname', 'patients.patient_bday', 'patients.patient_gender','appointments.appointment_date','appointments.status','appointments.id as appointments_id')
        ->whereDate('appointments.appointment_date', '=', Carbon::today()->toDateString())
        ->Where('appointments.status','=','Scheduled')
        ->orderBy('appointments.id','ASC')
        ->get();
    
        $vaccines = DB::table('vaccine_types')
        ->Join('vaccine_lists','vaccine_lists.vaccine_types_id','=','vaccine_types.id')
        ->select(DB::raw('SUM(vaccine_lists.quantity) as vaccine_count'))
        ->get();
        
        $active = DB::table('patients')
        ->select('id', 'patient_lname', 'patient_fname', 'patient_bday', 'patient_gender')
        ->where (DB::raw("DATEDIFF(CURRENT_DATE , patient_bday)"), '<=',6570)
        ->get();

        $expvaclist = DB::table('vaccine_lists')
        ->select('id','vaccine_name','vaccine_lot_number','quantity','vaccine_expiration_date')
        ->where ( 'vaccine_expiration_date', '<=',  (DB::raw("(NOW() + INTERVAL '3' MONTH)")))
        ->get();

        $expvac = DB::table('vaccine_lists')
        ->select(DB::raw('SUM(vaccine_lists.quantity) as vaccine_count'))
        ->where ( 'vaccine_expiration_date', '<=',  (DB::raw("(NOW() + INTERVAL '3' MONTH)")))
        ->get();
       
        
        $archive = DB::table('patients')
        ->select('id', 'patient_lname', 'patient_fname', 'patient_bday', 'patient_gender')
        ->where (DB::raw("DATEDIFF(CURRENT_DATE , patient_bday)"), '>=',6570)
        ->get(); 

        
        
        
        return view('pages.dashboard', compact ('schedpatient', 'employees','vaccines', 'expvaclist', 'active','expvac', 'archive'));          
        //->with('patients', $patients);
        
        
        //return view('pages.dashboard')->with('patients', $patients);
    }
    
    
    /**
    * Show the form for creating a new resource.
    *
    * @return \Illuminate\Http\Response
    */
    public function create()
    {
        //
    }
    
    /**
    * Store a newly created resource in storage.
    *
    * @param  \Illuminate\Http\Request  $request
    * @return \Illuminate\Http\Response
    */
    public function store(Request $request)
    {
        
        $patientId = Patient::where('patient_fname', $request->input('firstname'))->first()->id;
        $serviceId = Service::where('service_name', $request->input('TypeOfService'))->first()->id;
        //$patient = Patient::find($request);
        $payment = new Payment;
        $payment->status = $request->input('status');
        $payment->discount = "0";
        $payment->patient_id = $patientId;
        $payment->service_id = $serviceId;
        $payment->save();
        return redirect('/dashboard');
    }
    
    /**
    * Display the specified resource.
    *
    * @param  int  $id
    * @return \Illuminate\Http\Response
    */
    public function show($id)
    {
        //
        $discount = Service::find($id);
        return view('pages.addPayment', compact('discount'));
    }
    
    /**
    * Show the form for editing the specified resource.
    *
    * @param  int  $id
    * @return \Illuminate\Http\Response
    */
    public function edit($id)
    {
        //
        //$discounts = Payment::find($id);
        //return view('pages.addPayment', compact('discounts'));
        $discount = Service::find($id);
        return view('pages.addPayment', compact('discount'));
    }
    
    /**
    * Update the specified resource in storage.
    *
    * @param  \Illuminate\Http\Request  $request
    * @param  int  $id
    * @return \Illuminate\Http\Response
    */
    public function update(Request $request, $id)
    {
        //
        $payId = $request->get('servId');
        
        $payId = $request->get('servId');
        $payment = Payment::find($payId);
        $payment->discount = $request->input('discount');
        $payment->status = 'paid';
        $payment->save();
        return redirect('/dashboard');
    }
    
    public function dashboard_list(Request $request){
        //Validation   
        
        $this->validate($request,[   
            'appointment_date' => 'required|date_format:Y-m-d|after:now',      
            
            ]);
            
            $appointment_date= $request->input('appointment_date');
            $patientid = $request->input('patients_id');
            
            
            DB::table('appointments')->where('id', '=', $patientid)
            ->update(
                [
                    'appointment_date' => $appointment_date,
                    'patients_id' => $patientid,
                    'created_at' => Carbon::now()->setTimezone('Asia/Singapore'),  
                    'updated_at' => Carbon::now()->setTimezone('Asia/Singapore')            
                    ]
                );
                
             
                session()->flash('change','Schedule Changed!');
                    

                return back()->with('Success','Schedule Changed!');
             
                
                
            }

            public function add_payments(Request $request,$pid,$aid){ 

                $amnt = $request->input('amount');
            
                DB::table('payments')->where('id', '=', $pid)
                ->insert(
                    [
                        // 'appointment_date' => $appointment_date,

                        'amount' => $amnt,
                        'patients_id' => $pid,
                        'appointments_id' => $aid,
                        'created_at' => Carbon::now()->setTimezone('Asia/Singapore'),            
                        'updated_at' => Carbon::now()->setTimezone('Asia/Singapore')            
                        ]
                    );
                    session()->flash('sched','Payment Amount Added!');
                    return back()->with('Success','Payment Added!');
                    
                    
                }

                public function receive_payments($pid,$aid){ 

                    DB::table('appointments')->where([['id', '=', $aid],['patients_id','=',$pid]])
                    ->update(
                        [
                            // 'appointment_date' => $appointment_date,
    
                            'status' => "Paid",           
                            'updated_at' => Carbon::now()->setTimezone('Asia/Singapore')            
                            ]
                        );
                    
    
                  return back()->with('Success','Payment Done!');
    
                        
                        
                    }
                
            }


            
            
            
//             public function finish_sched(Request $request){ 
                    
//                     // $appointment_date= $request->input('appointment_date');

//                     $patientstatus = $request->input('status');
//                     $patientid = $request->input('patients_id');
                    
                    
//                     DB::table('appointments')->where('id', '=', $patientid)
//                     ->update(
//                         [
//                             // 'appointment_date' => $appointment_date,

//                             'status' => $patientstatus,
//                             'patients_id' => $patientid,
//                             'updated_at' => Carbon::now()->setTimezone('Asia/Singapore')            
//                             ]
//                         );

//                         session()->flash('sched','Schedule Done!');
                    

//    return back()->with('Success','Schedule Done!');

                        
                        
//                     }
                    
//                 }
                