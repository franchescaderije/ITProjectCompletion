<!DOCTYPE html>
<html>

@include('layouts.head')

<body class="hold-transition skin-purple sidebar-mini">
  <div class="wrapper">


    @include('layouts.header')


    <!-- NAVIGATION -->
    @include('layouts.navigation')
    <!-- END -->
    
    <div class="content-wrapper">
      <section class="content">
          @if(count($errors)>0)
          <ul>
            @foreach($errors->all() as $error)

            <div class="row">
              <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <strong>{{$error}}</strong>
              </div>
            </div>              
            @endforeach
          </ul>
          @endif
          <!-- Alert Message  -->
          <div class="container">
            @if(session()->has('notif'))
            <div class="row">
                <div class="col-md-11">
              <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <strong></strong> {{ session()->get('notif') }}
              </div>
            </div>
            </div>
            @endif
          </div>
          <div class="container">
              @if(session()->has('message'))
              <div class="row">
                  <div class="col-md-11">
                <div class="alert alert-info">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <strong></strong> {{ session()->get('message') }}
                </div>
              </div>
              </div>
              @endif
          </div>
          
        <div class="box box-solid box-primary">
          <div class="box-header">
              
            <h3 class="box-title">List of Patients</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
              
             <table id="printTable" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
               
              <thead>
                <tr role="row">
                  <th>PATIENT'S NAME</th>
                  <th>DATE OF BIRTH</th>
                  <th>GENDER</th>
                  @if(Auth::User()->position == "assistant" || Auth::User()->position == "admin")
                  <th></th>
                  @endif
                </tr>
                
              </thead>
              <tbody>
                  @if(count($patients)> 0)
                  @foreach ($patients as $patientRet)
                  <tr>
                    <td><a href="/create/{{$patientRet->id}}">{{$patientRet->patient_fname}} {{$patientRet->patient_lname}}</a></td>
                    <td>{{$patientRet->patient_bday}}</td>
                    <td>{{$patientRet->patient_gender}}</td>
                    {{-- <td><center>{{link_to_route('appointment.create','Add schedule',null,['class'=>'btn btn-primary'])}}</center></td> --}}
                    @if(Auth::User()->position == "assistant" || Auth::User()->position == "admin")
                    <td>  
                        <button data-name="{{$patientRet->patient_lname}},{{$patientRet->patient_fname}}"  data-patid={{$patientRet->id}} data-toggle="modal" data-target="#appoint">Appoint Here </button>
                    </td>
                      @endif
                  </tr>
                  @endforeach

              @endif
                  
            </tbody>

            
          </table>
            <!--/. appoint modal start --> 
            <div class="modal fade" id="appoint">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title">Appoint patient</h4>
                    </div>
                    <form action="/patient_list"  method="POST">
                      {{ csrf_field() }}
                      <div class="modal-body">
                        @include('pages.patientform')
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Save Changes </button>
                      </div>
                    </form>
                  </div>
                </div>
                <!--/. appoint modal end --></div></div>
              </div>
          
          <div class="box-footer">
          <!--<button class="btn btn-primary pull-right">Print Report</button>-->   
          </div>
        </div>
       
        <!-- /.box-body --> 
      </div>
    </div>

    </section>

@include('layouts.footer')

    <script>

      $(document).ready( function () {
        $('#printTable').DataTable();
} );

    </script>

    <!--./Edit appoint Script Start -->
    <script>
          $('#appoint').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) 
            
            var patname = button.data('name')
            var appointdate = button.data('date')           
            var pat_id = button.data('patid')
            var modal = $(this)
            
            modal.find('.modal-body #patname').val(patname);
            modal.find('.modal-body #date').val(appointdate);         
            modal.find('.modal-body #pat_id').val(pat_id);
          })
        </script>
        <!--./Edit appoint Script End -->
    </body>
  </html>
