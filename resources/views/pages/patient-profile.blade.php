<!DOCTYPE html>
<html>

@include('layouts.head')
<link rel="stylesheet" type="text/css" media="screen"  href="{{ asset('bower_components/jquery-ui.css')}}" />
<body class="hold-transition skin-purple sidebar-mini">
  <div class="wrapper">

    @include('layouts.header')

    <!-- NAVIGATION -->
    @include('layouts.navigation')
    <!-- END -->

    <div class="content-wrapper">
      <section class="content">
        <div class="row">
          <div class="col-md-3">
            <!-- Profile Image -->
            <div class="box box-primary">
              <div class="box-body box-profile">
                @if($patient->patient_gender == "Female")
                <img class="profile-user-img img-responsive img-circle" src="{{asset('img/baby-girl.png')}}" alt="Patient profile picture">
                @endif
                @if($patient->patient_gender == "Male")
                <img class="profile-user-img img-responsive img-circle" src="{{asset('img/baby-boy.png')}}" alt="Patient profile picture">
                @endif
                <h3 id="printdiv1" class="profile-username text-center">{{$patient->patient_fname}} {{$patient->patient_lname}}</h3>
              </div>
              <!-- /.box-body -->
            </div>
            <a href="#patient-info" data-toggle="tab">
              <div class="small-box bg-teal" >
                <div class="inner">
                  <img width="100%" src="{{asset('img/personal-info.png')}}" alt="personal info tab">
                </div>
              </div>    
            </a>

           
            <a  class="mask flex-center" href="#checkup" data-toggle="tab">
              <div class="small-box bg-aqua " >
                <div class="inner">
                  <img  width="100%" src="{{asset('img/checkup.png')}}" alt="check up tab">
                </div>
              </div>    
            </a>
          
            <a href="#immunization" data-toggle="tab">
              <div class="small-box bg-teal" >
                <div class="inner">
                  <img  width="100%" src="{{asset('img/immunization.png')}}" alt="immunization tab">
                </div>
              </div>    
            </a>
            <a href="#med_record" data-toggle="tab">
              <div class="small-box bg-aqua" >
                <div class="inner">
                  <img  width="100%" src="{{asset('img/med-record.png')}}" alt="medical record tab">
                </div>
              </div>    
            </a>
            
          </div>
          

          
          <!-- /.box -->
          
          <!-- /.col -->
          <div class="col-md-9">
            <div class="nav-tabs-custom">
              <div class="tab-content">
                <!------------------------------------------Patient Information Tab--------------------------------------->
                <div class="active tab-pane" id="patient-info">
                  <center><h3 class="box-title">Personal Information</h3></center>
                  <div class="box box-info">
                    <div class="box-header with-border">
                      <h3 class="box-title">General Information</h3>
                    </div>
                    <div class="box-body">
                      <table class='table table-bordered'>
                        <tr>
                          <th>Gender:</th>
                          <td><span class="text-muted"> {{$patient->patient_gender}}</span></td>
                          <th>Birthday:</th>
                          <td><span class="text-muted"> {{$patient->patient_bday}}</span> </td>
                        </tr>
                        <tr>
                          <th>Mother:</th>
                          <td><span class="text-muted"> {{$patient->mother_name}}</span></td>
                          <th>Occupation:</th>
                          <td><span class="text-muted">{{$patient->mother_occupation}}</span></td>
                        </tr>
                        <tr>
                          <th>Father:</th>
                          <td><span class="text-muted"> {{$patient->father_name}}</span></td>
                          <th>Occupation:</th>
                          <td><span class="text-muted">{{$patient->father_occupation}}</span></td>
                        </tr>
                        <tr>
                          <th>Address:</th>
                          <td><span class="text-muted"> {{$patient->patient_address}}</span></td>
                          <th>Contact Number:</th>
                          <td><span class="text-muted"> 0{{$patient->contact_number}}</span></td>
                        </tr>
                      </table>
                    </div> 
                  </div> 
                  <div class="box box-info">
                    <div class="box-header with-border">
                      <h3 class="box-title">Birth History</h3>
                    </div>
                    <div class="box-body">
                      <table class='table table-bordered'>
                        <tr>
                          <th>Type of Delivery:</th>
                          <td><span class="text-muted">{{$patient->type_of_delivery}}</span></td>
                          <th>Head Circumference:</th>
                          <td><span class="text-muted">{{$patient->head_cire}} cm</span></td>
                          
                        </tr>
                        <tr>
                          <th>Blood Type:</th>
                          <td><span class="text-muted">{{$patient->blood_type}}</span></td>
                          <th>Chest Circumference:</th>
                          <td><span class="text-muted">{{$patient->chest_cire}} cm</span></td>
                        </tr>  
                        <tr>
                          <th>Birth Length:</th>
                          <td><span class="text-muted">{{$patient->birth_length}} cm</span></td>
                          <th>Abdominal Circumference:</th>
                          <td><span class="text-muted">{{$patient->abdominal_cire}} cm</span></td>
                        </tr> 
                        <tr>
                          <th>Birth Weight:</th>
                          <td><span class="text-muted">{{$patient->birth_weight}} kg</span></td>
                        </tr> 
                      </table>
                    </div>
                  </div> 
                  <div class="box-footer">
                    @if(Auth::User()->position == "assistant")  
                    <button type="button" class="btn btn-info pull-right" data-toggle="modal" data-target="#editmodal">Edit</button>
                    @endif
                </div>   
                </div>
                
                 
                
                <!------------------------------------------------Immunization Tab---------------------------------------->
               
              <div class="tab-pane" id="immunization">
                <center><h3 class="box-title">Childhood Immunization</h3></center>
                <div class="box box-info">
                  <div class="box-body">
                    <div class="row">
                      <div class="col-lg-10" style="position:relative; left:10%;">
                       @if(Auth::User()->position == "doctor" || Auth::User()->position == "admin") 
                        <div class="panel panel-default">
                          <div class="panel-heading">Administer New Vaccine</div>
                          <div class="panel-body">
                              <form action="/add_dose"  method="POST">
                                {{ csrf_field() }}
                              <input style="display:none" type="number" name="patient_id" class="form-control" value="{{$patient->id}}" id="patient_id" readonly> </th>
                            <div class="row">
                                  <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Vaccine Type: </label>
                                            <select name="vaccine_id" id="vactype" class="form-control">
                                              <option value="">-select type-</option>
                                              @foreach($vaccine_types as $types)
                                              <option value=" {{ $types->id}}">
                                                  {{ $types->vaccine_type_name}}
                                              </option>
                                              @endforeach
                                            </select>
                                    </div>
                                  </div>
                                  <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Lot Number: </label>
                                        <select id="lotnumber" class="form-control" name="lot_number"> </select>
                                    </div>
                                  </div>  
                                  <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Date Administered: </label>
                                        <input type="date" class="form-control" name="date_administered" id="dateadministered" max= Date();>
                                    </div>
                                  </div>  
                            </div>
                          </div>
                            <div class="panel-footer"><button type="submit" name="administer" class="btn btn-default">Administer Vaccine</button></div>
                        </div>
                    </form>
                    @endif
                    </div>
                    </div>
                    
                    <!-----------------------------------Immunizations---------------------------------------> 
                 
                  @if(count($immpanel)> 0)
                  @foreach ($immpanel as $immpanel) 
                  <div class="col-lg-8" style="position:relative; left:20%;" content="\00d7" id="dacs">
                    <div class="small-box bg-yellow">
                      <div class="inner">
                        <h3>{{$immpanel->vaccine_type_name}}</h3>
                      </div>
                      <div class="icon" style="font-size:85px">
                         <small><span id="doseNum"></span>{{$immpanel->shots}} of {{$immpanel->vaccine_dose}}</small>
                      </div>
                    @if($immpanel->vaccine_dose != $immpanel->shots)
                    <a  role="button"onClick="loadmodal(this.name);" id="administervaccine" name="{{$immpanel->id}}" class="small-box-footer" data-toggle="modal"  data-target="#addDoseModal"  data-vacid="{{$immpanel->id}}" data-vacname="{{$immpanel->vaccine_type_name}}" data-patient="{{$patient->id}}">
                        Add {{$immpanel->vaccine_type_name}} Dose <i class="fa fa-plus"></i>
                    </a>
                    @else
                    
                    <a  id="administervaccine" name="{{$immpanel->id}}" class="small-box-footer">
                      <center>Vaccine Series Completed <i class="fa fa-check"></i></center>
                    </a>
                    @endif
                      <div class="box box-default collapsed-box box-solid">
                        <div class="box-header with-border">
                          <h3 class="box-title"></h3>
                          <div class="box-tools pull-right">
                            <button id="{{$immpanel->id}}" name="{{$patient->id}}" onClick="loadtable(this.id,this.name)" type="button" class="btn btn-box-tool" data-widget="collapse" ><i class="fa fa-list-ul"></i></button>
                          </div>
                        </div>   
                          <div class="box-body">
                          <table id="immunetable{{$immpanel->id}}" class="tbl table table-border table-hover">
                              <thead style="background-color:#ff7e00">
                                <tr>
                                  <th>Vaccine Shot #</th>
                                  <th>Date Administered</th>
                                  <th>Vaccine Lot Number</th>
                                </tr>
                              </thead>
                              
                            </table>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  @endforeach
                  @endif
                </div>
              </div>
            </div>
            
            <div id="addDoseModal" class="modal fade">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title">Administer vaccine</h4>
                    </div>
                    <form action="/add_dose"  method="POST">
                      {{ csrf_field() }}
                    
                      <div class="modal-body">
                        @include('includes.administervaccine')
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancel</button>
                        <button type="submit" name="administer" class="btn btn-primary">Administer</button>
                      </div>
                    </form>
                  </div>
                </div>
            </div>
           
            
            
            <!---------------------------------------------Add checkup Tab------------------------------------------->
            
            <div class="tab-pane" id="checkup">
              <center><h3 class="box-title">Vital Signs</h3></center>
              @if(Auth::User()->position == "admin" || Auth::User()->position == "assistant")
              <div class="box box-info">
                <div class="box-body">
                  <form role="form" action="/submit" method="post" class="table">
                    @csrf
                    <table class='table'>
                      <tr>
                        <th>Date:</th>
                        <td><div class="input-group"><input type="date" class="form-control" id="visitDate1" max=Carbon::today(); name="visitDate" required autocomplete=off></div></td>
                      </tr>
                      <tr>
                        <th>Height</th>
                        <td><div class="input-group"><input type="number" min=0 step=".01" class="form-control" id="newHeight" placeholder="Height" name="newHeight" required><span class="input-group-addon">cm</span></div></td>
                      </tr>
                      <tr>  
                        <th>Weight:</th>
                        <td><div class="input-group"><input type="number" min=0 step=".01" class="form-control" id="newWeight" placeholder="Weight" name="NewWeight" required><span class="input-group-addon">kg</span></div></td>
                      </tr>
                      <tr> 
                        <th>Pulse Rate:</th>
                        <td><div class="input-group"><input type="number" min=0 oninput="validity.valid||(value='');" class="form-control" id="pulseRate" placeholder="Pulse Rate" name="pulseRate" required><span class="input-group-addon">beats per minute</span></div></td>
                      </tr>
                      <tr>
                        <th>Respiration: </th>
                        <td><div class="input-group"><input type="number" min=0 oninput="validity.valid||(value='');" class="form-control" id="respiration" placeholder="Respiration" name="respiration" required><span class="input-group-addon">breaths per minute</span></div></td>
                      </tr> 
                      <tr>
                        <th>Temperature: </th>
                        <td><div class="input-group"><input type="number"  min=0 step=".01" class="form-control" id="temperature" placeholder="Temperature" name="temperature" required><span class="input-group-addon">&#8451</span></div></td>
                      </tr>  
                    </table>
                    
                    
                    <input type="hidden" id="patId" name="patId" value='{{$patient->id}}' >
                    
                    <div class="box-footer">
                      <button type="submit" class="btn btn-primary pull-right mg-top">Submit</button>
                    </div>      
                  </form>
                </div>
              </div>
              @endif
              @if(Auth::User()->position == "doctor")
              <div class="box box-info">
                <div class="box-body">
                  @if(!empty($vtl))
                    <h3></h3>
                    @else
                    <h3>Vital signs not yet taken</h3>
                  @endif
                  
                    <table class='table'>
                      <tr>
                        <th>Date:</th>
                        <td><div class="input-group"><input type="text" class="form-control" id="visitDate2"  name="visitDate" value="{{ isset($vtl->date) ? $vtl->date: ''}}" required readonly></div></td>
                      </tr>
                      <tr>
                        <th>Height</th>
                        <td><div class="input-group"><input type="number" class="form-control" id="newHeight" placeholder="Height" name="newHeight"value="{{ isset($vtl->height) ? $vtl->height: ''}}" required readonly><span class="input-group-addon">cm</span></div></td>
                      </tr>
                      <tr>  
                        <th>Weight:</th>
                        <td><div class="input-group"><input type="number" class="form-control" id="newWeight" placeholder="Weight" name="NewWeight" value="{{ isset($vtl->weight) ? $vtl->weight: ''}}" required readonly><span class="input-group-addon">kg</span></div></td>
                      </tr>
                      <tr> 
                        <th>Pulse Rate:</th>
                        <td><div class="input-group"><input type="number" class="form-control" id="pulseRate" placeholder="Pulse Rate" name="pulseRate" value="{{ isset($vtl->pulse_rate) ? $vtl->pulse_rate: ''}}" required readonly><span class="input-group-addon">beats per minute</span></div></td>
                      </tr>
                      <tr>
                        <th>Respiration: </th>
                        <td><div class="input-group"><input type="number" class="form-control" id="respiration" placeholder="Respiration" name="respiration" value="{{ isset($vtl->respiration) ? $vtl->respiration: ''}}" required readonly><span class="input-group-addon">breaths per minute</span></div></td>
                      </tr> 
                      <tr>
                        <th>Temperature: </th>
                        <td><div class="input-group"><input type="number" class="form-control" id="temperature" placeholder="Temperature" name="temperature" value="{{ isset($vtl->temperature) ? $vtl->temperature: ''}}" required readonly><span class="input-group-addon">&#8451</span></div></td>
                      </tr>  
                    </table>
                    
                    
                    <input type="hidden" id="patId" name="patId" value='{{$patient->id}}' >
                    
                    <div class="box-footer">
                  </div>      
                </div>
              </div>
             @endif 
             @if(Auth::User()->position == "doctor" || Auth::User()->position == "admin")
            <center><h3>DOCTOR'S NOTES</h3></center>

            <form role="form" action="/diagnosisResult" method="post" class="table">
             @csrf
             <div class="input-group"><input style="display:none" type="text" class="form-control" id="visitDate2"  name="visitDate2" value="{{ isset($vtl->date) ? $vtl->date: ''}}" required readonly></div>
             <div class="box box-info mg-top">
              <div class="box-header">
                <h3 class="box-title">Allergies</h3>
              </div> 
              <div class="box-body">
                <div class="row">
                  <div class="col-sm-12">
                    <input type="text" class="form-control" name="allergies" required>
                    
                  </div>
                </div>
              </div> 
            </div>
            
            <div class="box box-info mg-top">
              <div class="box-header">
               <h3 class="box-title">Diagnosis</h3>
             </div>
             <div class="box-body">
              <div class="row">
                <div class="col-sm-12">
                  <input type="text" class="form-control"  name="diagnosis" required>
                </div>
              </div>
            </div>
            <div class="box-footer">
              

              <input type="hidden" name="patId" value='{{$patient->id}}' >

              <button type="submit" class="btn btn-primary pull-right mg-top">Submit</button>
            </div>
          </div>
        </form>
        @endif
      </div>
        <!---------------------------------------------Medical Record Tab------------------------------------------->
        <div class="tab-pane" id="med_record">
          <div class="nav-tabs-custom">
            <!-- Tabs within a box -->
            <ul class="nav nav-tabs pull-right">
              <li><a href="#growth_dev" data-toggle="tab">Growth and Development</a></li>
              <li class="active"><a href="#follow_up" data-toggle="tab">Follow Up Visits</a></li>
            </ul>
            <div class="tab-content no-padding">
              <!-- Morris chart - Sales -->
              <div class="chart tab-pane active" id="follow_up" >
                <div class="row">
                  <div class="col-md-12">
                    <div class="box box-info">
                      <div class="box-header">
                        <center><h3 class="box-title">Vital Signs and Diagnoses</h3></center>
                      </div>
                      <div class="box-body">
                        <table id="vitalsignsTable" class="table table-hover">
                          <thead>
                            <tr>
                              <th>DATE</th>
                              <th>WEIGHT</th>
                              <th>HEIGHT</th>
                              <th>TEMPERATURE</th>
                              <th>ALLERGIES</th>
                              <th>DIAGNOSIS AND DOCTOR'S NOTES</th>
                            </tr>
                          </thead>
                          <tbody>
                            @foreach($medrecord as $d)
                            <tr>
                              <td>{{$d->date}}</td>
                              <td>{{$d->weight}}</td>
                              <td>{{$d->height}}</td>
                              <td>{{$d->temperature}}</td>
                              <td>{{$d->allergies}}</td>
                              <td>{{$d->diagnosisNotes}} </td>
                            </tr>
                            @endforeach
                          </tbody>  
                        </table>
                        
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="chart tab-pane" id="growth_dev" style="position: relative height: 400px;">
                <div class="box box-info">
                  <div class="box-header">
                    <h3 class="box-title">Height Change</h3>
                  </div>
                  <div class="box-body">
                    <canvas id="heightChart"></canvas>
                  </div>
                </div>
                <div class="box box-info">
                  <div class="box-header">
                    <h3 class="box-title">Weight Gain</h3>
                  </div>
                  <div class="box-body">
                    <canvas id="weightChart"></canvas>
                  </div>
                </div>
              </div>
            </div>
          </div> 

        </div>
      </div> 
    </div>
  </div>
</div>
</section>
</div>
@include('layouts.footer')


<div class="modal fade" id="editmodal">
  @include('includes.editinfo')
</div>
</div>

<script>
  
  $(document).ready( function () {
   
    $('#medRecordTable').DataTable();
    $('#vitalsignsTable').DataTable();
          
           
    $("a.collapsed").click(function(){
      $(this).find(".btn:contains('answer')").toggleClass("collapsed");
    });

    var id=$(this).data("id");  
    var url = window.location.href+"/graph";
    var height = new Array();
    var weight = new Array();
    var w = new Array();
    var h = new Array();
    var d = new Array();
    var label = ["Birth"];
    $.get(url, function(response){
      response.forEach(function(data){
        height=[data.birth_length];
        weight=[data.birth_weight];
        h.push(data.height);
        w.push(data.weight);
        d =[data.age];
        Array.prototype.push.apply(height,h);
        Array.prototype.push.apply(weight,w);
        Array.prototype.push.apply(label,d);
      });
      var ctxL = document.getElementById("heightChart").getContext('2d');
      var myLineChart = new Chart(ctxL, {
        type: 'line',
        data: {
          labels: label,
          datasets: [{
            label: "Height(cm)",
            data: height,
            backgroundColor: [
            'rgba(105, 0, 132, .2)',
            ],
            borderColor: [
            'rgba(200, 99, 132, .7)',
            ],
            borderWidth: 2
          }
          ]
        },
        options: {
          responsive: true
        }
      });

      var ctxL = document.getElementById("weightChart").getContext('2d');
      var myLineChart = new Chart(ctxL, {
        type: 'line',
        data: {
          labels: label,
          datasets: [
          {
            label: "Weight(kg)",
            data: weight,
            backgroundColor: [
            'rgba(0, 137, 132, .2)',
            ],
            borderColor: [
            'rgba(0, 10, 130, .7)',
            ],
            borderWidth: 2
          }
          ]
        },
        options: {
          responsive: true
          
        }
      });
      
    } );
  
    $('#addDoseModal').on('shown.bs.modal',function (e) {
      e.preventDefault();
      var button = $(e.relatedTarget)           
            var vac_id = button.data('vacid')
            var vac_name = button.data('vacname')
            var patient = button.data('patient')
            $('#addDoseModal').find('.modal-body #vac_id').val(vac_id);
            $('#addDoseModal').find('.modal-body #patient_id').val(patient);
            $('#addDoseModal').find('.modal-body #vac_name').val(vac_name); 

  } ); 
  $('#vactype').on('change', function(e){
      console.log(e);
      var vac_id = e.target.value;

      $.get('{{ url('administervaccine') }}/create/ajax-state?vac_id=' + vac_id, function(data) {
          console.log(data);
          $('#vaclotnumber').empty();
          var lotno = $('#lotnumber').html('<option value="" disabled selected>-select lot no-</option>');
          $.each(data, function(index,value){
            lotno.append('<option value="'+value.vaccine_lot_number+'">'+value.vaccine_lot_number+'</option>');
          });
      });
  });
   
        });
        function loadmodal(id){
          $.ajax({
          type: 'GET',
          url: '/administervaccine/' + id,
          success: function(data){
            console.log(data);
            var html = $('#here').html('<option value=" " disabled selected>Vaccine Lot Number</option>');
            $.each(data,function(index,val){
               html.append('<option value="'+val.vaccine_lot_number+'">'+val.vaccine_lot_number+'</option>');
            });
            
        }
        });
        }

        function loadtable(vacid,pid){
          $.ajax({
          url: '/populateimmunizationtable/'+vacid+'/'+ pid,
          dataType: "json",
          success: function(data){
            $('#immunetable'+vacid+' tr').not(':first').remove();
            var html = '';
            $.each(data,function(index,value){ 
              html +='<tr id="body" style="background-color:#ffeed2">';
              html +='<td></td>';
              html +='<td><font color="#a65e2e">'+ value.vdate_administered + '</font></td>';
              html +='<td><font color="#a65e2e">'+ value.vaccine_lot_number + '</font></td>';
              html +='</tr>';
              
             
            });
            $('#immunetable'+vacid+' tr').first().after(html);
            $('#immunetable'+vacid+' tr:not(:first)').each(function(idx){
                $(this).children().first().html('<font color="#a65e2e">'+(idx+1)+'</font>');
            });
          }
          });
        }
      
        
      
</script>




</body>
</html>
