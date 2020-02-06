@extends('frontend.master')

@section('mainContent')
	<div class="container">
		<div class="row">
		<div style="margin-top: 20px;" class="col-md-5 col-md-offset-4">
			<div class="login-panel panel panel-default">
                    <div class="panel-heading">
			<?php
				$message = Session::get('msg');
				  if (isset($message)) {
				    echo"<div style='display:inline-block;width:auto;' class='alert alert-success'><strong>" .$message."</strong></div>";
				  }
				  
				?>
			@if( count($errors) > 0 )
						  	
			  	<div style="display: inline-block;width: auto;" class="alert alert-danger">{{ $errors->first() }}</div>
			  	
		@endif
		<h4>Set Your New Password</h4>
				<form action="{{url('/customer/password-save')}}" method="post">
					{{ csrf_field() }}  
			  <div class="form-group">
			  	<input type="hidden" name="email" value="{{$customer->email}}">
			    <label for="exampleFormControlInput1">Password</label>
			    <input type="password" class="form-control" id="exampleFormControlInput1" name="password" placeholder="Enter your new password" required=>
			  </div>

			  <div class="form-group">
			    <label for="exampleFormControlInput1">Confirm Password</label>
			    <input type="password" class="form-control" id="exampleFormControlInput1" name="confirmPassword" placeholder="Confirm your password" required=>
			  </div>


			 <button class="btn btn-success">Submit</button>	

			</form>
		</div>
	</div>
		</div>
	</div>

</div>


	

@endsection