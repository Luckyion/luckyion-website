package com.luckyion.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class FileUtils {

public static String createNewFileName(String fileName) {

	String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1)
			.toLowerCase();
	SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	String newFileName = df.format(new Date()) + "_"
			+ new Random().nextInt(1000) + "." + fileExt;
	System.out.println(newFileName);
	return newFileName;
}

public static String mkdirs(String basePath,String dirName) {

	basePath = basePath + File.separator + dirName + File.separator;
	File saveDirFile = new File(basePath);
	if (!saveDirFile.exists()) {
		saveDirFile.mkdirs();
	}

	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	String ymd = sdf.format(new Date());
	basePath = basePath + File.separator + ymd + File.separator;
	File dirFile = new File(basePath);
	if (!dirFile.exists()) {
		dirFile.mkdirs();
	}
	return dirName + File.separator + ymd + File.separator;
	}

}