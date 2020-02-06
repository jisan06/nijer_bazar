@extends('frontend.master')

@section('title', 'View Cart')

@section('mainContent')

	<div class="main-container container">
    <div class="row">
      <aside class="col-sm-4 col-md-1 content-aside" id="column-left">
            
       </aside>
	<div id="content" class="col-md-9 col-sm-8">
			<div class="row">
					<div class="col-md-12 contact-map outer-bottom-vs">
						<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d912.8136932171728!2d90.4269609!3d23.7739403!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b858d8f4b873%3A0xe733badc8224fd0f!2sNEO+Technologies!5e0!3m2!1sbn!2sbd!4v1556627189517!5m2!1sbn!2sbd" width="100%" height="450"  style="border:0"></iframe>
					</div>
			</div>
			<div class="row">
			<div class="col-md-12 contact-form">
			<?php
	            $message = Session::get('msg');
	              if (isset($message)) {
	                echo"<div style='display:inline-block;width: auto;' class='alert alert-success'><strong>" .$message."</strong></div>";
	              }

	              Session::forget('msg')
	          
	        ?>


            @if( count($errors) > 0 )
                
            <div style="display:inline-block;width: auto;" class="alert alert-danger">{{ $errors->first() }}</div>
            
        @endif
		<div class="col-md-12 contact-title">
			<h4>Message to Nakshighor</h4>
		</div>
		<form action="{{route('contact.save')}}" method="post" class="register-form">
			{{ csrf_field() }}

		<div class="col-md-6 ">
				<div class="form-group">
			    <label class="info-title" for="exampleInputName">Your Name <span>*</span></label>
			    <input type="text" name="contactName" value="{{ old('contactName') }}" class="form-control unicase-form-control text-input" id="exampleInputName" placeholder="Write your full name" required>
			  </div>
			
		</div>
		<div class="col-md-6">
			
				<div class="form-group">
			    <label class="info-title" for="exampleInputEmail1">Phone Number <span>*</span></label>
			    <input type="number" name="contactPhone" value="{{ old('contactPhone') }}" class="form-control unicase-form-control text-input" id="exampleInputEmail1" placeholder="Write your phone number" required>
			  </div>
			
		</div>
		<div class="col-md-6">
				<div class="form-group">
			    <label class="info-title" for="exampleInputEmail1">Email Address <span>*</span></label>
			    <input type="email" name="contactEmail" value="{{ old('contactEmail') }}" class="form-control unicase-form-control text-input" id="exampleInputEmail1" placeholder="Write your email address" required>
			    @if ($errors->has('contactEmail'))
                @foreach($errors->get('contactEmail') as $error)
                <p class="alert alert-danger">{{ $error }}</p>
                @endforeach
                @endif
			  </div>
			
		</div>
		<div class="col-md-6">
				<div class="form-group">
			    <label class="info-title" for="exampleInputTitle">Subject <span>*</span></label>
			    <input type="text" name="contactTitle" value="{{ old('contactTitle') }}" class="form-control unicase-form-control text-input" id="exampleInputTitle" placeholder="Write your subject" required>
			  </div>
			
		</div>
		<div class="col-md-12">
				<div class="form-group">
			    <label class="info-title" for="exampleInputComments">Your Message <span>*</span></label>
			    <textarea name="contactMessage" class="form-control unicase-form-control" id="exampleInputComments">{{ old('contactMessage') }}</textarea>
			  </div>
			
		</div>
		<div class="col-md-12 outer-bottom-small m-t-20">
			<button type="submit" class="btn-upper btn btn-primary checkout-page-button">Send Message</button>
		</div>
		</form>
	</div>
		
	</div><!-- /.contact-page -->
	</div><!-- /.row -->
</div><!-- /.container -->
</div>



@endsection

