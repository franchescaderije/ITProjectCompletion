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
        <div class="container">
          @if(session()->has('add'))
          <div class="row">
            <div class="alert alert-success">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <strong>User</strong> {{ session()->get('add') }}
            </div>
          </div>
          @endif
        </div>
        
        <div class="box box-solid box-primary">
          <div class="box-header">
            <h3 class="box-title">Registered Users</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
              
             <table id="recordsTable" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
              <thead>
                <tr role="row">
                  <th>FIRST NAME</th>
                  <th>LAST NAME</th>
                  <th>ROLE</th>
                  <th>USERNAME</th>
                  <th>ADDRESS</th>
                  <th>CONTACT</th>
                </tr>
              </thead>
              <tbody>
                
               @if(count($employee)> 0)
               @foreach ($employee as $employeez)
               
               <tr style="cursor: pointer">
                <td>{{$employeez->employee_fname}}</td>
                <td>{{$employeez->employee_lname}}</td>
                <td>{{$employeez->position}}</td>
                <td>{{$employeez->username}}</td>
                <td>{{$employeez->address}}</td>
                <td>0{{$employeez->contact}}</td>
                <td><button type="button" data-pasid={{$employeez->id}} data-toggle="modal" data-target="#resetpass" class="btn btn-link btn-sm">reset password</button></td>
              </tr>
              @endforeach

              @endif
            </tbody>
            
          </table></div></div>
          <div class="box-footer clearfix">
            
            <form role="form" action="/patient-form" method="post">
              @csrf
              <input type="hidden" name="origin" value="create">
              <button type="button" data-toggle="modal" data-target="#addModal" class="btn btn-info btn-lg pull-right">Add User</button>
            </form>

            <!-- Modal -->
            <div id="resetpass" class="modal fade" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">New Password</h4>
                  </div>
                  <div class="modal-body">
                  
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <div class="card">

                                <div class="card-body">
                                    @if (session('error'))
                                        <div class="alert alert-danger">
                                            {{ session('error') }}
                                        </div>
                                    @endif
                                    @if (session('success'))
                                        <div class="alert alert-success">
                                            {{ session('success') }}
                                        </div>
                                    @endif
                                    <form class="form-horizontal" method="POST" action="{{ url('passReset') }}">
                                        {{ csrf_field() }}

                                        <div class="form-group">
                                            <label for="new-pass" class="col-md-4 control-label"></label>
                                            <input type="hidden" id="employ_id" name="employ_id" value="{{ isset($employee->id) ? $employee->id:''}}">
                                            <input type="hidden" id="employ_oldpass" name="employ_oldpass" value="{{ isset($employee->password) ? $employee->password:''}}">
                                            <div class="col-md-8">
                                              <input id="new-pass" type="text" name="new-pass" value="<?php 
                                            function gen_random_str($length=6)
                                            {
                                                $char ="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
                                                $finalrand ='';
                                                for($i=0;$i<$length; $i++)
                                                {
                                                    $finalrand .= $char[ rand(0,strlen($char)-1)];
                                                }
                                                return $finalrand;
                                            }
                                            echo gen_random_str()."\n";
                                            ?>" required autofocus disabled>
                            
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                          <button type="submit" class="btn btn-primary btn-lg">
                                            {{ __('OK') }}
                                          </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
            </div>
            </div>


            <!-- Modal -->
    <div id="addModal" class="modal fade" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Add User</h4>
          </div>
          <div class="modal-body">
           
            <form method="POST" action="/addUser">
              @csrf

              <div class="form-group row">
                <label for="position" class="col-md-4 col-form-label text-md-right">{{ __('Position') }}</label>

                <div class="col-md-8">
                  <select id="position"  class="form-control{{ $errors->has('position') ? ' is-invalid' : '' }}" name="position" value="{{ old('position') }}" required autofocus>
                    <option value="Doctor">Doctor</option>
                    <option value="Assistant">Assistant</option>
                  </select>
                  @if ($errors->has('position'))
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first('position') }}</strong>
                  </span>
                  @endif
                </div>
              </div>

              <div class="form-group row">
                <label for="employee_lname" class="col-md-4 col-form-label text-md-right">{{ __('Last Name') }}</label>

                <div class="col-md-8">
                  <input id="employee_lname" type="text" class="form-control{{ $errors->has('employee_lname') ? ' is-invalid' : '' }}" name="employee_lname" value="{{ old('employee_lname') }}" required autofocus>

                  @if ($errors->has('employee_lname'))
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first('employee_lname') }}</strong>
                  </span>
                  @endif
                </div>
              </div>


              <div class="form-group row">
                <label for="employee_fname" class="col-md-4 col-form-label text-md-right">{{ __('First Name') }}</label>

                <div class="col-md-8">
                  <input id="employee_fname" type="text" class="form-control{{ $errors->has('employee_fname') ? ' is-invalid' : '' }}" name="employee_fname" value="{{ old('employee_fname') }}" required autofocus>

                  @if ($errors->has('employee_fname'))
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first('employee_fname') }}</strong>
                  </span>
                  @endif
                </div>
              </div>
              <div class="form-group row">
                <label for="address" class="col-md-4 col-form-label text-md-right">{{ __('Address') }}</label>

                <div class="col-md-8">
                  <input id="address" type="text" class="form-control{{ $errors->has('address') ? ' is-invalid' : '' }}" name="address" value="{{ old('address') }}" required autofocus>

                  @if ($errors->has('address'))
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first('address') }}</strong>
                  </span>
                  @endif
                </div>
              </div>
              <div class="form-group row">
                <label for="contact" class="col-md-4 col-form-label text-md-right">{{ __('Contact') }}</label>

                <div class="col-md-8">
                  <input id="contact" type="text" class="form-control{{ $errors->has('contact') ? ' is-invalid' : '' }}" name="contact" value="{{ old('contact') }}" required autofocus>

                  @if ($errors->has('contact'))
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first('contact') }}</strong>
                  </span>
                  @endif
                </div>
              </div>

              <div class="form-group row">
                <label for="username" class="col-md-4 col-form-label text-md-right">{{ __('Username') }}</label>

                <div class="col-md-8">
                  <input id="username" type="text" class="form-control{{ $errors->has('username') ? ' is-invalid' : '' }}" name="username" value="{{ old('username') }}" required>

                  @if ($errors->has('username'))
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first('username') }}</strong>
                  </span>
                  @endif
                </div>
              </div>

              <div class="form-group row">
                <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Password') }}</label>

                <div class="col-md-8">
                  <input id="password" type="text" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" value="<?php 
                        function gen_random_string($length=6)
                        {
                            $chars ="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
                            $final_rand ='';
                            for($i=0;$i<$length; $i++)
                            {
                                $final_rand .= $chars[ rand(0,strlen($chars)-1)];
                            }
                            return $final_rand;
                        }
                        echo gen_random_string()."\n";
                        ?>">

                  @if ($errors->has('password'))
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first('password') }}</strong>
                  </span>
                  @endif
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary">
                {{ __('Register User') }}
              </button>
            </div>

          </form>
        </div>

      </div>
    </div>
          </div>
        </div>
        <!-- /.box-body -->
      </div>
    </section>

    @include('layouts.footer')

    

    <script>
      $(document).ready( function () {
        $('#recordsTable').DataTable();
        
      } );
    </script>

<!--./password  Script Start -->
<script>
  $('#resetpass').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) 

    var pass_id = button.data('pasid')
    var modal = $(this)
    
          
    modal.find('.modal-body #pass_id').val(pass_id);
  })
</script>
<!--./ password Script End -->




  <script type="text/javascript">
    @if (count($errors) > 0)
      $('#addModal').modal('show');
      $('#addModal').modal('hide');
    @endif
  </script>
  
  <script type="text/javascript">
    @if (count($errors) > 0)
      $('#resetpass').modal('show');
      $('#resetpass').modal('hide');
    @endif
  </script>
  </body>
  </html>
