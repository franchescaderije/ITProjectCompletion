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
        <div class="box box-solid box-primary">
          <div class="box-header">
            <h3 class="box-title">Done Schedule</h3>
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
                  @if(Auth::User()->position == "admin" || Auth::User()->position == "assistant")
                  <th>PAYMENT</th>
                  @endif
                </tr>
                
              </thead>
              <tbody>
                  
                @foreach($donepatients as $done)
                <tr>
                <td>{{$done->patient_fname}} {{$done->patient_lname}}</td>
                <td>{{$done->patient_gender}}</td>  
                <td>{{$done->appointment_date}}</td>       
                @if(Auth::User()->position == "admin" || Auth::User()->position == "assistant")
                  @if($done->status != "Paid")
                  <td><center><button class="btn btn-success" id="{{$done->id}}" name="{{$done->appointments_id}}" onClick="loadalert(this.id,this.name)"  data-name="{{$done->patient_fname}} {{$done->patient_lname}}" data-amount="{{$done->amount}}"  data-toggle="modal" data-target="#receivepayment">Receive Payment</button></center></td>
                  @else
                  <td><center><span>&#8369;</span>{{$done->amount}}</center></td>
                  @endif
                @endif
                
                </tr>
                @endforeach
                  
            </tbody>
            
          </table></div></div>
          <div class="box-footer">
          <!--<button class="btn btn-primary pull-right">Print Report</button>-->   
      </div>
        </div>
        <!-- /.box-body --> 
      </div>
    </section>

    @include('layouts.footer')
     <!--/. receive payment  modal start --> 
     <div class="modal fade" id="receivepayment">
        <div class="modal-dialog">
          <div class="modal-content">
          <form id="receive-form"  method="POST">
                {{ csrf_field() }}
                <div class="modal-body">
                 <div id="contenthere"></div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancel</button>
                  <button type="submit" class="btn btn-primary">Done</button>
                </div> 
              </form>
            </div>
          </div>
        </div>
         <!--/. receive payment modal end -->

    <script>

      $(document).ready( function () {
        $('#printTable').DataTable();
} );
        $('#receivepayment').on('show.bs.modal', function (event) {
              var button = $(event.relatedTarget) 
              
              var patname = button.data('name')
              var serviceamount = button.data('amount')            
              var modal = $(this)
              
               modal.find('.modal-body #contenthere').html("");  
               modal.find('.modal-body #contenthere').html("<center> <p>Receive an amount of <span>&#8369;</span>"+serviceamount+", as payment for the service </p><p>given to patient "+ patname +" </p></center>");        
             
            })
            function loadalert(pid,aid){
              $("#receive-form").attr("action", "receive_payments/" + pid + "/" +aid);
            }

    </script>
    </body>
  </html>
