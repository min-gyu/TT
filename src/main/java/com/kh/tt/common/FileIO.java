package com.kh.tt.common;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface FileIO {

	public abstract StringBuilder read(String type);
	public abstract Map<String, Object> save(MultipartFile file) throws Exception;
	public abstract boolean delete(Map<String, Object> params) throws Exception;
	public abstract boolean delete(String filePath) throws Exception;
}
