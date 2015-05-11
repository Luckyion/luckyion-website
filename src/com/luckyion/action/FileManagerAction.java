package com.luckyion.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.luckyion.pojo.Files;
import com.luckyion.service.FileManagerService;
import com.luckyion.util.FileUtils;
import com.luckyion.util.MyLogger;
import com.opensymphony.xwork2.ActionSupport;

public class FileManagerAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6343405952374504569L;
	
	private final String TAG = "FileManagerAction";
	
	private FileManagerService fileManagerService;
	private Files files;
	private List<Files> listFiles;
	private Map<String, Object> responseJson;
	
	/**
	 * 文件下载路径
	 */
	private String inputPath;
	/**
	 * 文件上传
	 */
	private File imgFile;//封装上传文件的属性
	private String imgFileContentType;//封装上传文件类型的属性
	private String imgFileFileName;//封装上传文件名的属性
	private String savePath;//接收依赖注入的属性
	
	
	private String fileName;
	
	private int val;
	private long totalCounts;  //总记录数
	private long totalPages;  //总页数
	private int pagecur;  //当前页数
	private int pageSize; //每页显示多少条记录
	
	
	
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return list();
	}
	
	public String list(){
		totalCounts = fileManagerService.getTotalCounts(val, files);
		totalPages = fileManagerService.getTotalPages(totalCounts, pageSize);
		listFiles = fileManagerService.fenye(pagecur, pageSize, val, files);
		return "listFile";
	}
	
	public String updateType(){
		String fName = files.getFilename().substring(0, files.getFilename().indexOf("."));
		if(fName.indexOf("/") >= 0){
			fName = fName.substring(fName.lastIndexOf("/") + 1);
		}
		String ftype = files.getFtype();
		listFiles = fileManagerService.find("from Files f where f.filename='" + fName + "' " +
				"order by id");
		if(listFiles.size() > 0){
			files = listFiles.get(listFiles.size() - 1);
			files.setFtype(ftype);
			fileManagerService.update(files);
		}
		return list();
	}

	/**
	 * 删除文件
	 * @return
	 */
	public String deleteFile(){
		files = (Files)fileManagerService.findById(Files.class, files.getFileid());		
		fileManagerService.delete(files);
		HttpServletRequest request = ServletActionContext.getRequest();
		String delPath = request.getSession().getServletContext().getRealPath("/")
				+ files.getFilepath();
		File file = new File(delPath);
		if(file.exists()){
			file.delete();
		}
		return list();
	}
	/**
	 * 修改
	 * @return
	 */
	public String editFile(){
		return list();
	}
	
	/**�ļ��ϴ�*/
	public String fileUpload(){
		OutputStream os = null;
		InputStream is = null;
		String saveUrl = null;
		String savePath = null;
		try{
			//Create file outputStream		
			HttpServletRequest request = ServletActionContext.getRequest();
			savePath = request.getSession().getServletContext().getRealPath("/")
					+ "usersimages";
			saveUrl = request.getContextPath() + "/usersimages";
			String dirNameString = request.getParameter("dir");
			if(dirNameString == null){
				dirNameString = "image";
			}
			String tpathString = FileUtils.mkdirs(savePath, dirNameString);
			savePath = savePath + File.separator + tpathString;
			saveUrl = saveUrl + File.separator + tpathString;
			is = new FileInputStream(imgFile);
			os = new FileOutputStream(savePath + File.separator + imgFileFileName);
			byte[] buffer = new byte[1024 * 1024];
			int length = 0;
			while(-1 != (length = is.read(buffer))){
				os.write(buffer, 0, length);
			}
		}catch(IOException ioe){
			ioe.printStackTrace();
		}finally{
			close(os, is);
		}		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("error", 0);
		map.put("url", imgFileFileName);
		this.setResponseJson(map);
		if(files == null){
			files = new Files();
		}
		String sPath = null;
		sPath = saveUrl.substring(0).replace("\\", "/") + imgFileFileName;
		files.setFilename(imgFileFileName.substring(0, imgFileFileName.indexOf(".")));
		files.setFilepath(sPath);
		System.err.println(saveUrl.replace("\\", "/"));
		files.setFileformat(imgFileFileName.substring(imgFileFileName.indexOf(".") + 1));
		fileManagerService.save(files);
		return SUCCESS;
	}
	/**�ļ�����**/
	public String fileDownload(){		
		return "ok";
	}
	/**
	 * 文件下载
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public InputStream downloadFile() throws UnsupportedEncodingException{
		files = (Files) fileManagerService.findById(Files.class, files.getFileid());
		fileName = files.getFilename();
		System.out.println("fileName" + fileName);
		return ServletActionContext.getServletContext().getResourceAsStream(files.getFilepath() + fileName);
		
	}
	
	private void close(OutputStream fos, InputStream fis) {
		// TODO Auto-generated method stub
		if(fis != null){
			try {
				fis.close();
			} catch (IOException e) {
				// TODO: handle exception
				MyLogger.testLog(TAG, "closing file input stream fail.");
				e.printStackTrace();
			}
		}
		if(fos != null){
			try {
				fos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				MyLogger.testLog(TAG, "closing file output stream fail.");
				e.printStackTrace();
			}
		}
	}
	public String getInputPath() {
		return inputPath;
	}
	public void setInputPath(String inputPath) {
		this.inputPath = inputPath;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public FileManagerService getFileManagerService() {
		return fileManagerService;
	}

	public void setFileManagerService(FileManagerService fileManagerService) {
		this.fileManagerService = fileManagerService;
	}

	public Files getFiles() {
		return files;
	}

	public void setFiles(Files files) {
		this.files = files;
	}

	public List<Files> getListFiles() {
		return listFiles;
	}

	public void setListFiles(List<Files> listFiles) {
		this.listFiles = listFiles;
	}

	public String getImgFileFileName() {
		return imgFileFileName;
	}

	public void setImgFileFileName(String imgFileFileName) {
		this.imgFileFileName = imgFileFileName;
	}

	public File getImgFile() {
		return imgFile;
	}

	public void setImgFile(File imgFile) {
		this.imgFile = imgFile;
	}

	public String getImgFileContentType() {
		return imgFileContentType;
	}

	public void setImgFileContentType(String imgFileContentType) {
		this.imgFileContentType = imgFileContentType;
	}

	public Map<String, Object> getResponseJson() {
		return responseJson;
	}

	public void setResponseJson(Map<String, Object> responseJson) {
		this.responseJson = responseJson;
	}

	public long getTotalCounts() {
		return totalCounts;
	}

	public void setTotalCounts(long totalCounts) {
		this.totalCounts = totalCounts;
	}

	public long getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(long totalPages) {
		this.totalPages = totalPages;
	}

	public int getPagecur() {
		return pagecur;
	}

	public void setPagecur(int pagecur) {
		this.pagecur = pagecur;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getVal() {
		return val;
	}

	public void setVal(int val) {
		this.val = val;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
