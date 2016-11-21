/*!
 * TouchSlide v1.1
 * javascript触屏滑动特效插件，移动端滑动特效，触屏焦点图，触屏Tab切换，触屏多图切换等
 * 详尽信息请看官网：http://www.SuperSlide2.com/TouchSlide/
 *
 * Copyright 2013 大话主席
 *
 * 请尊重原创，保留头部版权
 * 在保留版权的前提下可应用于个人或商业用途

 * 1.1 宽度自适应（修复安卓横屏时滑动范围不变的bug）
 */

/*
 * TouchSlider v1.0.5
 * By qiqiboy, http://www.qiqiboy.com, http://weibo.com/qiqiboy, 2012/04/11
 */
(function(window, undefined){
	var ADSupportsTouches = ("createTouch" in document) || ('ontouchstart' in window) || 0,
		doc=document.documentElement || document.getElementsByTagName('html')[0],
		ADSupportsTransition = ("WebkitTransition" in doc.style) 
							|| ("MsTransition" in doc.style) 
							|| ("MozTransition" in doc.style) 
							|| ("OTransition" in doc.style) 
							|| ("transition" in doc.style) 
							|| 0,
		ADStartEvent = ADSupportsTouches ? "touchstart" : "mousedown",
		ADMoveEvent = ADSupportsTouches ? "touchmove" : "mousemove",
		ADEndEvent = ADSupportsTouches ? "touchend" : "mouseup",
		TouchSlider=function(opt){
			this.opt=this.parse_args(opt);
			this.container=this.$(this.opt.id);
			try{
				if(this.container.nodeName.toLowerCase()=='ul'){
					this.element=this.container;
					this.container=this.element.parentNode;
				}else{
					this.element=this.container.getElementsByTagName('ul')[0];
				}
				if(typeof this.element==='undefined')throw new Error('Can\'t find "ul"');
				for(var i=0;i<this.instance.length;i++){
					if(this.instance[i]==this.container) throw new Error('An instance is running');
				}
				this.instance.push(this.container);
				this.setup();
			}catch(e){
				this.status=-1;
				this.errorInfo=e.message;
			}
		}
		
	TouchSlider.prototype={
		//默认配置
		_default: {
			'id': 'slider', //幻灯容器的id
			'fx': 'ease-out', //css3动画效果（linear,ease,ease-out,ease-in,ease-in-out），不支持css3浏览器只有ease-out效果
			'auto': 0, //是否自动开始，负数表示非自动开始，0,1,2,3....表示自动开始以及从第几个开始
			'speed':600, //动画效果持续时间 ms
			'timeout':5000,//幻灯间隔时间 ms
			'className':'', //每个幻灯所在的li标签的classname,
			'direction':'left', //left right up down
			'mouseWheel':false,
			'before':new Function(),
			'after':new Function()
		},
		instance:[],
		//根据id获取节点
		$:function(id){
			return document.getElementById(id);
		},
		//根据class、标签获取parent下的节点簇 getElementsByClass
		$E:function(classname, tagname, parent){
			var result=[],
				_array=parent.getElementsByTagName(tagname);
			for(var i=0,j=_array.length;i<j;i++){
				if((new RegExp("(?:^|\\s+)"+classname+"(?:\\s+|$)")).test(_array[i].className)){
					result.push(_array[i]);
				}
			}
			return result;
		},
		isIE:function(){ //不包括IE9+，IE9开始支持W3C绝大部分事件 方法了
			return !-[1,];
		},
		//设置OR获取节点样式
		css:(function(){
			var styleFilter=function(property){
					switch(property){
						case 'float' : return ("cssFloat" in document.body.style) ? 'cssFloat' : 'styleFloat';
									  break;
						case 'opacity' : return ("opacity" in document.body.style) ? 'opacity' :
										{
											get : function(el,style){
												var ft=style.filter;
												return ft&&ft.indexOf('opacity')>=0&&parseFloat(ft.match(/opacity=([^)]*)/i)[1])/100+''||'1';
											},
											set : function(el,va){
												el.style.filter='alpha(opacity='+va*100+')';
												el.style.zoom=1;
											}
										} ;
									  break;
						default:var arr=property.split('-');
								for(var i = 1; i < arr.length; i++)
									arr[i] = arr[i].substring(0,1).toUpperCase() + arr[i].substring(1);
								property = arr.join('');
								return property;
								break;
					}
				},
				getStyle=function(el,property){
					property=styleFilter(property);
					var value = el.style[property];
					if (!value) {
						var style = document.defaultView && document.defaultView.getComputedStyle && getComputedStyle(el, null) || el.currentStyle || el.style;
						if(typeof property=='string'){
							value=style[property];
						}else value=property.get(el,style);
					}
					return value == 'auto' ? '' : value;
				},
				setStyle=function(el,css){
					var attr;
					for(var key in css){
						attr=styleFilter(key);
						if(typeof attr=='string'){
							el.style[attr]=css[key];
						}else{
							attr.set(el,css[key]);
						}
					}
				}
				return function(el,css){
					return typeof css=='string'?getStyle(el,css):setStyle(el,css);
				}
		})(),
		//格式化参数
		parse_args: function(r){
			var _default={}, toString=Object.prototype.toString;
			if(r && toString.call(r)=='[object Object]')
				for(var key in this._default){
					_default[key]=typeof r[key]==='undefined' ? this._default[key] : toString.call(this._default[key])=='[object Number]' ? parseInt(parseFloat(r[key])*100)/100 : r[key];
				}
			else _default=this._default;
			return _default;
		},
		//绑定事件
		addListener: function(e, n, o, u){
			if(e.addEventListener){
				e.addEventListener(n, o, u);
				return true;
			} else if(e.attachEvent){
				e.attachEvent('on' + n, o);
				return true;
			}
			return false;
		},
		//获取鼠标坐标
		getMousePoint:function(ev) {
			var x = y = 0,
			doc = document.documentElement,
			body = document.body;
			if(!ev) ev=window.event;
			if (window.pageYoffset) {
				x = window.pageXOffset;
				y = window.pageYOffset;
			}else{
				x = (doc && doc.scrollLeft || body && body.scrollLeft || 0) - (doc && doc.clientLeft || body && body.clientLeft || 0);
				y = (doc && doc.scrollTop  || body && body.scrollTop  || 0) - (doc && doc.clientTop  || body && body.clientTop  || 0);
			}
			if(ADSupportsTouches && ev.touches.length){
				var evt = ev.touches[0];
				x += evt.clientX;
				y += evt.clientY;
			}else{
				x += ev.clientX;
				y += ev.clientY;
			}
			return {'x' : x, 'y' : y};
		},
		//修正函数作用环境
		bind:function(func, obj){
			return function(){
				return func.apply(obj, arguments);
			}
		},
		preventDefault:function(e){
			if(window.event)window.event.returnValue=false;
			else e.preventDefault();
		},
		//初始化
		setup: function(){
			this.status=0;//状态码，0表示停止状态，1表示运行状态，2表示暂停状态，-1表示出错
			this.slides=this.opt.className?this.$E(this.opt.className,'li',this.element):this.element.getElementsByTagName('li');
			this.length=this.slides.length; this.opt.timeout=Math.max(this.opt.timeout,this.opt.speed);
			this.touching=!!ADSupportsTouches; this.css3transition=!!ADSupportsTransition; 
			this.index=this.opt.auto<0 || this.opt.auto>=this.length ? 0:this.opt.auto;
			if(this.length<2)return;//小于2不需要滚动
			switch(this.opt.direction){
				case 'up': this.direction='up'; this.vertical=true; break;
				case 'down': this.direction='down'; this.vertical=true; break;
				case 'right': this.direction='right'; this.vertical=false; break;
				default:this.direction='left'; this.vertical=false; break;
			}
			this.resize(); this.begin();

			this.addListener(this.element,ADStartEvent,this.bind(this._start,this),false);
			this.addListener(document,ADMoveEvent,this.bind(this._move,this),false);
			this.addListener(document,ADEndEvent,this.bind(this._end,this),false);
			this.addListener(this.element,'webkitTransitionEnd',this.bind(this._transitionend,this),false);
			this.addListener(this.element,'msTransitionEnd',this.bind(this._transitionend,this),false);
			this.addListener(this.element,'oTransitionEnd',this.bind(this._transitionend,this),false);
			this.addListener(this.element,'transitionend',this.bind(this._transitionend,this),false);
			this.addListener(window,'resize',this.bind(function(){
				clearTimeout(this.resizeTimer);
				this.resizeTimer=setTimeout(this.bind(this.resize,this),100);
			},this),false);
			this.addListener(this.element,'mousewheel',this.bind(this.mouseScroll,this),false);
			this.addListener(this.element,'DOMMouseScroll',this.bind(this.mouseScroll,this),false);
		},
		resize:function(){
			var css;
			this.css(this.container,{'overflow':'hidden','visibility':'hidden','listStyle':'none','position':'relative'});
			this.width=this.container.clientWidth-parseInt(this.css(this.container,'padding-left'))-parseInt(this.css(this.container,'padding-right'));
			this.height=this.container.clientHeight-parseInt(this.css(this.container,'padding-top'))-parseInt(this.css(this.container,'padding-bottom'));
			css={'position':'relative','webkitTransitionDuration':'0ms','MozTransitionDuration':'0ms','msTransitionDuration':'0ms','OTransitionDuration':'0ms','transitionDuration':'0ms'}
			if(this.vertical){
				css['height']=this.height*this.length+'px';
				css['top']=-this.height*this.index+'px';
				this.css(this.container,{'height':this.height+'px'});
			}else{
				css['width']=this.width*this.length+'px';
				css['left']=-this.width*this.index+'px';
			}
			this.css(this.element,css);
			for(var i=0;i<this.length;i++){
				this.css(this.slides[i],{'width':this.width+'px','display':this.vertical?'table-row':'table-cell',padding:0,margin:0,float:'left',verticalAlign:'top'});
			}
			//,height:this.height+'px'
			this.css(this.container,{'visibility':'visible'});
		},
		slide:function(index, speed){
			var direction=this.vertical?'top':'left', size=this.vertical?'height':'width';
			index=index<0?this.length-1:index>=this.length?0:index;
			speed=typeof speed == 'undefined' ? this.opt.speed : parseInt(speed);
			var el=this.element, timer=null,
				style=el.style,
				_this=this,
				t=0, //动画开始时间
				b=parseInt(style[direction]) || 0, //初始量
				c=-index*this[size]-b, //变化量
				d=Math.abs(c)<this[size]?Math.ceil(Math.abs(c)/this[size]*speed/10):speed/10,//动画持续时间
				ani=function(t,b,c,d){ //缓动效果计算公式
					return -c * ((t=t/d-1)*t*t*t - 1) + b;
				},
				run=function(){
					if(t<d && !ADSupportsTransition){
						t++;
						style[direction]=Math.ceil(ani(t,b,c,d))+'px';
						timer=setTimeout(run, 10);
					}else{
						style[direction]=-_this[size]*index+'px';
						_this.index=index;
						if(!ADSupportsTransition)_this._transitionend();
						_this.pause();_this.begin();
					}
				}
			style.WebkitTransition=style.MozTransition=style.msTransition=style.OTransition=style.transition = direction+' '+(d*10)+'ms '+this.opt.fx;
			this.opt.before.call(this, index, this.slides[this.index]); run();
		},
		begin:function(){
			if(this.timer || this.opt.auto<0)return true;
			this.timer=setTimeout(this.bind(function(){
				this.direction=='left'||this.direction=='up' ? this.next() : this.prev();
			},this), this.opt.timeout);
			this.status=1;
		},
		pause:function(){
			clearInterval(this.timer);
			this.timer=null;
			this.status=2;
		},
		stop:function(){
			this.pause();
			this.index=0;
			this.slide(0);
			this.status=0;
		},
		prev:function(offset){
			offset=typeof offset == 'undefined'?offset=1:offset%this.length;
			var index=offset>this.index?this.length+this.index-offset:this.index-offset;
			this.slide(index);
		},
		next:function(offset){
			if(typeof offset == 'undefined') offset=1;
			this.slide((this.index+offset)%this.length);
		},
		_start:function(e){
			if(!this.touching)this.preventDefault(e);
			this.element.onclick=null
			this.startPos=this.getMousePoint(e);
			var style=this.element.style;
			style.webkitTransitionDuration = style.MozTransitionDuration = style.msTransitionDuration = style.OTransitionDuration = style.transitionDuration = '0ms';
			this.scrolling=1;//滚动屏幕
			this.startTime=new Date();
		},
		_move:function(e){
			if(!this.scrolling || e.touches && e.touches.length>1 || e.scale && e.scale !== 1) return;
			var direction=this.vertical?'top':'left', size=this.vertical?'height':'width', xy=this.vertical?'y':'x', yx=this.vertical?'x':'y';
			this.endPos=this.getMousePoint(e);
			var offx=this.endPos[xy]-this.startPos[xy];
			if(this.scrolling===2 || Math.abs(offx)>=Math.abs(this.endPos[yx]-this.startPos[yx])){
				this.preventDefault(e);
				this.pause(); //暂停幻灯
				offx=offx/((!this.index&&offx>0 || this.index==this.length-1&&offx<0) ? (Math.abs(offx)/this[size]+1) : 1);
				this.element.style[direction]=-this.index*this[size]+offx+'px';
				if(offx!=0)this.scrolling=2;//标记拖动（有效触摸）2
			}else this.scrolling=0;//设置为摒弃标记0
		},
		_end:function(e){
			if(typeof this.scrolling != 'undefined'){
				try{
					var xy=this.vertical?'y':'x', size=this.vertical?'height':'width', offx=this.endPos[xy]-this.startPos[xy];
					if(this.scrolling===2)this.element.onclick=new Function('return false;');
				}catch(err){
					offx=0;
				}
				if((new Date()-this.startTime<250 && Math.abs(offx)>this[size]*0.1 || Math.abs(offx)>this[size]/2) && ((offx<0 && this.index+1<this.length) || (offx>0 && this.index>0))){
					offx>0?this.prev():this.next();
				}else{
					this.slide(this.index);
				}
				delete this.scrolling;//删掉标记
				delete this.startPos;
				delete this.endPos;
				delete this.startTime;
				if(this.opt.auto>=0)this.begin();				
			}
		},
		mouseScroll:function(e){
			if(this.opt.mouseWheel){
				this.preventDefault(e);
				e=e||window.event;
				var wheelDelta=e.wheelDelta || e.detail && e.detail*-1 || 0,
					flag=wheelDelta/Math.abs(wheelDelta);//这里flag指鼠标滚轮的方向，1表示向上，-1向下
				wheelDelta>0?this.next():this.prev();
			}
		},
		_transitionend:function(e){
			this.opt.after.call(this, this.index, this.slides[this.index]);
		}
	}
	window.TouchSlider=TouchSlider;
})(window, undefined);

//var TouchSlide=function(a){a=a||{};var b={slideCell:a.slideCell||"#touchSlide",titCell:a.titCell||".hd li",mainCell:a.mainCell||".bd",effect:a.effect||"left",autoPlay:a.autoPlay||!1,delayTime:a.delayTime||200,interTime:a.interTime||2500,defaultIndex:a.defaultIndex||0,titOnClassName:a.titOnClassName||"on",autoPage:a.autoPage||!1,prevCell:a.prevCell||".prev",nextCell:a.nextCell||".next",pageStateCell:a.pageStateCell||".pageState",pnLoop:"undefined "==a.pnLoop?!0:a.pnLoop,startFun:a.startFun||null,endFun:a.endFun||null,switchLoad:a.switchLoad||null},c=document.getElementById(b.slideCell.replace("#",""));if(!c)return!1;var d=function(a,b){a=a.split(" ");var c=[];b=b||document;var d=[b];for(var e in a)0!=a[e].length&&c.push(a[e]);for(var e in c){if(0==d.length)return!1;var f=[];for(var g in d)if("#"==c[e][0])f.push(document.getElementById(c[e].replace("#","")));else if("."==c[e][0])for(var h=d[g].getElementsByTagName("*"),i=0;i<h.length;i++){var j=h[i].className;j&&-1!=j.search(new RegExp("\\b"+c[e].replace(".","")+"\\b"))&&f.push(h[i])}else for(var h=d[g].getElementsByTagName(c[e]),i=0;i<h.length;i++)f.push(h[i]);d=f}return 0==d.length||d[0]==b?!1:d},e=function(a,b){var c=document.createElement("div");c.innerHTML=b,c=c.children[0];var d=a.cloneNode(!0);return c.appendChild(d),a.parentNode.replaceChild(c,a),m=d,c},g=function(a,b){!a||!b||a.className&&-1!=a.className.search(new RegExp("\\b"+b+"\\b"))||(a.className+=(a.className?" ":"")+b)},h=function(a,b){!a||!b||a.className&&-1==a.className.search(new RegExp("\\b"+b+"\\b"))||(a.className=a.className.replace(new RegExp("\\s*\\b"+b+"\\b","g"),""))},i=b.effect,j=d(b.prevCell,c)[0],k=d(b.nextCell,c)[0],l=d(b.pageStateCell)[0],m=d(b.mainCell,c)[0];if(!m)return!1;var N,O,n=m.children.length,o=d(b.titCell,c),p=o?o.length:n,q=b.switchLoad,r=parseInt(b.defaultIndex),s=parseInt(b.delayTime),t=parseInt(b.interTime),u="false"==b.autoPlay||0==b.autoPlay?!1:!0,v="false"==b.autoPage||0==b.autoPage?!1:!0,w="false"==b.pnLoop||0==b.pnLoop?!1:!0,x=r,y=null,z=null,A=null,B=0,C=0,D=0,E=0,G=/hp-tablet/gi.test(navigator.appVersion),H="ontouchstart"in window&&!G,I=H?"touchstart":"mousedown",J=H?"touchmove":"",K=H?"touchend":"mouseup",M=m.parentNode.clientWidth,P=n;if(0==p&&(p=n),v){p=n,o=o[0],o.innerHTML="";var Q="";if(1==b.autoPage||"true"==b.autoPage)for(var R=0;p>R;R++)Q+="<li>"+(R+1)+"</li>";else for(var R=0;p>R;R++)Q+=b.autoPage.replace("$",R+1);o.innerHTML=Q,o=o.children}"leftLoop"==i&&(P+=2,m.appendChild(m.children[0].cloneNode(!0)),m.insertBefore(m.children[n-1].cloneNode(!0),m.children[0])),N=e(m,'<div class="tempWrap" style="overflow:hidden; position:relative;"></div>'),m.style.cssText="width:"+P*M+"px;"+"position:relative;overflow:hidden;padding:0;margin:0;";for(var R=0;P>R;R++)m.children[R].style.cssText="display:table-cell;vertical-align:top;width:"+M+"px";var S=function(){"function"==typeof b.startFun&&b.startFun(r,p)},T=function(){"function"==typeof b.endFun&&b.endFun(r,p)},U=function(a){var b=("leftLoop"==i?r+1:r)+a,c=function(a){for(var b=m.children[a].getElementsByTagName("img"),c=0;c<b.length;c++)b[c].getAttribute(q)&&(b[c].setAttribute("src",b[c].getAttribute(q)),b[c].removeAttribute(q))};if(c(b),"leftLoop"==i)switch(b){case 0:c(n);break;case 1:c(n+1);break;case n:c(0);break;case n+1:c(1)}},V=function(){M=N.clientWidth,m.style.width=P*M+"px";for(var a=0;P>a;a++)m.children[a].style.width=M+"px";var b="leftLoop"==i?r+1:r;W(-b*M,0)};window.addEventListener("resize",V,!1);var W=function(a,b,c){c=c?c.style:m.style,c.webkitTransitionDuration=c.MozTransitionDuration=c.msTransitionDuration=c.OTransitionDuration=c.transitionDuration=b+"ms",c.webkitTransform="translate("+a+"px,0)"+"translateZ(0)",c.msTransform=c.MozTransform=c.OTransform="translateX("+a+"px)"},X=function(a){switch(i){case"left":r>=p?r=a?r-1:0:0>r&&(r=a?0:p-1),null!=q&&U(0),W(-r*M,s),x=r;break;case"leftLoop":null!=q&&U(0),W(-(r+1)*M,s),-1==r?(z=setTimeout(function(){W(-p*M,0)},s),r=p-1):r==p&&(z=setTimeout(function(){W(-M,0)},s),r=0),x=r}S(),A=setTimeout(function(){T()},s);for(var c=0;p>c;c++)h(o[c],b.titOnClassName),c==r&&g(o[c],b.titOnClassName);0==w&&(h(k,"nextStop"),h(j,"prevStop"),0==r?g(j,"prevStop"):r==p-1&&g(k,"nextStop")),l&&(l.innerHTML="<span>"+(r+1)+"</span>/"+p)};if(X(),u&&(y=setInterval(function(){r++,X()},t)),o)for(var R=0;p>R;R++)!function(){var a=R;o[a].addEventListener("click",function(){clearTimeout(z),clearTimeout(A),r=a,X()})}();k&&k.addEventListener("click",function(){(1==w||r!=p-1)&&(clearTimeout(z),clearTimeout(A),r++,X())}),j&&j.addEventListener("click",function(){(1==w||0!=r)&&(clearTimeout(z),clearTimeout(A),r--,X())});var Y=function(a){clearTimeout(z),clearTimeout(A),O=void 0,D=0;var b=H?a.touches[0]:a;B=b.pageX,C=b.pageY,m.addEventListener(J,Z,!1),m.addEventListener(K,$,!1)},Z=function(a){if(!H||!(a.touches.length>1||a.scale&&1!==a.scale)){var b=H?a.touches[0]:a;if(D=b.pageX-B,E=b.pageY-C,"undefined"==typeof O&&(O=!!(O||Math.abs(D)<Math.abs(E))),!O){switch(a.preventDefault(),u&&clearInterval(y),i){case"left":(0==r&&D>0||r>=p-1&&0>D)&&(D=.4*D),W(-r*M+D,0);break;case"leftLoop":W(-(r+1)*M+D,0)}null!=q&&Math.abs(D)>M/3&&U(D>-0?-1:1)}}},$=function(a){0!=D&&(a.preventDefault(),O||(Math.abs(D)>M/10&&(D>0?r--:r++),X(!0),u&&(y=setInterval(function(){r++,X()},t))),m.removeEventListener(J,Z,!1),m.removeEventListener(K,$,!1))};m.addEventListener(I,Y,!1)};