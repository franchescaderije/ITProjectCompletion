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
								<div class="alert alert-danger">
									<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
									<strong>{{$error}}</strong>
								</div>
							</div>
							
							
							@endforeach
							
						</ul>
						
						@endif
					</div>

					<!-- /.box-header -->
					<div class="box-body">
							@if(count($patient)> 0)
							@foreach ($patient as $patientRet)
						<h2>{{$patientRet->patient_fname}} {{$patientRet->patient_lname}}</h2>
						@endforeach

						@endif
						{!! Form::open(['route'=>'schedulenew.store', 'method' => 'POST']) !!}

						<div class="form-group">
							{!! Form::label('patients_id','Patient ID') !!}
							{!! Form::text('patients_id',$patientRet->id,['class'=>'form-control','readonly'])!!}
						</div>

						<div class="form-group">
							{!! Form::label('appointment_date',' Add Patient Schedule') !!}
							{!! Form::date('appointment_date',null,['class'=>'form-control'])!!}
						</div>
						

						<div class="form-group">
							{!! Form::button('Submit',['type'=>'submit','class'=>'btn btn-primary']) !!}
						</div>
						{!! Form::close() !!}
					</div>
					<!--./box-body-->
					<div class="box-footer clearfix">
					</div>
				</div>
				<!--./box-->
			</section>
			<!--./content-->
		</div>
		<!--./content-wrapper-->
	</div>
	<!--./wrapper-->

	@include('layouts.footer')

</body>
</html>
