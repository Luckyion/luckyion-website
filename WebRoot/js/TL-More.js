/*******************************************
Name: TL-More.js
Version: 1.0
Author: TsoLong
Email: tsolong@126.com
WebSite: http://www.tsolong.com/
Create Date: 2008-12-01
Description:
JS鏁堟灉搴�
*******************************************/
TL.zIndex = 10000
/****************************************
Description:
鎷栧姩鏁堟灉
1.鍦ㄩ〉闈�腑鍙鐐瑰嚮鑳芥嫋鍔ㄧ殑瀵硅薄灏变細鎶婅嚜韬殑zIndex缃簬鏈€鍓嶉潰
Parameter:
config:{
dragElement: 榧犳爣鎵€鎷栧姩鐨勫璞�,
moveElement: 鎷栧姩鏃剁Щ鍔ㄧ殑瀵硅薄(鍙€夊弬鏁�,榛樿鍊糳ragElement,姝ゅ弬鏁颁负绌�,鍒欑Щ鍔ㄧ殑瀵硅薄moveElement=鎷栧姩鐨勫璞ragElement),
dragOpacity: 鎷栧姩鏃剁Щ鍔ㄧ殑瀵硅薄鐨勪笉閫忔槑搴�(鍙€夊弬鏁�,榛樿涓轰笉閫忔槑,鍙栧€艰寖鍥�0-1),
position: 绉板姩鐨勮寖鍥碵鏈€灏弜鍧愭爣, 鏈€灏弝鍧愭爣, 鏈€澶鍧愭爣, 鏈€澶鍧愭爣](鍙€夊弬鏁�,姝ゅ弬鏁颁负绌�,鍒欏璞″彲鍦ㄩ〉闈�笂涔辨嫋)
}
Example:
TL.drag({
dragElement: TL.$("boxTitle"),
moveElement: TL.$("box"),
dragOpacity: 0.8,
position: [100, 100, 500, 500]
});//璁╁璞¤兘鎷栧姩,浣嗘瀵硅薄蹇呴』鏄粷瀵瑰畾浣嶅厓绱 
	
//濡傛灉瑕佽涓€涓涓嶈兘鎷栧嚭缃戦〉浠ュ鐨勫湴鏂�,璇疯涓嬮潰浠ｇ爜
var pos=TL.getDrapMaxPos(box);//姝ゅ嚱鏁板湪姝L瀵硅薄涓�
TL.drag({
dragElement: TL.$("boxTitle"),
moveElement: TL.$("box"),
dragOpacity: 0.8,
position: [0, 0, pos[0], pos[1]]
})
Create Date: 2008-12-01
****************************************/
TL.drag = function (config) {
    config.moveElement = config.moveElement || config.dragElement;
    config.dragElement.config = config;
    config.dragElement.style.cursor = "pointer";
    TL.addEvent(config.moveElement, "mousedown", function () {
        config.moveElement.style.zIndex = TL.zIndex++;
    })
    config.dragElement.onmousedown = TL.drag.start;
    //TL.addEvent(config.dragElement, "mousedown", TL.drag.start);
}
TL.drag.start = function (e) {
    e = TL.getEvent(e);
    TL.drag.dragElement = this;
    var o = TL.drag.dragElement;
    //var x = parseInt(o.config.moveElement.style.left);
    //var y = parseInt(o.config.moveElement.style.top);
    var x = parseInt(o.config.moveElement.offsetLeft);
    var y = parseInt(o.config.moveElement.offsetTop);
    o.config.moveElement.lastMouseX = e.clientX;
    o.config.moveElement.lastMouseY = e.clientY;
    if (typeof o.config.position != "undefined") {
        o.config.moveElement.minMouseX = e.clientX - x + o.config.position[0];
        o.config.moveElement.minMouseY = e.clientY - y + o.config.position[1];
        o.config.moveElement.maxMouseX = o.config.moveElement.minMouseX + o.config.position[2] - o.config.position[0];
        o.config.moveElement.maxMouseY = o.config.moveElement.minMouseY + o.config.position[3] - o.config.position[1];
    }
    document.onmousemove = TL.drag.move;
    document.onmouseup = TL.drag.end;
    return false;
}
TL.drag.move = function (e) {
    e = TL.getEvent(e);
    var o = TL.drag.dragElement;
    if (typeof o.config.dragOpacity != "undefined") {
        TL.setStyle(o.config.moveElement, {
            opacity: o.config.dragOpacity
        });
    }
    var x = parseInt(o.config.moveElement.offsetLeft);
    var y = parseInt(o.config.moveElement.offsetTop);
    var ex = e.clientX;
    var ey = e.clientY;
    if (typeof o.config.position != "undefined") {
        ex = Math.max(ex, o.config.moveElement.minMouseX);
        ey = Math.max(ey, o.config.moveElement.minMouseY);
        ex = Math.min(ex, o.config.moveElement.maxMouseX);
        ey = Math.min(ey, o.config.moveElement.maxMouseY);
    }
    o.config.moveElement.style.left = x + (ex - o.config.moveElement.lastMouseX) + "px";
    o.config.moveElement.style.top = y + (ey - o.config.moveElement.lastMouseY) + "px";
    o.config.moveElement.lastMouseX = ex;
    o.config.moveElement.lastMouseY = ey;
    return false;
}
TL.drag.end = function () {
    var o = TL.drag.dragElement;
    if (typeof o.config.dragOpacity != "undefined") {
        TL.setStyle(o.config.moveElement, {
            opacity: 1
        });
    }
    document.onmousemove = null;
    document.onmouseup = null;
    TL.drag.dragElement = null;
}

/****************************************
Description:
椤甸潰閬僵灞�
1.鍙互閫氳繃new鏉ュ垱寤哄涓伄缃╁眰
2.褰撻〉闈㈠ぇ灏忔敼鍙樻垨婊氬姩鏃�,閬僵灞備細鑷姩璋冩暣涓虹綉椤电殑楂樺害
Example:
var obj = new TL.overlay();//鏄剧ず
obj.close();//鍏抽棴(浠庨〉闈�腑绉诲嚭)
Create Date: 2008-12-04
****************************************/
TL.overlay = function () {
    var overlay = document.createElement("div");
    TL.setStyle(overlay, {
        width: "100%",
        height: TL.getPageSize()[1] + "px",
        position: "absolute",
        left: "0",
        top: "0",
        zIndex: TL.zIndex++,
        backgroundColor: "#000",
        opacity: 0.3
    });
    this.changeSize = function () {
        overlay.style.height = TL.getPageSize()[1] + "px";
    }
    this.show = function () {
        document.getElementsByTagName("body")[0].appendChild(overlay);
        TL.addEvent(window, "resize", this.changeSize);
        TL.addEvent(window, "scroll", this.changeSize);
    }
    this.close = function () {
        if (overlay)
            overlay.parentNode.removeChild(overlay);
        TL.removeEvent(window, "resize", this.changeSize);
        TL.removeEvent(window, "scroll", this.changeSize);

        overlay = null;
        if (TL.browser.msie)
            CollectGarbage();
    }
    this.show();
}

/****************************************
Description:
loading鏁堟灉
1.椤甸潰涓案杩滃彧鏈変竴涓猯oading鍏冪礌,涓嶅彲鍒涘缓澶氫釜瀹炰緥
2.loading鍧椾笅闈�細鏈夐伄缃╁眰鍑虹幇
3.濡傛灉椤甸潰宸插瓨鍦╨oading鍏冪礌,鍒欏彧浼氭浛鎹㈡彁绀虹殑鍐呭,涓嶄細鍒涘缓鏂扮殑鍏冪礌
4.褰撻〉闈㈠ぇ灏忔敼鍙樻垨婊氬姩鏃�,loading鍧楄嚜鍔ㄨ皟鏁村眳涓樉绀�
Parameter:
config:{
skin: 鐨偆鐨勫悕绉�(鍙€夊弬鏁�,榛樿涓�"default"),
content: 鍐呭(鍙互鏄痟tml),
}
Example:
TL.loading({
skin: "default",
content: "鍔犺浇鏁版嵁涓绋嶅悗...",
});//鏄剧ず
TL.loading.close();//鍏抽棴
Create Date: 2008-12-04
****************************************/
TL.loading = function (config) {
    config.skin = config.skin || "default";
    TL.loading.show(config);
}
TL.loading.Center = function () {
    TL.setWindowCenter(TL.$("loading"));
}
TL.loading.show = function (config) {
    var loading = TL.$("loading");
    if (loading) {
        loading.innerHTML = config.content;
        TL.loading.Center();
        return;
    }
    TL.loading.overlay = new TL.overlay();
    var loading = document.createElement("div");
    loading.setAttribute("id", "loading");
    loading.style.zIndex = TL.zIndex++;
    loading.className = config.skin;
    loading.innerHTML = config.content;
    TL.setStyle(win, {
        left: "-1000px",
        top: "-1000px"
    })
    document.getElementsByTagName("body")[0].appendChild(loading);
    TL.loading.Center();
    TL.addEvent(window, "resize", TL.loading.Center);
    TL.addEvent(window, "scroll", TL.loading.Center);
}
TL.loading.close = function () {
    var loading = TL.$("loading");
    if (loading)
        loading.parentNode.removeChild(loading);
    if (TL.loading.overlay != null)
        TL.loading.overlay.close();
    TL.loading.overlay = null;
    TL.removeEvent(window, "resize", TL.loading.Center);
    TL.removeEvent(window, "scroll", TL.loading.Center);
}

/****************************************
Description:
window瀵硅瘽妗�
1.鍙€氳繃new鏉ュ垱寤哄涓璇濇
2.涓冪绫诲瀷鐨勫璇濇
3.瀹屽叏鍙嚜瀹氫箟瀵硅瘽妗嗗弬鏁�
Example:
new TL.win({
title: "绯荤粺鎻愮ず",
msg: "璇疯緭鍏ユ偍鐨勭敤鎴峰悕"
})//鎻愮ず瀵硅瘽妗�
new TL.win({
type: 6,
title: "鑷畾涔夊唴瀹�",
html: "鑷畾涔夊唴瀹�"
})//鑷畾涔夊璇濇
new TL.win({
type: 7,
width: 1000,
height: 700,
title: "TsoLong Blog -- http://www.tsolong.com",
url: "http://www.tsolong.com"
})//鍔犺浇缃戦〉
Create Date: 2008-12-05
****************************************/
TL.win = function (config) {
    this.config = {
        type: 1, //瀵硅瘽妗嗙被鍨�(鍙€夊弬鏁�,榛樿鍊间负1) 1:鎻愮ず 2:璀﹀憡 3:姝ｇ‘鎴栨垚鍔� 4:閿欒 5:闂彿 6:鑷畾涔� 7:iframe鍔犺浇缃戦〉
        width: 400, //瀵硅瘽妗嗗搴�(鍙€夊弬鏁�,榛樿涓�400)
        height: "", //type璁句负6-7鏈夋晥,杩欎釜height鏄寚瀵硅瘽妗嗗幓闄ゆ爣棰樻爮鍓╀綑閮ㄥ垎鐨勯珮搴�(鍙€夊弬鏁�,榛樿鏄牴鎹噷闈㈠唴瀹硅嚜鍔ㄥ闀块珮搴�)
        position: [], //瀵硅瘽妗嗕綅缃畃osition[left,top](鍙€夊弬鏁�,榛樿灞呬腑)
        skin: "default", //鐨偆鐨勫悕绉�(鍙€夊弬鏁�,榛樿涓�"default")
        title: "", //鏍囬鏂囧瓧
        msg: "", //鎻愮ず淇℃伅 type璁句负1-5鏈夋晥
        html: "", //鑷畾鍐呭 type璁句负6鏈夋晥
        url: "", //缃戦〉鍦板潃 type璁句负7鏈夋晥
        closeEvent: null, //type璁句负1-7鏃�,鍏抽棴鎸夐挳鐨勫洖璋冨嚱鏁� type璁句负1-4鏃�,纭畾閾甸挳鐨勫洖璋冨嚱鏁� type璁句负5鏃�,鍙栨秷鎸夐挳鐨勫洖璋冨嚱鏁�(鍙€夊弬鏁�)
        confirmEvent: null, //type璁句负5鏃�,纭畾鎸夐挳鐨勫洖璋冨嚱鏁�(鍙€夊弬鏁�)
        isOverlay: true, //鏄剧ず閬僵灞�(鍙€夊弬鏁�,榛樿涓簍rue)
        isTransition: false, //瀵硅瘽妗嗘槸鍚︿互娓愬彉鐨勬柟寮忔樉绀哄嚭鏉�(鍙€夊弬鏁帮紝榛樿涓簍rue)
        isTopControl: false, //瀵硅瘽妗嗛《閮ㄥ彸渚ф寜閽� type璁句负6-7鏈夋晥(鍙€夊弬鏁�,榛樿涓簍rue)
        isDrag: false, //鎷栧姩(鍙€夊弬鏁�,榛樿涓簍rue)
        dragOpacity: 0.7, //鎷栧姩鏃跺璇濇鐨勪笉閫忔槑搴�(鍙€夊弬鏁�,榛樿涓�0.7)
        ishead: true,
        headurl: null,
        headheight: 30, //寮瑰嚭妗嗗ご閮ㄧ殑楂樺害
        ismiddle: true,
        okname: "纭� 瀹�",
        cancelname: "鍙� 娑�",
        xx_div_css:"div_500",
        imgindex: 1
    }
    for (var par in config) {
        this.config[par] = config[par];
    }
    this.show();
}
TL.win.prototype = {
    show: function () {

        var config = this.config;
        var oThis = this;

        if (config.isOverlay)
            this.overlay = new TL.overlay();

        var win = document.createElement("div");
        this.win = win; //淇濆瓨鍏冪礌瀵硅薄
        win.className = "xxx_Class "; //+ config.skin;
        win.style.width = config.width + "px";
        win.style.zIndex = TL.zIndex++;


        var xx_div = document.createElement("div");
        xx_div.className = config.xx_div_css;

        var xx_dl = document.createElement("dl");


        var p_clear = document.createElement("p");
        p_clear.className = "clear";

        //鎻愮ず妗嗙殑澶�
        var winTop = document.createElement("dt");
        winTop.className = "div_top_title";
        winTop.innerHTML = "   <p class=\"div_top_ts\"><span>" + config.title + "</span></p><p class=\"div_top_right\"></p>";

        this.win.top = winTop;


        var dv1 = document.createElement("p");
        dv1.className = "div_top_right";
        dv1.innerHTML = "<a href=\"#\" class=\"div_top_quit\"></a>";
        dv1.onclick = function () {
            oThis.close();
        }
        //        var dv2 = document.createElement("a");
        //        dv2.innerHTML = "<iframe  frameborder=\"no\" scrolling=\"no\" src=\"" + config.headurl + "\" width=\"100%\" height=\"" + config.headheight + "px\"></iframe>";

        winTop.appendChild(dv1);
        //winTop.appendChild(dv2);
        if (config.ishead) {
            xx_dl.appendChild(winTop);
        }
        //鎻愮ず妗嗙殑澶�

        //鎻愮ず妗嗙殑涓儴
        var winMiddle = document.createElement("dd");
        this.win.middle = winMiddle; //淇濆瓨鍏冪礌瀵硅薄



        var dv3 = document.createElement("div");
        dv3.className = "div_middle";

        if (config.type == 2) {
            dv3.innerHTML = "<p class=\"div_middleImg2\"></p><p class=\"div_middleText\">" + config.msg + "</p>";
        }
        else {
            dv3.innerHTML = "<p class=\"div_middleImg" + config.imgindex + "\"></p><p class=\"div_middleText\">" + config.msg + "</p>";
        }

        var dv4 = document.createElement("div");
        dv4.innerHTML = "<iframe  frameborder=\"no\" scrolling=\"no\" src=\"" + config.url + "\" width=\"100%\" height=\"" + config.height + "\"></iframe>";

        if (config.type == 1 || config.type == 2) {
            winMiddle.appendChild(dv3);
        } else {
            winMiddle.appendChild(dv4);
        }

        var winBtnOk, winBtnCancel;
        var div5 = document.createElement("div");
        div5.className = "div_bottom";
        var div6 = document.createElement("p");

        if (config.type == 1) {
            winBtnOk = document.createElement("a");
            winBtnOk.className = "xxx_ok";
            winBtnOk.innerHTML = "<span>" + config.okname + "</span>";
            winBtnOk.onclick = function () {
                oThis.close();
                if (config.closeEvent != null) {
                    config.closeEvent();
                }
            }
            div6.appendChild(winBtnOk);
        }
        else if (config.type == 2) {
            winBtnOk = document.createElement("a");
            winBtnOk.className = "xxx_ok";
            winBtnOk.innerHTML = "<span>" + config.okname + "</span>";
            winBtnOk.onclick = function () {
                oThis.close();
                if (config.confirmEvent != null) {
                    config.confirmEvent();
                }
            }
            winBtnCancel = document.createElement("a");
            winBtnCancel.className = "xxx_cancel";
            winBtnCancel.innerHTML = "<span>" + config.cancelname + "</span>";
            winBtnCancel.onclick = function () {
                oThis.close();
                if (config.closeEvent != null)
                    config.closeEvent();
            }
            div6.appendChild(winBtnOk);
            div6.appendChild(winBtnCancel);
        }

        if (config.type < 3) {
            div5.appendChild(div6);
            winMiddle.appendChild(div5);
        }

        if (config.ismiddle) {
            xx_dl.appendChild(winMiddle);
        }

        winMiddle.appendChild(p_clear);
        xx_div.appendChild(xx_dl);
        win.appendChild(xx_div);
        //鎻愮ず妗嗙殑涓儴




        var winDrag = function () {
            var pos = TL.getDrapMaxPos(win);
            TL.drag({
                dragElement: winTop,
                moveElement: win,
                dragOpacity: config.dragOpacity,
                position: [0, 0, pos[0], pos[1]]
            })
        }

        var topControlMinMax = function () {
            var hide = function () {
                this.style.display = "none";
                this.nextSibling.style.display = "block";
                winMiddle.style.display = "none";
                if (config.isDrag) {
                    winDrag();
                }
            }
            var show = function () {
                this.style.display = "none";
                this.previousSibling.style.display = "block";
                winMiddle.style.display = "block";
                if (config.isDrag) {
                    winDrag();
                }
            }
            var winMin = document.createElement("a");
            winMin.className = "winMin";
            winMin.title = "鏀惰捣";
            winMin.onclick = hide;
            b.appendChild(winMin);

            var winMax = document.createElement("a");
            winMax.className = "winMax";
            winMax.title = "灞曞紑";
            winMax.onclick = show;
            b.appendChild(winMax);

            winTop.ondblclick = function () {
                if (winMiddle.style.display == "block" || winMiddle.style.display == "")
                    hide.apply(winMin);
                else
                    show.apply(winMax);
            }
        }




        TL.setStyle(win, {
            left: "-1000px",
            top: "-1000px"
        })

        if (config.isTransition) {
            TL.setStyle(win, {
                opacity: 0
            })
        }

        document.getElementsByTagName("body")[0].appendChild(win);

        var lastBind = function () {
            if (config.isDrag)
                winDrag();

            //            if (config.type > 0 && config.type <= 5) {
            //                if (config.type < 5)
            //                    winBtnOk.focus();
            //                else
            //                    winBtnCancel.focus();
            //            }
        }

        if (!config.isTransition) {

            var pos;
            if (config.position.length == 0) {
               
                pos = TL.getWindowCenterPos(win);

            } else {
              
                pos = config.position;
            }
          
             new TL.tween("quartic", "easeOut", pos[1], 0, 0, 1, function (v) {
                if (v < 0) {
                    v = 0;
                }

                TL.setStyle(win, {
                    left: pos[0] + "px",
                    top: v + "px"
                })
            }, lastBind);

//            new TL.tween("quartic", "easeOut", pos[1], 0, 10, 1, function (v) {
//                if (v < 0) {
//                    v = 0;
//                }

//                TL.setStyle(win, {
//                    left: pos[0] + "px",
//                    top: v + "px"
//                })
//            }, lastBind);

//            new TL.tween("linear", "", 100, 0, 10, 1, function (v) {
//                TL.setStyle(win, {
//                    opacity: parseFloat(v / 100)
//                })
//            });
        }
        else {
            if (config.position.length == 0) {
                TL.setWindowCenter(win);
            }
            else {
                TL.setStyle(win, {

                    left: config.position[0] + "px",
                    top: config.position[1] + "px"
                })
            }
            lastBind();
        }
    },
    close: function () {
        var win = this.win;
        var config = this.config;
        win.parentNode.removeChild(win);
        if (config.isOverlay)
            this.overlay.close();
    }
}

/****************************************
Description:
缂撳姩绫�
Example:
xhtml:
<div id="myBox" style="width:100px; height:100px; position:absolute; border:1px solid red; background:#ccc;"></div>
JavaScript:
new TL.tween("bounce", "easeOut", 500, 0, 80, 10, function(v){
TL.setStyle("myBox", {
top: v + "px"
})
}, function(){
alert("缂撳姩瀹屾垚");
});
Create Date: 2009-03-25
****************************************/
/*
* 
* @param {Object} tween			缂撳姩绉嶇被(璇峰弬鐓L.tween.list)
* @param {Object} ease				缂撳姩绫诲瀷(easeIn銆乪aseOut銆乪aseInOut)
* @param {Object} v				缂撳姩鍊�(浠�0寮€濮嬪埌浣犺瀹氱殑v,0-v)
* @param {Object} startStep		缂撳姩鐨勮捣濮嬫鏁�
* @param {Object} stepTotal		缂撳姩鐨勬€绘鏁�
* @param {Object} stepTime			缂撳姩鐨勬杩涙椂闂�(姣)
* @param {Object} stepFunc			缂撳姩鏃舵瘡姝ユ墽琛岀殑鍑芥暟
* @param {Object} callBackFunc		缂撳姩瀹屾垚鍥炶皟鐨勫嚱鏁�
*/
TL.tween = function (tween, ease, v, startStep, stepTotal, stepTime, stepFunc, callBackFunc) {
    var oInterval = window.setInterval(function () {
        if (startStep < stepTotal) {
            startStep++;
            var tmpFunc = tween == "linear" ? TL.tween.list["linear"] : TL.tween.list[tween][ease];
            stepFunc(Math.ceil(tmpFunc(startStep, 0, v, stepTotal)));
        }
        else {
            stepFunc(v);
            clearInterval(oInterval);
            if (callBackFunc)
                callBackFunc();
        }
    }, stepTime)
}
TL.tween.list = {
    linear: function (t, b, c, d) {
        return c * t / d + b;
    },
    quadratic: {
        easeIn: function (t, b, c, d) {
            return c * (t /= d) * t + b;
        },
        easeOut: function (t, b, c, d) {
            return -c * (t /= d) * (t - 2) + b;
        },
        easeInOut: function (t, b, c, d) {
            if ((t /= d / 2) < 1)
                return c / 2 * t * t + b;
            return -c / 2 * ((--t) * (t - 2) - 1) + b;
        }
    },
    cubic: {
        easeIn: function (t, b, c, d) {
            return c * (t /= d) * t * t + b;
        },
        easeOut: function (t, b, c, d) {
            return c * ((t = t / d - 1) * t * t + 1) + b;
        },
        easeInOut: function (t, b, c, d) {
            if ((t /= d / 2) < 1)
                return c / 2 * t * t * t + b;
            return c / 2 * ((t -= 2) * t * t + 2) + b;
        }
    },
    quartic: {
        easeIn: function (t, b, c, d) {
            return c * (t /= d) * t * t * t + b;
        },
        easeOut: function (t, b, c, d) {
            return -c * ((t = t / d - 1) * t * t * t - 1) + b;
        },
        easeInOut: function (t, b, c, d) {
            if ((t /= d / 2) < 1)
                return c / 2 * t * t * t * t + b;
            return -c / 2 * ((t -= 2) * t * t * t - 2) + b;
        }
    },
    quintic: {
        easeIn: function (t, b, c, d) {
            return c * (t /= d) * t * t * t * t + b;
        },
        easeOut: function (t, b, c, d) {
            return c * ((t = t / d - 1) * t * t * t * t + 1) + b;
        },
        easeInOut: function (t, b, c, d) {
            if ((t /= d / 2) < 1)
                return c / 2 * t * t * t * t * t + b;
            return c / 2 * ((t -= 2) * t * t * t * t + 2) + b;
        }
    },
    sinusoidal: {
        easeIn: function (t, b, c, d) {
            return -c * Math.cos(t / d * (Math.PI / 2)) + c + b;
        },
        easeOut: function (t, b, c, d) {
            return c * Math.sin(t / d * (Math.PI / 2)) + b;
        },
        easeInOut: function (t, b, c, d) {
            return -c / 2 * (Math.cos(Math.PI * t / d) - 1) + b;
        }
    },
    exponential: {
        easeIn: function (t, b, c, d) {
            return (t == 0) ? b : c * Math.pow(2, 10 * (t / d - 1)) + b;
        },
        easeOut: function (t, b, c, d) {
            return (t == d) ? b + c : c * (-Math.pow(2, -10 * t / d) + 1) + b;
        },
        easeInOut: function (t, b, c, d) {
            if (t == 0)
                return b;
            if (t == d)
                return b + c;
            if ((t /= d / 2) < 1)
                return c / 2 * Math.pow(2, 10 * (t - 1)) + b;
            return c / 2 * (-Math.pow(2, -10 * --t) + 2) + b;
        }
    },
    circular: {
        easeIn: function (t, b, c, d) {
            return -c * (Math.sqrt(1 - (t /= d) * t) - 1) + b;
        },
        easeOut: function (t, b, c, d) {
            return c * Math.sqrt(1 - (t = t / d - 1) * t) + b;
        },
        easeInOut: function (t, b, c, d) {
            if ((t /= d / 2) < 1)
                return -c / 2 * (Math.sqrt(1 - t * t) - 1) + b;
            return c / 2 * (Math.sqrt(1 - (t -= 2) * t) + 1) + b;
        }
    },
    elastic: {
        easeIn: function (t, b, c, d, a, p) {
            if (t == 0)
                return b;
            if ((t /= d) == 1)
                return b + c;
            if (!p)
                p = d * .3;
            if (!a || a < Math.abs(c)) {
                a = c;
                var s = p / 4;
            }
            else
                var s = p / (2 * Math.PI) * Math.asin(c / a);
            return -(a * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b;
        },
        easeOut: function (t, b, c, d, a, p) {
            if (t == 0)
                return b;
            if ((t /= d) == 1)
                return b + c;
            if (!p)
                p = d * .3;
            if (!a || a < Math.abs(c)) {
                a = c;
                var s = p / 4;
            }
            else
                var s = p / (2 * Math.PI) * Math.asin(c / a);
            return (a * Math.pow(2, -10 * t) * Math.sin((t * d - s) * (2 * Math.PI) / p) + c + b);
        },
        easeInOut: function (t, b, c, d, a, p) {
            if (t == 0)
                return b;
            if ((t /= d / 2) == 2)
                return b + c;
            if (!p)
                p = d * (.3 * 1.5);
            if (!a || a < Math.abs(c)) {
                a = c;
                var s = p / 4;
            }
            else
                var s = p / (2 * Math.PI) * Math.asin(c / a);
            if (t < 1)
                return -.5 * (a * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b;
            return a * Math.pow(2, -10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p) * .5 + c + b;
        }
    },
    back: {
        easeIn: function (t, b, c, d, s) {
            if (s == undefined)
                s = 1.70158;
            return c * (t /= d) * t * ((s + 1) * t - s) + b;
        },
        easeOut: function (t, b, c, d, s) {
            if (s == undefined)
                s = 1.70158;
            return c * ((t = t / d - 1) * t * ((s + 1) * t + s) + 1) + b;
        },
        easeInOut: function (t, b, c, d, s) {
            if (s == undefined)
                s = 1.70158;
            if ((t /= d / 2) < 1)
                return c / 2 * (t * t * (((s *= (1.525)) + 1) * t - s)) + b;
            return c / 2 * ((t -= 2) * t * (((s *= (1.525)) + 1) * t + s) + 2) + b;
        }
    },
    bounce: {
        easeIn: function (t, b, c, d) {
            return c - Tween.Bounce.easeOut(d - t, 0, c, d) + b;
        },
        easeOut: function (t, b, c, d) {
            if ((t /= d) < (1 / 2.75)) {
                return c * (7.5625 * t * t) + b;
            }
            else
                if (t < (2 / 2.75)) {
                    return c * (7.5625 * (t -= (1.5 / 2.75)) * t + .75) + b;
                }
                else
                    if (t < (2.5 / 2.75)) {
                        return c * (7.5625 * (t -= (2.25 / 2.75)) * t + .9375) + b;
                    }
                    else {
                        return c * (7.5625 * (t -= (2.625 / 2.75)) * t + .984375) + b;
                    }
        },
        easeInOut: function (t, b, c, d) {
            if (t < d / 2)
                return Tween.Bounce.easeIn(t * 2, 0, c, d) * .5 + b;
            else
                return Tween.Bounce.easeOut(t * 2 - d, 0, c, d) * .5 + c * .5 + b;
        }
    }
}

//绠€鍖栬皟鐢�
var drag = drag || TL.drag;
var ovarlay = ovarlay || TL.ovarlay;
var loading = loading || TL.loading;
var win = win || TL.win;
var tween = tween || TL.tween;