package com.luckyion.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class MyLogger {
	public MyLogger(){
		
	}
	/**
	 * ��־��¼
	 * ��¼��ʽΪ��ʱ��  + log��Ϣ
	 * @param logmsg
	 */
	public static void log(String logmsg){
		TextRead tr = new TextRead("D:" + File.separator + "myWebSite" + File.separator, "log.log");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(new Date());
		System.out.println(logmsg);
		tr.writeText(time + " " + logmsg);		
	}
	
	/**
	 * Log message.
	 * @param tag
	 * @param logmsg
	 */
	public static void log(String tag, String logmsg){
		
	}
	//��ȡ��־
	public static List<String> getLog(String time){
		List<String> list = new TextRead("D:" + File.separator + "activedKeys" + File.separator, "log.log")
		.readText();
		return list;
	}
	/**
	 * ������־
	 * @param tag
	 * @param logmsg
	 */
	public static void testLog(String tag, String logmsg){
		System.out.println(tag + ":" + logmsg);
	}

}
