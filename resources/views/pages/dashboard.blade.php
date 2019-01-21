<!DOCTYPE html>
<html>
  <head>
    @include('layouts.head')
    <style>
    .btn-margin-left{
      margin-left: 15%;
    }
    .btn-margin-right{
      margin-right: 15%;
    }
    .css-serial {
      counter-reset: serial-number;  /* Set the serial number counter to 0 */
    }

    .css-serial td:first-child:before {
      counter-increment: serial-number;  /* Increment the serial number counter */
      content: counter(serial-number);  /* Display the counter */
    }
    </style>
  </head>
  <body class="hold-transition skin-purple sidebar-mini">
    <div class="wrapper">
        <header class="main-header">
          @include('layouts.header')
        </header>
        <!-- NAVIGATION -->
         @include('layouts.navigation')
    
    <div class="content-wrapper">
        <section class="content">
      
        <div class="row">
          <!-- Available  Vaccines box-->  
            <div class="col-lg-3 col-xs-6">
              <div class="small-box bg-aqua">
                <div class="inner">
                  @foreach($vaccines as $vaccine)
                  @if($vaccine->vaccine_count >= 1)
                    <h3>{{($vaccine->vaccine_count)}}</h3>
                  @else
                    <h3>0</h3>
                  
                  @endif
                    @endforeach

                    <p>Available Vaccines</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                    <a  role="button" href="vaccinetypes" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div>
         <!-- Available  Vaccines box end-->

         <!-- Expiring Vaccines box-->  
            <div class="col-lg-3 col-xs-6">
              <div class="small-box bg-red">
                <div class="inner">
                  @foreach($expvac as $expvacs)
                    @if($expvacs->vaccine_count >= 1)
                      <h3>{{($expvacs->vaccine_count)}}</h3>
                    @else
                      <h3>0</h3>
                    @endif
                  @endforeach  
                  <p>Vaccines Expiring Soon</p>
                </div>
                <div class="icon">
                  <i class="fa fa-bell-o"></i>
                </div>
                <a  role="button" class="small-box-footer" data-toggle="modal" data-target="#expvacModal">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <!-- Expiring  Vaccines box end--> 

          <!-- Active Patient box -->
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
              <div class="inner">
                <h3>{{count($active)}}</h3>

                <p>Active Patients</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <a  role="button" href="/appointment" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
        @if(Auth::User()->position == "admin")
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-yellow">
              <div class="inner">
                <h3> {{count($employees)}}</h3>  
                <p>Active Users</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="" class="small-box-footer">Administrator </a>
            </div>
          </div>
        @endif
        <!-- Active Patient box ending -->

          <!--Archived Patient--> 
          @if(Auth::User()->position == "assistant" || Auth::User()->position == "doctor")
              <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-yellow">
                      <div class="inner">
                        <h3> {{count($archive)}}</h3>  
                        <p>Archive Records</p>
                      </div>
                      <div class="icon">
                        <i class="ion ion-person-add"></i>
                      </div>
                      <a href="/archive" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
              </div>
          @endif
          <!-- Archived Patient box ending -->
        </div>
        @if(count($errors)>0)
              <ul>
                @foreach($errors->all() as $error)
                <div class="row">
                  <div class="col-md-11">
                  <div class="alert alert-danger">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <strong>{{$error}}</strong>
                  </div>
                </div>
                </div>              
                @endforeach
              </ul>
              @endif
            	<!-- Alert Message for Finish sched -->
						<div class="container">
							@if(session()->has('sched'))
							<div class="row">
								<div class="col-md-11">
								<div class="alert alert-info">
									<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
								 {{ session()->get('sched') }}
								</div>
								</div>
							</div>
							@endif
						</div>

            	<!-- Alert Message for Changed sched -->
						<div class="container">
							@if(session()->has('change'))
							<div class="row">
								<div class="col-md-11">
								<div class="alert alert-info">
									<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
								 {{ session()->get('change') }}
								</div>
								</div>
							</div>
							@endif
						</div>

        <div class="box box-solid box-primary">
          <div class="box-header">      
              
                
          <h3 class="box-title">{{Carbon\Carbon::today()->toDateString()}}   Scheduled Patients </h3>
          </div>
                <!-- /.box-header -->
                
          <div class="box-body">
              <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">   
                <table id="printTable" class="table table-bordered table-hover " role="grid">
                    <thead>
                      <tr role="row">
                        <th>NAME</th>
                        <th>GENDER</th>
                        <th><center>AMOUNT TO PAY</center></th>
                        <th><center></center></th>
                        @if(!empty($list->amount))
                        @if(Auth::User()->position == "admin")
                        <th><center></center></th>
                        @endif
                        @endif
                      </tr>
                    </thead>
                    <tbody>
                        @foreach($schedpatient as $list)
                          <tr style="cursor: pointer" data-toggle="modal" data-target="#viewModal">
                              <td><a href="/create/{{$list->id}}">{{$list->patient_fname}} {{$list->patient_lname}}</a></td>
                              <td>{{$list->patient_gender}}</td>
                              <td><center>@if(!empty($list->amount))<span>&#8369;</span>{{$list->amount}}@else  @endif</center></td>
                        @if(!empty($list->amount)) 
                            @if(Auth::User()->position == "doctor")
                            <td><center>     
                            <button class="btn btn-default" id="{{$list->id}}" name="{{$list->appointments_id}}" onClick="loadmodal(this.id,this.name)"  data-name="{{$list->patient_lname}}{{$list->patient_fname}}" data-date="{{$list->appointment_date}}"  data-toggle="modal" data-target="#addpayment" disabled>Add Payments </button>
                            </center></td> 
                            @endif
                            @if(Auth::User()->position == "admin" || Auth::User()->position == "assistant")    
                                <td><center>     
                                <button class="btn btn-success" id="{{$list->id}}" name="{{$list->appointments_id}}" onClick="loadalert(this.id,this.name)"  data-name="{{$list->patient_fname}} {{$list->patient_lname}}" data-amount="{{$list->amount}}"  data-toggle="modal" data-target="#receivepayment">Receive Payment</button>
                              </center></td> 
                            @endif 
                         @else
                            @if(Auth::User()->position == "admin" || Auth::User()->position == "doctor")    
                            <td><center>     
                            <button class="btn btn-info" id="{{$list->id}}" name="{{$list->appointments_id}}" onClick="loadmodal(this.id,this.name)"  data-name="{{$list->patient_lname}}{{$list->patient_fname}}" data-date="{{$list->appointment_date}}"  data-toggle="modal" data-target="#addpayment">Add Payments </button>
                            </center></td> 
                            @else
                             <td></td>
                            @endif 
                         @endif      
                          </tr>
                         @endforeach
                    </tbody>
                </table> 
              </div>
          </div>    
            <div class="box-footer">    
                <button type="button" id="changesched" class="btn btn"><a href="/doneschedule">View Done Schedule </a></button>
                <button type="button" id="changesched" class="btn btn"><a href="/scheduledpatients">View All Patient's Schedule </a></button>
            </div>        
      </div>
    </div>

 </section>
          
  @include('layouts.footer')

                 <!--/. payments  modal start --> 
                 <div class="modal fade" id="addpayment">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span></button>
                          <h4 class="modal-title">Add Payments</h4>
                      </div>
                    <form id="search-form"  method="POST">
                          {{ csrf_field() }}
                          <div class="modal-body">
                            @include('pages.paymentsform')
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Add Payment</button>
                          </div> 
                        </form>
                      </div>
                    </div>
                  </div>
                   <!--/. Payments modal end -->

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

                    <!--/. edit sched modal start --> 
                  <div class="modal fade" id="editsched">
                    <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Edit Schedule patient</h4>
                          </div>
                        <form action="/dashboard_list"  method="POST">
                          {{ csrf_field() }}
                          <div class="modal-body">
                            @include('pages.schedform')
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Save Changes </button>
                          </div>
                        </form>
                      </div>
                    </div>
                </div>
              <!--/. edit Sched modal end -->

              <!--/. Expiring vaccine modal-->
              <div id="expvacModal" class="modal fade">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span></button>
                          <h4 class="modal-title">Vaccines Expiring Soon</h4>
                      </div>
                          <div class="modal-body">
                            <table id="vacTable" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                              <thead>
                                <tr role="row">
                                  <th>VACCINE NAME</th>
                                  <th>LOT NUMBER</th>
                                  <th>QUANTITY</th>
                                  <th>EXPIRATION DATE</th>
                                </tr>
                              </thead>
                              <tbody>
                              
                              @foreach($expvaclist as $expvaclist)
                               <tr>
                                <td>{{$expvaclist->vaccine_name}}</td>
                                <td>{{$expvaclist->vaccine_lot_number}}</td>
                                <td>{{$expvaclist->quantity}}</td>
                                <td>{{$expvaclist->vaccine_expiration_date}}</td>
                              </tr>
                              @endforeach
                              </tbody>
                            </table> 
                          </div>
                          <div class="modal-footer">
                          </div>
                      </div>
                    </div>
                </div>
                <!--/. expiring vaccine modal end -->

          <script>
        $(document).ready( function () {
          $('#vacTable').DataTable();
          $('#printTable').DataTable();
          
        } );
        
      
    
      </script>


         <!--./Payments Script Start -->
         <script>
            $('#addpayment').on('show.bs.modal', function (event) {
              var button = $(event.relatedTarget) 
              
              var patname = button.data('name')
              var appointdate = button.data('date')            
              var modal = $(this)
              
               modal.find('.modal-body #date').val(appointdate);         
               modal.find('.modal-body #patname').val(patname); 
            })

            $('#receivepayment').on('show.bs.modal', function (event) {
              var button = $(event.relatedTarget) 
              
              var patname = button.data('name')
              var serviceamount = button.data('amount')            
              var modal = $(this)
              
               modal.find('.modal-body #contenthere').html("");  
               modal.find('.modal-body #contenthere').html("<center> <p>Receive an amount of <span>&#8369;</span>"+serviceamount+", as payment for the service </p><p>given to patient "+ patname +" </p></center>");   

                   
             
            })

            function loadmodal(pid,aid){
              $("#search-form").attr("action", "add_payments/" + pid + "/" +aid);
            }

            function loadalert(pid,aid){
              $("#receive-form").attr("action", "receive_payments/" + pid + "/" +aid);
            }
            
          </script>
          <!--./Payments Script End -->
    </body>
    </html>
