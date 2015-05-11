package com.luckyion.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FormatTime {
	/**
	 * 获取时间
	 * type=0:yyyy-MM-dd HH:mm:ss
	 * type=1:yyyy-MM-dd
	 * type=2:MM-dd
	 * @return
	 */
	public static String getTime(int type){
		String result = null;
		switch(type){
		case 0:
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			result = sdf.format(new Date());
			break;
		case 1:
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			result = sdf1.format(new Date());
			break;
		case 2:
			SimpleDateFormat sdf2 = new SimpleDateFormat("MM-dd");
			result = sdf2.format(new Date());
			break;
		default:
			SimpleDateFormat sdf_def = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			result = sdf_def.format(new Date());
		}		
		return result;
	}

}
