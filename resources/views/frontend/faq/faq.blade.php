@extends('frontend.master')

@section('title', 'View Cart')

@section('mainContent')

<style type="text/css">
	.panel-body{
		text-align: justify;
	}
</style>

<div class="main-container container">
		<div class="row">
			<div class="col-md-12" id="content">
				<h2 class="heading-title">Frequently Asked Questions</h2>
				
				<div class="panel-group checkout-steps" id="accordion">
					<!-- checkout-step-01  -->
			<?php $i = 1; ?>
		@foreach($faqs as $faq)

			<div class="panel panel-default checkout-step-{{$i}}">

				<!-- panel-heading -->
					<div class="panel-heading">
			    	<h4 class="unicase-checkout-title">
				        <a data-toggle="collapse" <?php if($i>1){ ?> class="collapsed" <?php } ?> data-parent="#accordion" href="#collapse{{$i}}">
				          <span>{{$i}}</span>{{$faq->title}} ?
				        </a>
				     </h4>
			    </div>
			    <!-- panel-heading -->

				<div id="collapse{{$i}}" class="panel-collapse collapse <?php if($i == 1){ ?> in <?php } ?>">

					<!-- panel-body  -->
				    <div class="panel-body">
				    	{{$faq->description}}			
					</div>
					<!-- panel-body  -->

				</div><!-- row -->
			</div>
			<?php $i++; ?>
		@endforeach
			
			
				  	
				</div><!-- /.checkout-steps -->
			</div>
		</div><!-- /.row -->
	</div><!-- /.checkout-box -->
	

</div>
</div><!-- /.container -->


@endsection

