package cn.tedu.mgsystem.common.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import cn.tedu.mgsystem.common.web.JsonResult;

@ControllerAdvice
public class ControllerExceptionHandler {
	@ExceptionHandler(ServiceException.class)
	public JsonResult handleServiceException(ServiceException e) {
		e.printStackTrace();
		//将异常封装到JsonResult
		return new JsonResult(e);
	}
}
