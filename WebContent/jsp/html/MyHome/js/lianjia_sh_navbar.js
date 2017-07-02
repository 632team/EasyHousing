(function(headerParameters){
    var lianjia_sh_navBar = {
        getNavItemId : function(){//获取当前高亮项的id
            var id = $.trim($('#lianjia-header').attr('systemid'));
            return id;
        },
        getNavScheme : function(){//获取当前高亮项的id
            var scheme = $.trim($('#lianjia-header').attr('scheme'));
            return scheme;
        },
        buildNavList : function(){ //根据环境配置不同的导航路径url
            var me = this;
            var webhost = headerParameters.webhost;
            var navArr = [
                {
                    id:'ershoufang',
                    text:'二手房',
                    url: webhost + '/ershoufang',
					gahref:'header_ershoufang',
                    subItem : [
                        {
                            id : 'quanbu',
                            text: '全部',
                            url : webhost + '/ershoufang',
							gahref:'header_ershoufang_all'
                        },
                        {
                            id : 'ditiefang',
                            text : '地铁房',
                            url : webhost + '/ditiefang',
							gahref:'header_ershoufang_ditie'
                        },
                        {
                            id : 'ditu',
                            text : '地图找房',
                            url : webhost + '/ditu',
                            gahref:'header_ershoufang_ditu'
                        },
                        {   id : 'chengjiao',
                            text : '成交房源',
                            url : webhost + '/chengjiao',
							gahref:'header_ershoufang_chengjiao'
                        }
                    ]
                },
				{
					id:'xinfang',
					text:'新房',
					url: headerParameters.xinfanghost,
					gahref:'header_xinfang'
				},
                // {
                //     id:'xuequ',
                //     text:'学区',
                //     url: webhost + '/xuequ',
                //     gahref:'header_xuequ'
                // },
                {
                    id:'zufang',
                    text:'租房',
                    url: webhost + '/zufang',
					gahref:'header_zufang'
                },
                {
                    id:'xiaoqu',
                    text:'小区',
                    url: webhost + '/xiaoqu',
					gahref:'header_xiaoqu'
                },
                {
                    id:'jingjiren',
                    text:'经纪人',
                    url: webhost + '/jingjiren',
                    gahref:'header_jingjiren'
                },
                {
                    id:'toutiao',
                    text:'头条',
                    url: webhost + '/toutiao/list',
                    gahref:'header_toutiao'
                },
                {
                    id:'baike',
                    text:'百科',
                    url: webhost + '/baike',
                    gahref:'header_baike'
                },
                // {
                //     id:'fangjia',
                //     text:'房价',
                //     url: webhost + '/fangjia',
                //     gahref:'header_fangjia'
                // },
     //            {
     //                id:'haiwai',
     //                text:'海外',
     //                url: 'http://us.lianjia.com/',
					// gahref:'header_oversea',
     //                newPage : true
     //            },
     //            {
     //                id:'licai',
     //                text:'理财',
     //                url: 'https://licai.lianjia.com/',
					// gahref:'header_licai',
     //                newPage : true
     //            },
                {
                    id:'app',
                    text:'APP下载',
                    url: webhost + '/client?source=pcdh',
					gahref:'header_app',
                    newPage : true,
                    subItem : [
                        {
                            imgUrl : 'dhewm'
                        }
                    ]
                },
                {
                    id:'maifang',
                    text:'卖房',
                    url: webhost + '/yezhu/',
					gahref:'header_yezhu',
                    newPage : true,
                    needIcon:true
                }
            ];

            //上海导航数据处理
            /* if(headerParameters.cityCode == "sh"){
                $.each(navArr, function(i, node){
                    //去掉新房
                    if(node.id == 'xinfang'){
                        node.hide = true;
                    }
                });
            } */
            //苏州导航数据处理
            if(headerParameters.cityCode == "su"){
                $.each(navArr, function(i, node){
                    //去掉学区、租房频道
                    if(node.id == 'xuequ' || node.id == 'zufang'){
                        node.hide = true;
                    }

                    //20170413 苏州的百科头条也开放
                    //if(node.id == 'baike' || node.id == 'toutiao'){
                        //node.hide = true;
                    //}

                    //调整APP下载
                    // if(node.id == 'app'){
                    //     node.url = 'javascript:;'; //阻止链接点击事件
                    //     node.subItem[0].imgUrl = headerParameters.webhost + "/static/img/suzhou_app_adv.gif"
                    // }
                });
            }

            //生成对应环境下的导航列表
            var navList = [];
            for(var i = 0; i < navArr.length;i++){
                if(navArr[i].hide){ continue; }

                var item  = navArr[i];
                var url = item['url'];

                if(this.getNavScheme() == "home"){//用于首页
                    var className = [];
                    if(item.subItem && item.subItem.length != 0){
                        className.push('hover');
                    }

                    if(item.needIcon){
                        className.push('real');
                    }

                    var html = '<li class="' + className.join(" ") + '">';
                    html += item.needIcon ? '<i></i>' : '';
                    html +='<a href="'+url+'" ' + (item.newPage ? 'target="_blank"' : '') + ' gahref="'+item.gahref+'">'+item.text+'</a>';
                }
                else{//用于内页
                    var html = '<li class="' + (item.subItem && item.subItem.length != 0 ? "hover" : "") + '">';
                    html +='<a'+(me.getNavItemId() == item.id ? ' class="on"' : '')+' href="'+url+'" ' + (item.newPage ? 'target="_blank"' : '') + ' gahref="'+item.gahref+'">'+item.text+'</a>';
                }
               if(item.subItem && item.subItem.length != 0){//频道对应的Tips
                    html += '<div class="nav-list"><dd><i></i>';
                    for(var j=0; j<item.subItem.length; j++){
                        if(item.subItem[j].hide){ continue; }

                        if(item.subItem[j].imgUrl){
                            if(item.subItem[j].imgUrl == 'dhewm'){//二维码
                                html += '<div class="ewmWrap"><div class="js_downAppEwmDynamic_img" source="'+item.subItem[j].imgUrl+'" ewmimgw="100" ewmimgh="100"></div>';
                            }
                            else{//图片
                                html += '<div class="ewmWrap"><img src="'+item.subItem[j].imgUrl+'" width="100" heigth="100" /></div>';
                            }
                            
                        }
                        else{//选项
                            if(item.subItem[j].hide){ continue; }
                            html += '<dl><a href="'+item.subItem[j].url+'" gahref="'+item.subItem[j].gahref+'">' +item.subItem[j].text+ '</a></dl>'
                        }
                    }
                    html += '</div>';
                }
                html += '</dd></li>';
                                
                navList.push(html);
            }

            return navList.join('');
        },
        buildNavDownAppQrcode : function(self){
            if(self.css('position') != 'absolute'){//本身没有定位
                self.css('position','relative');
            }

            var str = self.attr('source'),
                ewmImgW = Number(self.attr('ewmimgw')) ? Number(self.attr('ewmimgw')) : 119,
                ewmImgH = Number(self.attr('ewmimgh')) ? Number(self.attr('ewmimgh')) : 119;

            var hostObj = {
                productionUrl: 'http://sh.lianjia.com/client/',
                testUrl:       'http://sh.lianjia.net/client/',
                developmentUrl:'http://sh.lianjia.net/client/',
                integrationUrl:'http://sh.lianjia.org/client/',
            };

            var env = window.headerParameters && window.headerParameters.env ? window.headerParameters.env : '';
            var url = hostObj[env+'Url'] + "?source=" + str; //s=wem 来源：二维码
            var qrcodeOptions = {
                render: "canvas",
                width: ewmImgW,
                height:ewmImgH,
                text: toUtf8(url)
            };
            if(!checkBrowserIsLegal()){
                qrcodeOptions.render = "table";
            }
            self.qrcode(qrcodeOptions);

            //动态插入的logo图
            var logoImgW = parseInt(ewmImgW / 3),logoImgH = parseInt(ewmImgH / 3);
            if(self.find('.js_qrCodeIcon').length <= 0){
                self.append('<img class="js_qrCodeIcon" src="' + headerParameters.publichost + '/public/img/qrCodeIcon_lj.png"  />');
                var bW = ewmImgW <= 70 ? 1 : ( ewmImgW <= 100 ? 2 : 3);
                self.find('.js_qrCodeIcon').css({
                    borderWidth:bW+'px',
                    borderRadius: parseInt(logoImgW / 5 ) + 'px',
                    borderStyle: 'solid',
                    borderColor: '#fff',
                    background: '#fff',
                    width:logoImgW + 'px',
                    height:logoImgH + 'px',
                    position:'absolute',
                    top:'50%',
                    left:'50%',
                    marginTop:'-' + (logoImgW/2 + bW) + 'px',
                    marginLeft:'-' + (logoImgH/2 + bW) + 'px'
                });
            }
        },
        buildHeader : function(){//构建头部 - 用于二手房内页、用户中心等
            var me = this;
            var navListHtml = me.buildNavList();//构建导航

            var regUrl = 'http://passport.lianjia.com/register/resources/lianjia/register.html?service=' + window.location.href;
            var loginUrl = 'https://passport.lianjia.com/cas/login?service=' + window.location.href;

            var html = '<div class="nav-wrap">';
                html +=     '<div class="wrapper">';
                html +=         '<div class="fl">';
                html +=             '<a class="logo" href="' + headerParameters.webhost + '/" title="链家房产网" gahref="header_logo"></a>'
                html +=         '</div>';
                html +=         '<div class="fr nav">';
                html +=             '<div class="fl">';
                html +=                 '<ul>';
                html +=                     '<li class="index-page-link hide"><a href="http://www.lianjia.com/">首页</a></li>';
                html +=                     navListHtml;
                html +=                 '</ul>';
                html +=             '</div>';
                html +=             '<div class="fr login">';
                html +=                '<div class="ti-hover">';
                html +=                     '<div class="login-panel typeUserInfo">';
                html +=                         '<div class="typeShowUser" id="userInfo">';
                html +=                         '<span class="welcome">';
                html +=                             '<a id="regUrl" href="'+regUrl+'" gahref="header_signup"><span class="log">注册</span></a>|<a id="loginUrl" href="'+loginUrl+'" class="btn-login bounceIn actLoginBtn" gahref="header_signin"><span class="reg">登录</span></a>';
                html +=                         '</span>';
                html +=                         '</div>';
                html +=                     '</div>';
                html +=                     '<div class="user-news" id="userNews">';
                html +=                     '</div>'; 
                html +=                 '</div>';
                html +=             '</div>';
                html +=         '</div>';
                html +=     '</div>';
                html += '</div>';

            $('#lianjia-header').html(html);
            this.buildNavDownAppQrcode($('.js_downAppEwmDynamic_img'));
        },
        buildHeader_home : function(){//构建头部 － 用于二手房首页
            var me = this;
            var navListHtml = me.buildNavList();//构建导航

            var regUrl = 'http://passport.lianjia.com/register/resources/lianjia/register.html?service=' + window.location.href;
            var loginUrl = 'https://passport.lianjia.com/cas/login?service=' + window.location.href;

            var html = '<div class="nav typeUserInfo">';
            html +=     '<div class="ti-hover">';
            html +=         '<div class="typeShowUser"  id="userInfo">';
            html +=             '<i></i> ';
            html +=             '<span class="welcome">';
            html +=                 '<a id="loginUrl" href="'+loginUrl+'" class="btn-login bounceIn" gahref="header_signin"><span class="reg">登录</span></a><a id="regUrl"  href="'+regUrl+'" gahref="header_signup"><span class="log">立即注册</span></a>';
            html +=             '</span>';
            html +=         '</div>';
            html +=         '<div class="user-news" id="userNews"></div>';
            html +=     '</div>';
            html +=     '<ul>';
            html +=         navListHtml;
            html +=     '</ul>';
            html += '</div>';
            $('#lianjia-header').html(html);
            this.buildNavDownAppQrcode($('.js_downAppEwmDynamic_img'));
        }
    }

    //构建头部
    if(lianjia_sh_navBar.getNavScheme() == "home") {//用于二手房首页
        lianjia_sh_navBar.buildHeader_home();
    }
    else{//用于二手房内页、用户中心
        lianjia_sh_navBar.buildHeader();
    }
})(headerParameters);
