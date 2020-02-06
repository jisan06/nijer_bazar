@extends('frontend.master')

@section('mainContent')
	
	  
	<div class="container">

		<h2>{{@$menus->menuTitle}}</h2>
		<br>

		<?php
			echo @$menus->menuContent;
		?>
	
	</div>
			

	<section class="bottom-section">
<div class="container">



@endsection

