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


          <!-- Alert Message for re-schedule -->
        <div class="container">
          @if(session()->has('resched'))
          <div class="row">
            <div class="col-md-11">
            <div class="alert alert-info">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
             {{ session()->get('resched') }}
            </div>
            </div>
          </div>
          @endif
        </div>
        <div class="box box-solid box-primary">
          <div class="box-header">
              

            <h3 class="box-title">Scheduled Patients</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
              
             <table id="printTable" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
               
              <thead>
                <tr role="row">
                  <th>PATIENT'S NAME</th>
                  <th>GENDER</th>
                  <th>DATE OF SCHEDULE</th>
                  <th>MODIFY</th>
                </tr>
                
              </thead>
              <tbody>
                  @foreach($schedpatients as $sched)
                  <tr>
                  <td>{{$sched->patient_fname}} {{$sched->patient_lname}}</td>
                  <td>{{$sched->patient_gender}}</td>  
                  <td>{{$sched->appointment_date}}</td>       
                <td><center><button class="btn btn-info" id="{{$sched->id}}" name="{{$sched->appointments_id}}" onClick="loadmodal(this.id,this.name)" data-name="{{$sched->patient_lname}},{{$sched->patient_fname}}"  data-date="{{$sched->appointment_date}}" data-toggle="modal" data-target="#editpat">Edit Schedule </button>

                  
                  </tr>
                  @endforeach
            </tbody>
               
            
          </table>

             <!--/. edit sched modal start --> 
             <div class="modal fade" id="editpat">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title">Edit Schedule patient</h4>
                    </div>
                    <form id="search-form"  method="POST">
                      {{ csrf_field() }}
                      <div class="modal-body">
                        @include('pages.newschedform')
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Save Changes </button>
                      </div>
                    </form>
                  </div>
                </div>
                <!--/. edit Sched modal end -->
        </div></div>
      </div>

          <div class="box-footer">
          <!--<button class="btn btn-primary pull-right">Print Report</button>-->   
      </div>
        </div>
        <!-- /.box-body --> 
      </div>
    </section>

    @include('layouts.footer')

    <script>

      $(document).ready( function () {
        $('#printTable').DataTable();
} );

    </script>
       <!--./Edit schedule Script Start -->
       <script>
        $('#editpat').on('show.bs.modal', function (event) {
          var button = $(event.relatedTarget) 
          
          var patname = button.data('name')
          var appointdate = button.data('date')           
          var modal = $(this)
          
          modal.find('.modal-body #patname').val(patname);
          modal.find('.modal-body #date').val(appointdate);         
      
        })
        function loadmodal(pid,aid){
              $("#search-form").attr("action", "edit_sched/" + pid + "/" +aid);
            }
      </script>
      <!--./Edit schedule Script End -->
    </body>
  </html>
