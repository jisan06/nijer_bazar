@extends('frontend.master')

@section('title', 'View Cart')

@section('mainContent')

<div class="main-container container">
	<div class="row">
		<div class="col-md-12" id="content">
			<h2 class="heading-title">Terms and Conditions</h2>
			<div class="">
				<?php
					echo @$termsCondition->description;
				?>

				<h3>Contact Us</h3>
				<p>If you have any questions about this Agreement, please contact us filling this <a href="{{url('/contact-us')}}" class='contact-form'>contact form</a></p>
			</div>
		</div>			
	</div><!-- /.row -->
</div>

@endsection

