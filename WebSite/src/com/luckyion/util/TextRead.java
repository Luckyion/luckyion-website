package com.luckyion.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.util.ArrayList;
import java.util.List;

public class TextRead {
	private String fileName;

    public TextRead(String filepath, String fileName)
    {
    	this.fileName = filepath + fileName;
    	System.out.println(fileName);
    	File filep = new File(filepath);
    	if(!filep.exists()){
    		filep.mkdirs();
    	}
    	File fl=new File(this.fileName);
    	if(!fl.exists())
    	{
    		try {
				fl.createNewFile();
				System.out.println("create");
			} catch (IOException e) {
			}
    	}
    }
    

     public List<String> readText() {
    	 List<String> txtList = new ArrayList<String>();
    	 String str;
    	 FileReader fr = null;
		try {
			fr = new FileReader(fileName);
			BufferedReader bfr =new BufferedReader(fr);
	         try {
				while((str = bfr.readLine()) != null){
					txtList.add(str);
					System.out.println(str);
				}
	         } catch (IOException e) {
				e.printStackTrace();
			}
	         fr.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	return txtList;
}
     

     public void writeText(String text)
     {
        try {
        	BufferedWriter bufferedWriter =  new BufferedWriter(new FileWriter(fileName, true)); 
        	bufferedWriter.write(text + "\r\n"); 
        	bufferedWriter.flush(); 
        	bufferedWriter.close(); 
   	   }catch (FileNotFoundException e1) {
   		   e1.printStackTrace();
   	   }catch (IOException e) {
   		   e.printStackTrace();
   	   }
     }
     
     
     /**

   ����* ��ini�����ļ��ж�ȡ�ַ������ֵ

   ����* @param section Ҫ��ȡ�ı������ڶ����

   ����* @param variable Ҫ��ȡ�ı������

   ����* @param defaultValue ������Ʋ�����ʱ��Ĭ��ֵ

   ����* @return �������ַ���ֵ

   ����*/
      public String getKeyValue(String key) {

       BufferedReader bufferedReader = null;
       String strLine = "";
       try {
 		bufferedReader = new BufferedReader(new FileReader(fileName)); 
 		while ((strLine = bufferedReader.readLine()) != null) {

 		    	String[] str=strLine.split("=");
 		        if(str.length>=2)
 		    		 {
 		    			if(str[0].equals(key))
 		    			{
 		    				bufferedReader.close();
 		    				return str[1].toString();
 		    			}
 		    		 }
 		    	 }
 	   }catch (FileNotFoundException e1) {
 		   e1.printStackTrace();
 	   }catch (IOException e) { 
 		   e.printStackTrace();
 	   }
 	   try {
 		bufferedReader.close();
 	} catch (IOException e) {
 		e.printStackTrace();
 	}
 	return "";
 }
      
      
      /** 
       * �޸�ini�����ļ��б�����ֵ 
       * @param key Ҫ�޸ĵı������ 
       * @param value ��������ֵ 
       */ 
       public void setKeyValue(String key, String value){ 
      	 
           BufferedReader bufferedReader = null;
           String FileLine="";
           String strLine="";
          try {
     		bufferedReader = new BufferedReader(new FileReader(fileName)); 
     		while ((strLine = bufferedReader.readLine()) != null) {

     		    	String[] str=strLine.split("=");
     		        if(str.length>=2||strLine.indexOf("=")>1)
     		    		 {
     		    			if(str[0].equals(key))
     		    			{
     		    				 strLine=str[0]+"="+value;
     		    			}
     		    		 }
     		          FileLine+=strLine+"\n";
     		    	 }
     		bufferedReader.close();
     		BufferedWriter bufferedWriter =  new BufferedWriter(new FileWriter(fileName, false)); 
     		File file = new File(fileName);
     		RandomAccessFile raf = new RandomAccessFile(file, "rw");
     		FileChannel fc = raf.getChannel();
     		FileLock fl = null;
     		while(true){
     			try{
     				fl = fc.tryLock();
     				break;
     			}catch(Exception e){
     				System.out.println("�������߳����ڲ������ļ�����ǰ�߳�����500����");
     				try {
  					Thread.sleep(500);
  				} catch (InterruptedException e1) {
  					// TODO Auto-generated catch block
  					e1.printStackTrace();
  				}
     			}
     		}
          bufferedWriter.write(FileLine); 
          fl.release();
          bufferedWriter.flush(); 
          bufferedWriter.close(); 
     	   }catch (FileNotFoundException e1) {
     		   
     	   }catch (IOException e) { 
     		   
     	   }

       } 

}
