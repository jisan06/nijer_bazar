<?php 
    use App\banners; 
?>
<div id="tptnsubbanner" class="tptnbanner"> 
    <ul class="row">
        <?php 
        $i = 0;
        foreach ($banners as $banner) {
            $i++;
            if($i > 5 && $i < 10){       
                ?>
                <li class="col-xs-6 col-md-3">
                    <a href="3-electronics.html"><img class="banImg" src="{{ asset('/').$banner->bannerImage }}" alt="Advertizement"></a>
                </li>
        <?php } } ?> 
    </ul>
</div>