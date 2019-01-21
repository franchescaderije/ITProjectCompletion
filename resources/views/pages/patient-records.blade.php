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
              <h3 class="box-title">List of Patients</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                @if (Session::has('message'))
                <div class="alert alert-info">{{ Session::get('message') }}</div>
                @endif
			  <table id="recordsTable" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                <thead>
                  <tr role="row">
                    <th>FIRST NAME</th>
                    <th>LAST NAME</th>
                    <th>MIDDLE NAME</th>
                    <th>DATE OF BIRTH</th>
                    <th>GENDER</th>
                    <th>STATUS</th>
                  </tr>
                </thead>
                <tbody>
                  
                 @if(count($patients)> 0)
                  @foreach ($patients as $patientRet)
                   
                  <tr style="cursor: pointer" data-toggle="modal" data-target="#viewModal">
                      <td><a href="/create/{{$patientRet->id}}">{{$patientRet->patient_fname}}</a></td>
                      <td>{{$patientRet->patient_lname}}</td>
                      <td>{{$patientRet->patient_mname}}</td>
                      <td>{{$patientRet->patient_bday}}</td>
                      <td>{{$patientRet->patient_gender}}</td>
                      <td></td>
                    </tr>
                  @endforeach

                 @endif
                </tbody>
                
              </table></div></div>
			    <div class="box-footer clearfix">
            
            <form role="form" action="/patient-form" method="post">
              @csrf
              <input type="hidden" name="origin" value="create">
              <button type="submit" class="btn btn-info pull-right">Add Patient</button>
            </form>
            <!--<button type="button" class="btn btn-primary pull-right" onclick="location.href='/patient-form'" >Add a Patient</button>-->
         </div>
			  </div>
            <!-- /.box-body -->
          </div>
</section>

@include('layouts.footer')

<script>
  $(document).ready( function () {
      $('#recordsTable').DataTable();

       $('#viewModal').on('show.bs.modal', function (event) {
          var button = $(event.relatedTarget) // Button that triggered the modal
          var id = button.data('id'); // Extract info from data-* attributes
          var name = button.data('name');
          var birthday = button.data('bday');
          var address = button.data('address');
          var mother = button.data('mom');
          var contact = button.data('contact');
          var modal = $(this);
          
          
          modal.find('#viewForm').attr("action", url );
          modal.find('.modal-body #patientID').val(id);
          modal.find('.modal-body h3').html(name);
          modal.find('.modal-body #bday span').html(birthday);
          modal.find('.modal-body #address span').html(address);
          modal.find('.modal-body #mother span').html(mother);
          modal.find('.modal-body #contact span').html(contact);
    })
    
  } );
</script>

</body>
</html>
