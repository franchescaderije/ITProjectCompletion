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
            <h3 class="box-title">Archive Patient Profile</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                <!--Patieny profile---->    
                <div class="active tab-pane" id="printdiv">
                    @foreach($patient as $list)
                            <center><h3 class="box-title">{{$list->patient_fname}} {{$list->patient_lname}}</h3></center>
                       
                            <div class="box box-info">
                              <div class="box-header with-border">
                                <!---------------INFORMATION------------------>
                                <h3 class="box-title">General Information</h3>
                              </div>
                              <div class="box-body">
                                <table class='table table-bordered'>
                                  <tr>
                                    <th>Gender:</th>
                                    <td>{{$list->patient_gender}}<span class="text-muted"></span></td>
                                    
                                    <th>Birthday:</th>
                                    <td>{{$list->patient_bday}}<span class="text-muted"></span> </td>
                                  </tr>
                                  <tr>
                                    <th>Mother:</th>
                                    <td>{{$list->mother_name}}<span class="text-muted"></span></td>
                                    <th>Occupation:</th>
                                    <td>{{$list->mother_occupation}}<span class="text-muted"></span></td>
                                  </tr>
                                  <tr>
                                    <th>Father:</th>
                                    <td>{{$list->father_name}}<span class="text-muted"></span></td>
                                    <th>Occupation:</th>
                                    <td>{{$list->father_occupation}}<span class="text-muted"></span></td>
                                  </tr>
                                  <tr>
                                    <th>Address:</th>
                                    <td>{{$list->patient_address}}<span class="text-muted"></span></td>
                                    <th>Contact Number:</th>
                                    <td>{{$list->contact_number}}<span class="text-muted"></span></td>
                                  </tr>
                                </table>
                              </div> 
                            </div> 
                            <!---------------BIRTH HISTORY------------------>
                            <div class="box box-info">
                              <div class="box-header with-border">
                                <h3 class="box-title">Birth History</h3>
                              </div>
                              <div class="box-body">
                                <table class='table table-bordered'>
                                  <tr>
                                    <th>Type of Delivery:</th>
                                    <td>{{$list->type_of_delivery}}<span class="text-muted"></span></td>
                                    <th>Head Circumference:</th>
                                    <td><span class="text-muted">{{$list->head_cire}} cm</span></td>
                                    
                                  </tr>
                                  <tr>
                                    <th>Blood Type:</th>
                                    <td>{{$list->blood_type}}<span class="text-muted"></span></td>
                                    <th>Chest Circumference:</th>
                                    <td><span class="text-muted">{{$list->chest_cire}} cm</span></td>
                                  </tr>  
                                  <tr>
                                    <th>Birth Length:</th>
                                    <td><span class="text-muted">{{$list->birth_length}} cm</span></td>
                                    <th>Abdominal Circumference:</th>
                                    <td><span class="text-muted">{{$list->abdominal_cire}} cm</span></td>
                                  </tr> 
                                  <tr>
                                    <th>Birth Weight:</th>
                                    <td><span class="text-muted">{{$list->birth_weight}} kg</span></td>
                                  </tr> 
                                </table>
                              </div>
                            </div>
                            @endforeach

                            <!---------------IMMUNIZATION------------------>
                            <div class="box box-info">
                                    <div class="box-header with-border">
                                      <h3 class="box-title">Immunization Record</h3>
                                    </div>
                                    <div class="box-body">
                                     
                                      <table class='table table-bordered'>
                                        <tr>
                                          <th width="50%">Vaccine</th>
                                          <th width="25%">Dose</th>
                                          <th width="25%">Date Administered</th>
                                        </tr>
                                        @foreach($immunization as $shots)
                                        <tr>
                                        <th>{{$shots->vaccine_type_name}}</th>
                                        <th></th>
                                        <th>{{$shots->vdate_administered}}</th>
                                            
                                        </tr>
                                        @endforeach
                                      </table>
                                    </div>
                                  </div> 



                                  <div class="box-footer">
                                        <button id="printButton" class="btn btn-primary pull-left">Print Report</button> 
                                          
                                        <!--button type="button" class="btn btn-info pull-right" data-toggle="modal" data-target="#editmodal">Edit</button-->
                                        
                                      </div> 
                          </div><!---end of patient profile info--->
                        




             </div></div>
          <div class="box-footer">
          <!--<button class="btn btn-primary pull-right">Print Report</button>-->   
      </div>
        </div>
        <!-- /.box-body --> 
      </div>
    </section>

    @include('layouts.footer')

        <script>


            function printData(){
            var divToPrint=document.getElementById("printdiv");
            newWin= window.open("");
            newWin.document.write(divToPrint.outerHTML);
            newWin.print();
            newWin.close();
            }$('#printButton').on('click',function(){
            printData();
            })
        </script>
    </body>
  </html>
