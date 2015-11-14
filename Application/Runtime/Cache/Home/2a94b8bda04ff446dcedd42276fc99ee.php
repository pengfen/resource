<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><?php echo ($title); ?></title>
	<link rel="stylesheet" type="text/css" href="/resource/Public/Home/Css/index.css"/>
	<script type="text/javascript" src="/resource/Public/Bootstrap/js/jquery-2.1.4.min.js"></script>
	
	
</head>
<body>
	<header>
	    <!-- <div class="fl logo">
	    </div> -->
	    <div class="w">
	    	<ul class="fl nav-left">
			    <li><a href="<?php echo U('Index/index');?>">首页</a></li>
			    <?php echo W('Nav/menu');?>
			</ul>
			<ul class="fr nav-right">
			    <li><a href="<?php echo U('User/index');?>">个人中心</a></li>
			    <?php $user = $_SESSION['user']; if ($user) { echo "<li><a href='javascript:void(0);'>".$user['username']." 欢迎</a></li>"; ?>
			    <li><a href="<?php echo U('Login/logout');?>">退出</a></li>;
			    <?php
 } else { ?>
			    <li><a href="<?php echo U('Login/login');?>">登录</a></li>
			    <li><a href="<?php echo U('Login/reg');?>">注册</a></li>
			    <?php	 } ?>
			</ul>
	    </div>
		
	</header>
	<div class="clear"></div>
	
	<script type="text/javascript">
		// 处理单击
		function click(click){
			click.click(function(){
				var $url = $(this).next('input')[0].value;
				ajax($url);
			});
		}
		function ajax($url){
			// 异步请求
			$.ajax({
				url: $url,
				success: function(data){
					$('#right').text(''); // 清空以前的数据
					$('#right').append(data); // 将对应的模板放进主页显示
				}
			});
		}
	</script>
	
    <div class="w">
        <img src="/resource/Public/<?php echo ($info[image]); ?>"/>
    </div>

</body>
</html>