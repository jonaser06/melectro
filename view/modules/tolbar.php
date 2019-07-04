<div class="tolbar">
    <?php
        echo '<a href="'.$url.'/admin" style="text-decoration:none;"><i class="fa fa-th main-menu" aria-hidden="true"></i></a>';
    ?>
    <ul class="option-bar">
        <li class="<?php echo ($base=='web')?'active':''; ?>"><a href="#"><i class="fa fa-globe" aria-hidden="true"></i></a></li>
        <li class="<?php echo ($base=='truck')?'active':''; ?>"><a href="<?php echo $url;?>/truck"><i class="fa fa-truck" aria-hidden="true"></i></a></li>
        <li class="<?php echo ($base=='notification')?'active':''; ?>"><a href="chart"><i class="fa fa-bar-chart" aria-hidden="true"></i>   </a></li>
        <li class="<?php echo ($base=='productos' || $base=='add' || $base=='productos?pagina=1')?'active':''; ?>"><a href="<?php echo $url;?>/productos"><i class="fa fa-shopping-cart" aria-hidden="true"></i> </a></li>
        <li class="<?php echo ($base=='users')?'active':''; ?>"><a href="<?php echo $url;?>/users"><i class="fa fa-users" aria-hidden="true"></i> </a></li>
        <li class="<?php echo ($base=='support')?'active':''; ?>"><a href="<?php echo $url;?>/support"><i class="fa fa-question-circle" aria-hidden="true"></i>   </a></li>
        <li class="<?php echo ($base=='config')?'active':''; ?>"><a href="#"><i class="fa fa-cog" aria-hidden="true"></i>   </a></li>
        <li class="<?php echo ($base=='logout')?'active':''; ?>"><a href="<?php echo $url;?>/logout"><i class="fa fa-sign-out" aria-hidden="true"></i>  </a></li>
    </ul>
</div>