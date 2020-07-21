package com.wr.utils;

public class AppException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

    private String errorCode;
    
    public AppException(String message) {
    	super(message);
    }
    
    
    public AppException(String errorCode, String msg) {
        super(msg);
        this.errorCode = errorCode;
    }

    public AppException(String errorCode, String msg, Throwable cause) {
        super(msg, cause);
        this.errorCode = errorCode;
    }

}
