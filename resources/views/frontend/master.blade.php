<!DOCTYPE html>
	<html lang="en">
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
	<head>
		<?php
		header("Cache-Control: no-cache, must-revalidate");
		header("Content-Type: application/xml; charset=utf-8");
		?>
		<META NAME="KEYWORDS" CONTENT="<?php echo @$metaTag['meta_keyword']; ?>">
		<META NAME="TITLE" CONTENT="<?php echo @$metaTag['meta_title']; ?>">
		<META NAME="DESCRIPTION" CONTENT="<?php echo @$metaTag['meta_description']; ?>">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="csrf-token" content="{{ csrf_token() }}">
		<link rel="shortcut icon" type="image/png" href="{{ asset('/').@$information->sitefavIcon }}">
		<title>{{$information->siteName}} @if(@$title) {{@$information->titlePrefix}} @endif {{ @$title }}</title>
		@include('frontend.include.header.header-asset')
	</head>
	<body id="index" class="lang-en country-us currency-usd layout-full-width page-index tax-display-disabled">
		
 	    {{-- <div id="tptn-config" class="hidden-lg-down">
			<div class="tptn-config-switch config-close"></div>
			<div class="tptn-config-inner">
				<div class="tptn-config-elements">
					<div class="tptn-config-block">
						<div class="tptn-config-title">Content Background</div>
						<div id="bodybkg-input" class="tptn-config-colorpicker" style="background-color:#F0F2F5"></div>
					</div>
					<div class="tptn-config-block">
						<div class="tptn-config-title">Top Horizontal Menu</div>
						<div id="topbkg-input" class="tptn-config-colorpicker" style="background-color:#3E66BD"></div>
					</div>
					<div class="tptn-config-block">
						<div class="tptn-config-title">Categories Title Background</div>
						<div id="titlebkg-input" class="tptn-config-colorpicker" style="background-color:#2AC97A"></div>
					</div>
					<div class="tptn-config-block">
						<div class="tptn-config-title">Cart Background</div>
						<div id="cartbkg-input" class="tptn-config-colorpicker" style="background-color:#F5535E"></div>
					</div>
					<div class="tptn-config-block">
						<div class="tptn-config-title">Product Name Color</div>
						<div id="pnameclr-input" class="tptn-config-colorpicker" style="background-color:#105BD5"></div>
					</div>
					<div class="tptn-config-block">
						<div class="tptn-config-title">Price Color</div>
						<div id="priceclr-input" class="tptn-config-colorpicker" style="background-color:#F13340"></div>
					</div>
					<div class="tptn-config-block">
						<div class="tptn-config-title">NEW label Background</div>
						<div id="newbkg-input" class="tptn-config-colorpicker" style="background-color:#2AC97A"></div>
					</div>
					<div class="tptn-config-block">
						<div class="tptn-config-title">SALE label Background</div>
						<div id="salebkg-input" class="tptn-config-colorpicker" style="background-color:#F5535E"></div>
					</div>
					<div class="tptn-config-block">
						<div class="tptn-config-title">Button Background</div>
						<div id="btnbkg-input" class="tptn-config-colorpicker" style="background-color:#3E66BD"></div>
					</div>
				</div>
				<div class="tptn-config-button">
					<div class="reset"><i class="material-icons">&#xE042;</i>Reset</div>
					<p>Hide this block from Back-office after setting colors.</p>
				</div>
			</div>
		</div> --}}

	    <main>
	    	<header id="header">
				{{-- @include('frontend.include.header.header-top') --}}
				@include('frontend.include.header.header-middle')
				@include('frontend.include.header.menu')
			</header>
			<section id="wrapper">
                <div class="container">
                	@yield('breadCombe')
                	<div id="content-wrapper">
                        <section id="main">
                			@yield('mainContent')
			            </section>
		            </div>
		        </div>
            </section>
	    		
			<footer id="footer">
				@include('frontend.include.footer.footer-top')
				@include('frontend.include.footer.footer-middle')
				@include('frontend.include.footer.footer-bottom')
			</footer>
			<div id="back-top"><i class="material-icons">arrow_upward</i></div>
	      <div class="tptn-overlay"></div>
		</main>
		@include('frontend.include.others.shopping_cart_javascript')
		@include('frontend.include.footer.footer-asset')
	</body>
</html>