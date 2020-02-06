@extends('frontend.master')

@section('title', 'View Cart')

@section('mainContent')

<style type="text/css">
	.title{
		text-align: center;
		font-family: sans-serif;
	}


</style>

	<div class="main-container container">
		<div class="row">
			<div class="col-md-12" id="content">
			<h1 class="title">{{@$paymentPolicy->title}}</h1>

			<?php echo @$paymentPolicy->description; ?>
	</div><!-- /.row -->
</div><!-- /.container -->

</div>

@endsection

