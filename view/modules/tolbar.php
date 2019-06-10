<div class="tolbar">
    <ul class="option-bar">
        <li class="<?php echo ($base=='web')?'active':''; ?>"><a href="#"><i class="fa fa-globe" aria-hidden="true"></i></a></li>
        <li class="<?php echo ($base=='app')?'active':''; ?>"><a href="<?php echo $url;?>/app"><i class="fa fa-rocket" aria-hidden="true"></i></a></li>
        <li class="<?php echo ($base=='notification')?'active':''; ?>"><a href="notification"><i class="fa fa-paper-plane" aria-hidden="true"></i>   </a></li>
        <li class="<?php echo ($base=='productos' || $base=='add')?'active':''; ?>"><a href="<?php echo $url;?>/productos"><i class="fa fa-shopping-cart" aria-hidden="true"></i> </a></li>
        <li class="<?php echo ($base=='users')?'active':''; ?>"><a href="<?php echo $url;?>/users"><i class="fa fa-users" aria-hidden="true"></i> </a></li>
        <li class="<?php echo ($base=='support')?'active':''; ?>"><a href="<?php echo $url;?>/support"><i class="fa fa-question-circle" aria-hidden="true"></i>   </a></li>
        <li class="<?php echo ($base=='config')?'active':''; ?>"><a href="#"><i class="fa fa-cog" aria-hidden="true"></i>   </a></li>
        <li class="<?php echo ($base=='logout')?'active':''; ?>"><a href="<?php echo $url;?>/logout"><i class="fa fa-sign-out" aria-hidden="true"></i>  </a></li>
    </ul>
</div>