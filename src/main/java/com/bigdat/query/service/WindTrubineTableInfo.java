package com.bigdat.query.service;

import java.util.Set;

/**
 * 风机表信息接口
 * @author huxuhao
 *
 */
public interface WindTrubineTableInfo {
	
	/**
	 * 获取风机表 表头
	 * @param farmCode
	 * @return
	 */
	Set<String> getHeader(String farmCode);
}
