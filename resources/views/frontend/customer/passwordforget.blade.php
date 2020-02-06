@extends('frontend.master')

@section('title', 'Password Recover - Driver Vara')

@section('mainContent')
	<div class="container" style="min-height: 300px;">
		<div class="row">
		<div style="margin-top: 20px;" class="col-md-5 col-md-offset-4">
			<div class="login-panel panel panel-default">
                    <div class="panel-heading">
			<?php
				$message = Session::get('msg');
				  if (isset($message)) {
				    echo $message;
				  }
				  
				?>
			
				<form action="{{url('/customer/password-mail')}}" method="post">
					{{ csrf_field() }}  
			  <div class="form-group">
			    <label for="exampleFormControlInput1" style="font-size: 13px !important;">Give Your Email Address</label>
			    <input type="text" class="form-control" id="exampleFormControlInput1" name="email" placeholder="Enter your email address" value="{{old('email')}}" required=>
			  </div>


			 <button class="btn btn-primary">Submit</button>	

			

			</form>
		</div>
	</div>
		</div>
	</div>

</div>


	

@endsection