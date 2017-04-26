;(function(){
	$.extend($,{
		AsyncDialogBox:function(options){//公共弹出框
			var defaults = {
				id:'ui-async-container-'+new Date().getTime(),
				isDrag:true,//是否拖拽
				url:null,//ajax地址
				param:null,//参数
				title:null,
				width:500,
				height:200,
				appendHTML:null,
				path:PATH,
				isCloseButton:true,//是否有关闭按钮
				imgbox:{
					alphaBackground:'res/images/piel_master_1.png',
					loadBackground:'res/images/load.gif',
					closeBackground:'res/images/ico_2.png'
				},
				callback:function(){},
				closeCallBack:function(){}
			};
			var options  = $.extend(true,defaults,options);
			var S={
				init:function(){
					if($('#'+options.id).length<=0){
						var str='';
						str+=options.title==null?'':'<div class="ui-master-head">'+options.title+'</div>';
						str+=options.isCloseButton?'<div class="ui-master-close" style="background-image:url('+options.path+options.imgbox.closeBackground+');"></div>':'';
						$('body').append('<div id="'+options.id+'" class="ui-master-container"><div class="ui-master-content">'+str+'<div class="ui-master-body" style="height:'+options.height+'px;"><div style="position:absolute;left:0px;top:0px;width:100%;height:100%;"><img style="position:absolute;left:50%;top:50%;margin:-5px 0px 0px -12px;" src="'+options.path+options.imgbox.loadBackground+'" width="27" height="10" /></div></div></div></div>');
						var $obj=$('#'+options.id),
							$content=$obj.children(),
							T=options.title==null?0:49,
							W=$(window).width(),
							H=$(window).height(),
							tH=$(window).scrollTop(),
							bH=$('body').height(),
							h=$content.height();
						$obj.css({
							'z-index':new Date().getTime(),
							'height':Math.max(H,bH),
							'background':'url('+options.path+options.imgbox.alphaBackground+') repeat'
						});
						$content.css({
							'top':tH+(H-h)*0.5,
							'position':'absolute',
							'width':options.width,
							'margin-top':0,
							'margin-left':-options.width*0.5,
							'overflow':'hidden'
						});
						if(options.isCloseButton){
							$('.ui-master-close',$obj).unbind('click').bind('click',S.removeDialogBox);	
							$(document).unbind('keypress',S.keyBoardClose).bind('keypress',S.keyBoardClose);		
						};
						if(options.title!=null&&options.isDrag){
							$obj.dragDialogBox({dragClassName:'ui-master-head',dragContent:$content});
						};
						function main(data){
							var $container=$('.ui-master-body',$obj);
							$container.removeAttr('style').append(data);
							var $main=$container.children(':last'),
								st=$content.offset().top,
								width=$main.outerWidth(true)+parseInt($container.css('padding-left'))+parseInt($container.css('padding-right')),
								height=$content.height(),
								ml=-width*0.5,
								mt=(height+10)>H?Math.max(H,bH)-st-height-10>=0?(options.height-H+T+50)*0.5:Math.max(H,bH)-st-height-30:(options.height+T-height)*0.5;
							$content.animate({'width':width,'margin-left':ml,'height':height,'margin-top':mt},800,'easeOutBack',function(){
								$container.children(':first').fadeOut(function(){
									$(this).remove();	
								});
								$main.hide().css('visibility','visible').fadeIn(options.fadeSpeed,function(){
									$content.css({height:'auto',overflow:'visible'});
									options.callback($content,S.removeDialogBox);	
								});
							});	
						};	
						if(options.url==null){
							main(options.appendHTML);	
						}else{
							function ajax(status){
								$.ajax({
									url:options.url,
									data:options.param,
									type:"post",
									dataType:"text",
									success:function(data){
										main(data);
									},
									error:function(){
										if(status){
											setTimeout(function(){
												$('.ui-master-body',$obj).html('<div style="position:absolute;display:none;left:0px;top:50%;margin-top:-20px;width:100%;height:40px;font-size:18px;color:#666;line-height:40px; text-align:center;">服务器连接失败,<a href="javascript:;" class="ui-dialog-reload">点击刷新</div>').children().fadeIn(400);		
												$('.ui-dialog-reload',$obj).unbind('click').bind('click',function(){
													$('.ui-master-body',$obj).html('<img style="position:absolute;left:50%;top:50%;margin:-5px 0px 0px -12px;" src="'+options.path+options.imgbox.loadBackground+'" width="27" height="10" />');
													ajax(true);
												});	
											},100);
										}else{
											$('.ui-master-body',$obj).animate({'height':options.height+100},800,function(){
												$(this).html('<div style="position:absolute;display:none;left:0px;top:50%;margin-top:-20px;width:100%;height:40px;font-size:18px;color:#666;line-height:40px; text-align:center;">服务器连接失败,<a href="javascript:;" class="ui-dialog-reload">点击刷新</div>').children().fadeIn(400);		
											});
											$content.animate({'width':options.width+100,'margin-left':-(options.width+100)*0.5,'height':h+100,'margin-top':-50},800,'easeOutBack',function(){
												$('.ui-dialog-reload',$obj).unbind('click').bind('click',function(){
													$('.ui-master-body',$obj).html('<img style="position:absolute;left:50%;top:50%;margin:-5px 0px 0px -12px;" src="'+options.path+options.imgbox.loadBackground+'" width="27" height="10" />');
													ajax(true);
												});
											});		
										};
									}	
								});		
							};
							ajax();
						};
					};
				},
				removeDialogBox:function(){
					$('#'+options.id).fadeOut(300,function(){
						$(this).remove();
						options.closeCallBack();
					});
				},
				keyBoardClose:function(e){
					if(e.keyCode == 27){
						S.removeDialogBox();
					};		
				}	
			};
			S.init();
		}
	});	
})(jQuery);