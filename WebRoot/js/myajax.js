


/*
ajax返回状态判断
readyState  准备就绪状态 4 
status  正确返回状态 200
xmlHttp.readyState=4
xmlHttp.status=200

注意：有汉字提交需要使用escape()对汉字进行编码

*/

/*创建一个新的XMLHttpRequest对象交谈Web服务器 */
var xmlHttp=false;
function HttpRequest(){
    xmlhttpObj =["MSXML2.XmlHttp.5.0","MSXML2.XmlHttp.4.0","MSXML2.XmlHttp.3.0","MSXML2.XmlHttp","Microsoft.XmlHttp"];
    if(window.XMLHttpRequest)
    {
        xmlHttp = new XMLHttpRequest();
    }
    else if(window.ActiveXObject)
    {
        for(i=0;i<xmlhttpObj.length;i++)    
        {
            xmlHttp = new ActiveXObject(xmlhttpObj[i]);
            if(xmlHttp)
            {
                break;    
            }
        }
    }
    else
    {
        alert("未能创建XMLHttpRequest对象！");
    }
    return xmlHttp;
}
/*
提交数据
getmethod  提交的方式 get post
url 提交的页面
setParameter 设置提交的参数 如（url=set.aspx&user=lisi）
statechange  提交后执行的方法
*/
function GetServer(getmethod,url,setParameter,statechange) {
HttpRequest();
xmlHttp.open(getmethod, url,true);
xmlHttp.onreadystatechange = statechange;
xmlHttp.send(setParameter);
}
