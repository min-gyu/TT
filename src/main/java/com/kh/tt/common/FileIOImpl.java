package com.kh.tt.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileIOImpl implements FileIO{
	
	private Logger logger = Logger.getLogger(getClass());
	private final String projectPath  = System.getProperty("user.dir");
	private final String absoultePath = projectPath + "\\src\\main\\webapp";	
	
	@Override
	public StringBuilder read(String fileName) {
		
		String filePath = absoultePath + "\\WEB-INF\\views\\common\\email";
		StringBuilder sb = new StringBuilder();
		
		logger.info("absoultePath ->" + absoultePath);
		logger.info("filePath ->" + filePath);
		logger.info("fileName ->" + fileName);
        File inFile = new File(filePath, fileName);
        BufferedReader br = null;
        
        try {
            br = new BufferedReader(new FileReader(inFile));
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(br != null) try {br.close(); } catch (IOException e) {}
        }
		return sb;
	}


	@Override
	public Map<String, Object> save(MultipartFile file) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String url                   = "/resources/upload";
		String realPath    			 = absoultePath + "\\resources\\upload";

		logger.info("file save sta ************************************");
		if(file != null){
			String realFileName 			  = UUID.randomUUID() + file.getOriginalFilename();
	        String fileNm 					  = file.getOriginalFilename();
	        String filePath					  = url + "/" + realFileName;
	        
	        File fileUploadDir = new File(realPath);

	        logger.info("file creat");
	        
	        if(!fileUploadDir.exists()) {
	        	fileUploadDir.mkdirs();
	        }
	        File fileUpload = new File(realPath + "/" + realFileName);
	    	file.transferTo(fileUpload);
        
	    	
	    	resultMap.put("file", file);
	    	resultMap.put("fileName", fileNm);
	    	resultMap.put("filePath", filePath);

	    	logger.info(resultMap);
		}
		logger.info("file save end ************************************");
    	return resultMap;
	}


	@Override
	public boolean delete(Map<String, Object> params) throws Exception {
		String filePath = (String) params.get("FILE_PATH");
		
		if(filePath != null && filePath != "") {
			filePath = filePath.replace("/", "\\");
			filePath = absoultePath + filePath;
			
			System.out.println("filePath");
			System.out.println(filePath);
			File file = new File(filePath);
			
			 if( file.exists() ){
	            if(file.delete()){
	                System.out.println("파일삭제 성공");
	                return false;
	            }else{
	                System.out.println("파일삭제 실패");
	                return false;
	            }
			}else{
	            System.out.println("파일이 존재하지 않습니다.");
			}
		}
		return true;
	}


	@Override
	public boolean delete(String filePath) throws Exception {
		if(filePath != null && filePath != "") {
			filePath = filePath.replace("/", "\\");
			filePath = absoultePath + filePath;
			
			System.out.println("filePath");
			System.out.println(filePath);
			File file = new File(filePath);
			
			 if( file.exists() ){
	            if(file.delete()){
	                System.out.println("파일삭제 성공");
	                return false;
	            }else{
	                System.out.println("파일삭제 실패");
	                return false;
	            }
			}else{
	            System.out.println("파일이 존재하지 않습니다.");
			}
		}
		return true;
	}
}

