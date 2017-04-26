<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>在库票据</title>
		<link rel="stylesheet" href="res/css/bootstrap.min.css">
		<link rel="stylesheet" href="res/css/iconfont.css" />
		<link rel="stylesheet" href="res/css/common.css" />
		<link rel="stylesheet" href="res/css/base.css" />
		<link rel="stylesheet" href="res/css/main.css" />
    </head>
    <body>
    	<div class="warpper mini" id="template-controller" style="padding-top: 0px !important;">

			<!--sidebar-->
			<!--<div class="ease sidebar-background"> <img src="res/images/load.png" class="mt-loading-icon mt-rotate-load" id="sidebar-load" /> </div>
          <div class="ease sidebar" id="slider-menu"></div>-->

			<!--main-content-->
			<div class="ease main-content" style="margin-left: 0px !important;">
				<div class="mar15">
					<div class="breadcrumbs">
						<ul>
							<li class="breadcrumb-button">
								<a href="javascript:;" onclick="location.reload()" class="home"><i class="iconfont font14">&#xe600;</i> 首页</a>
							</li>
							<li>
								<a href="#"><i class="iconfont">&#xe60d;</i> 票据系统</a>
							</li>
							<li><i class="iconfont">&#xe604;</i></li>
							<li>
								<a href="#">在库票据</a>
							</li>
							<div class="clear"></div>
						</ul>
					</div>
				</div>
				<div class="mar15">
					<div class="page-header-search mar-bottom-0 relative slider-container">
						<form class="form-horizontal mar-top-15" id="queryForm">
							<div class="row ui-tables-pro2">
								<div class="sol-sm-7 sol-xs-4">
									<div class="form-group form-horizontal mar-top-15">
										<label class="sol-xs-3 control-label pad-right-0 align-right">票号：</label>
										<div class="sol-xs-7">
											<input type="text" class="sol-xs-11" name="draftDode" value="">
											<i class="iconfont close mar-right-5"></i>
										</div>
									</div>
								</div>
								<div class="sol-sm-7 sol-xs-4">
									<div class="form-group form-horizontal mar-top-15">
										<label class="sol-xs-3 control-label pad-right-0  align-right">承兑行：</label>
										<div class="sol-xs-7">
											<input type="text" class="sol-xs-11 " name="money" id="money" value=""> <i class="iconfont close mar-right-5"></i>
										</div>
									</div>
								</div>
								<div class="sol-sm-7 sol-xs-4">
									<div class="form-group form-horizontal mar-top-15 mar-left-20">
										<a href="javascript:void(0);" class="button btn-blue" id="submit">查询</a> <a href="javascript:void(0);" class="button btn-grey mar-left-5 bill-rest-btn" style="*float: left;" id="reset">重置</a> <a href="javascript:;" class="font12 mar-left-5 slider-btn" style="*float: left; *margin-top: 7px; *overflow: hidden;">
											<em style="*padding-bottom: 10px; *float: left; color: #333;">高级</em>
											<i class="iconfont font12" style="*float: left;"></i>
										</a>
									</div>
									<div class="clear"></div>
								</div>
							</div>
							<div class="row ui-tables-pro2 none slider-more">
								<div class="sol-sm-7 sol-xs-4">
									<div class="form-group form-horizontal mar-top-15">
										<label class="sol-xs-3 control-label pad-right-0 align-right">承兑日期：</label>
										<div class="sol-xs-9 form_date">
											<div class="sol-xs-10">
												<input type="text" class="sol-xs-11 calendar J-checkInDate" readonly="readonly" name="startTicketDate">
											</div>
										</div>
									</div>
								</div>
								<div class="sol-sm-7 sol-xs-4">
									<div class="form-group form-horizontal mar-top-15">
										<label class="sol-xs-3 control-label pad-right-0  align-right">承兑行：</label>
										<div class="sol-xs-7">
											<input type="text" class="sol-xs-11 " name="bank" id="bank" value=""> <i class="iconfont close mar-right-5"></i>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="line mar-bottom-20 mar-left-1"></div>
				<div class="page-content">
					<div class="mar15">
						<!--表格-->
						<div class="widget-box">
							<div class="ui-scroll-content">
								<div class="ui-scroll-table-list" id='da-box'>
									<div class="table-responsive" id="content">
						 <table class="table table-bordered align-center font12 mar-bottom-0 dataTable" style="overflow: hidden;">
                          <thead>
							<tr>
			                  <th class="align-center ui-table-check"><i class="iconfont"></i></th>
			                  <th colspan="12" class="table-title">在库票据</th>
			                </tr>
							<tr style="height: 30px;">
								<th width="4%" class="align-center ">序号</th>
								<th width="18%" class="align-center" height="33.5px">票号</th>
								<th width="5%" class="align-center ">承兑日</th>
								<th width="5%" class="align-center ">票据类型</th>
								<th width="8%" class="align-center ">出票日</th>
								<th width="8%" class="align-center ">到期日</th>
								<th width="7%" class="align-center ">签收日期</th>
								<th width="9%" class="align-center ">票据状态</th>
								<th width="6%" class="align-center">操作</th>
							</tr>
						</thead>
						</tabel>
						 <table class="table table-bordered align-center font12 mar-bottom-0 dataTable">
	                         <tbody class="range-remove" id="body-data">
									<!--<tr class="select-remove this-hd">
										<td width="4%">1</td>
										<td width="18%"><a href="javascript:void(0)" style="color: blue;">201704131744030906660000000444</a></td>
										<td width="5%">2017-04-14</td>
										<td width="5%">电票</td>
										<td width="8%">2016-08-12</td>
										<td width="8%">2017-04-14</td>
										<td width="7%">2016-08-12</td>
										<td width="9%">已成功</td>
										<td width="6%">下载票据</td> 
									</tr>
									<tr class="select-remove this-hd">
										<td>1</td>
										<td><a href="javascript:void(0)" style="color: blue;">201704131744030906660000000444</a></td>
										<td>2017-04-14</td>
										<td>电票</td>
										<td>2016-08-12</td>
										<td>2017-04-14</td>
										<td>2016-08-12</td>
										<td>已成功</td>
										<td>下载票据</td> 
									</tr>-->
								</tbody>
							</table>
							</div>
								</div>
								<div></div>
								<table class="dy-kd">
									<tbody>
										<tr class="ui-toolbar check-remove">
											<!-- href="tables-03.html"-->
											<td colspan="14" style="padding-top:10px ;">
												<div class="pagination right set-allwidth">
													<div class="setol"> <span class="pagination-text">每页显示：</span>
														<div class="selector align-left select-page"> <span id="select_page" class="selector-txt selected">10</span> <i class="iconfont"></i>
															<select id="page" class="form-control" style="opacity: 0;">
																<option value="5">5</option>
																<option selected="selected" value="10">10</option>
																<option value="15">15</option>
																<option value="25">25</option>
																<option value="50">50</option>
															</select>
														</div>
													</div>
													<div class="ui-public-container this-lt">
														<div class="ui-public-page  addtext pagination">
															<a class="frist-page last" style="float:right;">最后</a>
															<ul class="bsteel-ajax-page choose-li" style="float:right;">
															</ul>
															<a class="frist-page frist home-page" style="float:right;">首页</a>
														</div>
													</div>
												</div>
												<div class="clear"></div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<!--分页初始值-->
		</div>

		<!-- public JS list start -->
		<script type="text/javascript" src="res/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="res/js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="res/js/jquery.mousewheel.min.js"></script>
		<script type="text/javascript" src="res/js/fx.common.js"></script>
		<script type="text/javascript" src="res/js/fx.ajaxPage.js"></script>
		<script type="text/javascript" src="res/js/bsteel.dialog.js"></script>
		
		<!--<script type="text/javascript" src="res/js/common/ui/bsteel.confirm.js"></script>
		<script type="text/javascript" src="res/js/common/ui/bsteel.drag.js"></script>-->
		<script type="text/javascript">
			var PATH = ''; //目录地址
		</script>
		<!-- public JS list stop -->

		<!-- page JS start -->
 	</body>
 	<script type="text/javascript">
 		var panel={
			init:function(){
				$('#page').change(function(){
					$('#select_page').text($(this).val())
					panel.getData(null,0,$(this).val())
				})
				
				$('#submit').unbind('click').bind('click',function(){
				    panel.getData($(this).parents('form').serialize(),0,$('#page').val());	
				});//查询按钮，参数是表单
				$('.bill-rest-btn').unbind('click').bind('click',function(){
					$(this).parents('form').find('input').val('');
				});//重置
				$(document).on('click','.bill-seachMore',panel.seachMore);//查看详情
				panel.getData(null,0,10);
			},
			seachMore:function(){
				$.AsyncDialogBox({
					url:'bill-new-tc.jsp',//ajax地址
					param:null,//参数
					title:null,
					width:1000,
					height:200,
					isCloseButton:true,
					callback:function(){
						$('.ui-master-container').css('height',$('#template-controller').height()+100);
					},
				    closeCallBack:function(){}
				});
			},
			getData:function(parem,n,dataLength){
				$.ajax({
				  url:'',//请求数据地址
				  type:"post",
				  data:parem,//请求参数
				  dataType:"json",
				  success:function(data){
				  	
				  },
				  beforeSend:function(){
						if($('#body-data tr').length){
					  	};
						$('body').append("<div class='add-style'><img src='res/images/loading-1.gif'/></div>");
					},
				  error:function(){
				  	//模拟数据如下：
				  	var str, 
				  	    data={
							param:{
								total:40,
								rows:[
									{id:1,number:'201704131744030906660000000444',acceptancetime:'2017-04-14',acceptancetype:'电票',starttime:'2017-04-04',overtime:'2017-05-05',signtime:'2017-05-05',billstatus:'成功'},
									{id:2,number:'201704131744030906660000000444',acceptancetime:'2017-04-15',acceptancetype:'电票',starttime:'2017-04-04',overtime:'2017-05-05',signtime:'2017-05-05',billstatus:'成功'},
									{id:3,number:'201704131744030906660000000444',acceptancetime:'2017-04-16',acceptancetype:'电票',starttime:'2017-04-04',overtime:'2017-05-05',signtime:'2017-05-05',billstatus:'成功'},
									{id:4,number:'201704131744030906660000000444',acceptancetime:'2017-04-17',acceptancetype:'电票',starttime:'2017-04-04',overtime:'2017-05-05',signtime:'2017-05-05',billstatus:'成功'},
									{id:5,number:'201704131744030906660000000444',acceptancetime:'2017-04-18',acceptancetype:'电票',starttime:'2017-04-04',overtime:'2017-05-05',signtime:'2017-05-05',billstatus:'成功'},
									{id:6,number:'201704131744030906660000000444',acceptancetime:'2017-04-19',acceptancetype:'银票',starttime:'2017-04-04',overtime:'2017-05-05',signtime:'2017-05-05',billstatus:'成功'},
									{id:7,number:'201704131744030906660000000444',acceptancetime:'2017-04-20',acceptancetype:'银票',starttime:'2017-04-04',overtime:'2017-05-05',signtime:'2017-05-05',billstatus:'成功'},
									{id:8,number:'201704131744030906660000000444',acceptancetime:'2017-04-21',acceptancetype:'银票',starttime:'2017-04-04',overtime:'2017-05-05',signtime:'2017-05-05',billstatus:'成功'},
									{id:9,number:'201704131744030906660000000444',acceptancetime:'2017-04-22',acceptancetype:'银票',starttime:'2017-04-04',overtime:'2017-05-05',signtime:'2017-05-05',billstatus:'成功'},
									{id:10,number:'201704131744030906660000000444',acceptancetime:'2017-04-23',acceptancetype:'银票',starttime:'2017-04-04',overtime:'2017-05-05',signtime:'2017-05-05',billstatus:'成功'}
								]
							}
				  	   };
				  	   var list = data.param.rows;
					   for(var i=0;i<list.length;i++){
					  	   str+='<tr class="select-remove this-hd"><td width="4%">'+list[i].id+'</td><td width="18%"><a class="bill-seachMore" href="javascript:void(0)" style="color: blue;">'+list[i].number+'</a></td>';
					  	   str+='<td width="5%">'+list[i].acceptancetime+'</td><td <td width="5%">'+list[i].acceptancetype+'</td><td <td width="8%">'+list[i].starttime+'</td>';
					  	   str+='<td <td width="8%">'+list[i].overtime+'</td><td <td width="7%">'+list[i].signtime+'</td><td <td width="9%">'+list[i].billstatus+'</td><td <td width="6%"><a href="javascript:;" style="color:blue;">下载模板</a></td>'
					   };
					   setTimeout(function(){
					   	 $('#body-data').html(str);
					   	 $('.add-style').remove();
					   },300)
					   panel.getPage(data.param.total,n);
					   $('.frist-page').unbind('click').bind('click',panel.updataPage);//分页中的首页和尾页
				    }
				})
			},
			updataPage:function(){
				$(this).addClass('home-page').siblings('.frist-page').removeClass('home-page');
				if($(this).hasClass('last')){
					$('.bsteel-ajax-page li').eq($('.bsteel-ajax-page li').length-2).trigger('click');
				}else{
					$('.bsteel-ajax-page li').eq(1).trigger('click');
				}
			},
			getPage:function(data,page){
				M('.bsteel-ajax-page').pagination(data,{
					items_per_page:10,//M('#select_page').text()//此处应为动态获取
					num_display_entries:4,
					current_page:page,
					num_edge_entries:2,
					callback:function(n){
						panel.getData(null,n,$('#page').val());
                        if((n+1)==($('.bsteel-ajax-page li').length-2)){
                        	$('.last').addClass('home-page').siblings('.frist').removeClass('home-page');
                        	$('.last').unbind('click');$('.frist').bind('click');
                        }else if((n+1)==1){
                        	$('.frist').addClass('home-page').siblings('.last').removeClass('home-page');
                        	$('.frist').unbind('click');$('.last').bind('click');
                        }else {
                        	$('.frist').removeClass('home-page').bind('click');
                        	$('.last').removeClass('home-page').bind('click');
                        }
					}
				});	
			}
		};
		(function(){
			panel.init();
		})()
 	</script>
</html>
