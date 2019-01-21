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
            <h3 class="box-title">Archive Patient List</h3>
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
                </tr>
                
              </thead>
              <tbody>
                  @foreach($patient as $list)
                  <tr>
                      <td><a href="/archiveprofile/{{$list->id}}">{{$list->patient_fname}} {{$list->patient_lname}}</a></td>
                      <td>{{$list->patient_bday}}</td>
                      <td>{{$list->patient_gender}}</td>
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

    <script>

      $(document).ready( function () {
        $('#printTable').DataTable();
} );

    </script>
    </body>
  </html>
