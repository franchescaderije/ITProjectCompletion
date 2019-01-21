<?php
use App\Patient;
use App\Vaccine_list;
use Illuminate\Support\Facades\Input;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

 Route::get('/', function () {
    return redirect(route('login'));
 });

 Route::group(['middleware' => ['auth']], function() {
    

Route::any('/patient-form','PatientFormController@index');
Route::resource('/create','PatientController');
Route::Post('/submit','PatientController@vitalsign');
Route::Post('/vaccine_type','PatientController@vaccine_type');
Route::Post('/remove','PatientController@destroy');
Route::get('/create/{id}','PatientController@hwgraph');
Route::get('/create/{id}/graph','ChartController@hwgraph');
Route::get('/UserManagement','EmployeeController@index');
Route::resource('/addUser','EmployeeController');
Route::Post('/addUser','EmployeeController@store');
Route::get('/archiveprofile/{id}', 'ArchiveProfileController@index');
Route::get('administervaccine/{id}', ['as'=>'administervaccine', 'uses' =>'PatientController@loadmodal']);
Route::POST('add_dose', "AppointmentController@administervaccine");
Route::get('/populateimmunizationtable/{vacid}/{pid}','PatientController@loadtable');
Route::Post('/diagnosisResult','PatientController@diagnoses');
Route::get('/administervaccine/create/ajax-state',function()
{
    $vaccineType = Input::get('vac_id');
    $lotnumbers = Vaccine_list::where([['vaccine_types_id','=',$vaccineType],['status','!=',"Expired"],['quantity','>=',1]])->get();
    return $lotnumbers;
 
});

//Report Generation page Controller
Route::resource('/genReport', 'ReportGenerationController');

// //Appointment schedule
// Route::Post('/save','AppointmentController@store');


//vaccine page Controller
Route::resource('/createvaccine', 'VaccineController');

//Dashboard page Controller
Route::resource('/dashboard' , 'DashboardController');
Route::get('/dashboard' , 'DashboardController@index');

//store walkin patient to queue Controll
Route::post('/addPatient','PatientController@walkin');


//store existing patient to queue Controller
Route::resource('/queue','QueueController');

//store existing patient to appointment Controller
Route::resource('/appointment','AppointmentController');



//search existing patient
Route::any ( '/search', function () {
    $searchInput = Input::get ( 'searchInput' );
    $searches = Patient::where('patient_fname','LIKE','%'.$searchInput.'%')
    ->orWhere('patient_lname','LIKE','%'.$searchInput.'%')
    ->orWhere('patient_gender','LIKE','%'.$searchInput.'%')
    ->orWhere('patient_bday','LIKE','%'.$searchInput.'%')
    ->orWhere('patient_address','LIKE','%'.$searchInput.'%')
    ->orWhere('father_name','LIKE','%'.$searchInput.'%')
    ->orWhere('mother_name','LIKE','%'.$searchInput.'%')
    ->orWhere('father_occupation','LIKE','%'.$searchInput.'%')
    ->orWhere('mother_occupation','LIKE','%'.$searchInput.'%')
    ->orWhere('contact_number','LIKE','%'.$searchInput.'%')
    ->orWhere('type_of_delivery','LIKE','%'.$searchInput.'%')->get();
    return view('pages.patientlist', compact ('searches'));
    
});

//Schedhule patient
Route::POST('patient_list','AppointmentController@patient_list');
Route::POST('dashboard_list','DashboardController@dashboard_list');


//SCHEDULED PATIENTS
Route::get('doneschedule', 'DoneScheduleController@index');
Route::get('scheduledpatients', 'NewScheduleController@index');
Route::POST('edit_sched/{pid}/{aid}','NewScheduleController@edit_sched');
Route::POST('finish_sched','DashboardController@finish_sched');

//Payments
Route::post('add_payments/{pid}/{aid}', 'DashboardController@add_payments');
Route::post('receive_payments/{pid}/{aid}', 'DashboardController@receive_payments');
Route::post('amount_due', 'DashboardController@amount_due');



//Inventory Adjustments
Route::POST('adjust_inventory','PostVaccineTypeController@adjust_inventory');
// Route::POST('new_stock','PostVaccineTypeController@new_stock');


//ADD VACCINE TYPES
Route::resource('vaccinetypesnew','PostVaccineTypeController');
Route::POST('store','PostVaccineTypeController@store');

//DYNAMIC VACCINE TYPES
Route::resource('/vaccinetypes','PostVaccineTypeController');
Route::POST('/vaccinetypes', "PostVaccineTypeController@returnList");


// VACCINE LISTS
Route::resource('vaccinelist', 'PostVaccineTypeController' ); 

//DYNAMIC ADD VACCINE LISTS BASED ON TYPES
Route::POST('add_vaccine', "PostVaccineTypeController@add_vaccine");
Route::POST('edit_vaccine', "PostVaccineTypeController@edit_vaccine");

//RENDERED VACCINE
Route::resource('rendered_vaccinelist', 'RenderedVaccineController');
Route::resource('/rendered_vaccines', 'RenderedVaccineController');
Route::get('/rendered_vaccines/{id}', 'RenderedVaccineController@show');
});

/*------------------Login Controller----------------------*/
Auth::routes();
Route::get('logout', '\App\Http\Controllers\Auth\LoginController@logout');
/*--------------------------------------------------------*/

/*Route::get('/archive', function (){
    return view ('pages.archive');
});*/

/*---------------------Archive Controller-------------------*/
Route::get('/archive', 'ArchiveController@index');
/*------------------Archive Profile----------------*/
Route::get('archiveprofile', 'ArchiveProfileController@index');



//CHANGE PASSWORD
Route::get('/changePassword','HomeController@changePassword');

/*------------------Login Controller----------------------*/
Auth::routes();
Route::get('logout', '\App\Http\Controllers\Auth\LoginController@logout');
/*--------------------------------------------------------*/

