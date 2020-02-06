 <?php
  use App\Brand;
?>
<section id="tptnbrands" class="tptncarousel tptnprods">
	<div class="crsl-title">
		<h4>Shop By Brands</h4>
		<div class="crsl-link"><a href="brands.html" title="Shop By Brands">Show all<i class="material-icons">&#xE315;</i></a></div>
	</div>

	<div class="brandcrsl">
	<?php 
    	foreach ($brands as $brand) {
	?>
		<div class="brand-item ">
			<a href="" title="{{ asset('/').$brand->brandName}}"><img class="brandLogo" src="{{ asset('/').$brand->brandLogo }}" alt="AbcBrand"></a>
		</div>
	<?php } ?>	
	</div>	
</section>