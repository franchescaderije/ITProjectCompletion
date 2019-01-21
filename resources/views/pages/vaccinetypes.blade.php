<!DOCTYPE html>
<html>
<head>
  @include('layouts.head')
</head>
<header class="main-header">
  @include('layouts.header')
</header>
@include('layouts.navigation')
<body class="hold-transition skin-purple sidebar-mini">
  <div class="wrapper">
    <div class="content-wrapper">
      <section class="content">
        <div class="box">
          <div class="box-header">

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
            <!-- Alert Message Added Vaccines -->
            <div class="container">
              @if(session()->has('notif'))
              <div class="row">
                <div class="col-md-11">
                <div class="alert alert-success">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <strong>Vaccine Type</strong> {{ session()->get('notif') }}
                </div>
              </div>
              </div>
              @endif
            </div>

            <!-- Alert Message Updated Vaccine type-->
            <div class="container">
              @if(session()->has('update'))
              <div class="row">
                <div class="col-md-11">
                <div class="alert alert-info">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <strong>Vaccine Type</strong> {{ session()->get('update') }}
                </div>
              </div>
              </div>
              @endif
            </div>

            <!-- Alert Message Updated Vaccines -->
            <div class="container">
              @if(session()->has('updated'))
              <div class="row">
                  <div class="col-md-11">
                <div class="alert alert-info">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <strong>Vaccine</strong> {{ session()->get('updated') }}
                </div>
              </div>
              </div>
              @endif
            </div>
          </div>

          <!-- /.box-header -->
          <div class="box-body">
            <table id="userTable" class="table table-bordered dataTable" role="grid" aria-describedby="example2_info">

              <tr role="row" style="background-color:#ffc696">
                <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Vaccine Type</th>
                <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Required Dosage</th>
                <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Vaccine Description</th>
                <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Total Quantity</th>
                <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending"></th>

                @if(Auth::User()->position == "admin" || Auth::User()->position == "assistant")
                <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">
                  <center>{{ link_to_route('vaccinetypes.create','Add New Vaccine Type',null,['class'=>'btn btn-primary btn-lg']) }} </center>
                </th>
                @endif  
                
              </tr>
              <form action="vaccinetypes" method="POST">
                {{csrf_field()}}
                @foreach($vaccines as $vaccine)
                <tr role="row" class="odd">
                  <td class="sorting_1"><font size="5px">{{ $vaccine->vaccine_type_name }}</font></td>
                  <td class="sorting_1"><font size="3px">{{ $vaccine->vaccine_dose}}</font></td>             
                  <td class="sorting_1"><font size="3px">{{ $vaccine->vaccine_type_description }}</font></td>
                  <td class="sorting_1"><font size="5px">{{$vaccine->vaccine_count}}</font></td>
                  @if(Auth::User()->position == "admin" || Auth::User()->position == "assistant")
                  <td> <a href="/vaccinetypes/{{$vaccine->id}}/edit" class="btn btn-default"> Edit </a> </td>
                  @endif  
                  <td> 
                   <center> <button type="submit" name="id_vac" class="btn btn-info" value="{{$vaccine->id}}"> View Vaccines </button> </center>
                  </td>
                </tr>
                @endforeach
              </form>
            </table>
          </div>
          <!--./box-body-->
          <!--./box-->
        </section>
        <!--./content-->
      </div>
      <!--./content-wrapper-->
    </div>
    @include('layouts.footer')
  </body>
  </html>
