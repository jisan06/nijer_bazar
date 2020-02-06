
<section id="tptnhomeblog" class="tptncarousel tptnprods"> 
<?php
    foreach ($blogs as $blog) {
        
?>
    <div class="crsl-title">
        <h4>From The Blog</h4>
        <div class="crsl-link"><a href="" title="From The Blog">Show all<i class="material-icons">&#xE315;</i></a></div>
    </div>
    <div class="blogcrsl">
        <div class="blog-container">
            <div class="blog-img">
                <a href="{{url('/blog-details/'.$blog->id)}}">
                    <img src="{{asset('/').$blog->blogImage}}" alt="Summer Collection Launched" title="Summer Collection Launched" />
                </a>
            </div>
            <div class="news-date">Dec 24, 2018</div>
            <h5><a href="{{url('/blog-details/'.$blog->id)}}">{{$blog->title}}</a></h5>
            <p>{{str_limit($blog->description,300)}}</p>
        </div>
    </div>
<?php } ?>
</section>