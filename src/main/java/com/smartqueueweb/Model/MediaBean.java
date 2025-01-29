package com.smartqueueweb.Model;

public class MediaBean {
	
	private int id;
	private String fileName;
	private String path;
	private String type;
	
	public MediaBean() {
		super();
	}

	public MediaBean(int id, String fileName, String path, String type) {
		super();
		this.id = id;
		this.fileName = fileName;
		this.path = path;
		this.type = type;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "MediaBean [id=" + id + ", fileName=" + fileName + ", path=" + path + ", type=" + type + "]";
	}
}
