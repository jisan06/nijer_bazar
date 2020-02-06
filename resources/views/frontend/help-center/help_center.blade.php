@extends('frontend.master')

@section('title', 'View Cart')

@section('mainContent')

<style type="text/css">
	.title{
		text-align: center;
		font-family: sans-serif;
	}


</style>

	<div class="container">
	    <div class="contact-page">
			<h1 class="title">{{@$helpCenter->title}}</h1>

			<?php echo @$helpCenter->description; ?>
	</div><!-- /.row -->
</div><!-- /.container -->


<section class="bottom-section">
<div class="container">

@endsection

