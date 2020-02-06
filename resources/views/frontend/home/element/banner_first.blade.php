<!-- banner first -->

<div id="tptnsubbanner" class="tptnbanner"> 
    <ul class="row">
<?php 
    $i = 0;
    $countBanner = count($banners);
    $remainBanner = 5-$countBanner;
    foreach ($banners as $banner) {
        $i++;
        if($i == 5){
            break;
        } 
?>
        <li class="col-xs-6 col-md-3">
            <a href="3-electronics.html"><img class="banImg" src="{{ asset('/').$banner->bannerImage }}" alt="Advertizement"></a>
        </li>
    <?php } ?>

    <?php 
            for ($j = 1; $j <=$remainBanner ; $j++) { 
               
    ?>
        <li class="col-xs-6 col-md-3">
            <a href="3-electronics.html"><img src="{{ asset('/')}}public/frontend/no_banner.jpg" alt="Advertizement"></a>
        </li>
    <?php } ?>
            
    </ul>
</div>

<!-- end banner first -->