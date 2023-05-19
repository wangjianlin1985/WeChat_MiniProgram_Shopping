package com.yun.smart.param;

import com.yun.smart.utils.JsonUtils;
import com.yun.smart.base.PageParams;
import org.springframework.beans.BeanUtils;
import com.yun.smart.model.DicInfo;

/**
 * 查询参数类 - DicInfoSearchParams
 * 
 * @author qihh
 * @version 0.0.1
 */
public class DicInfoSearchParams extends PageParams{

	private static final long serialVersionUID = 6634980878038003712L;

	/** 父节点ID  默认0 */
	private Long parentId;
		
	/** 字典名词 */
	private String dicName;
		
	/** 字典值 */
	private String dicValue;
		
	/** 字典词 */
	private String dicText;
		
	/** @return 父节点ID  默认0 */
	public Long getParentId() {
		return parentId;
	}

	/** @param parentId 父节点ID  默认0 */
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
		
	/** @return 字典名词 */
	public String getDicName() {
		return dicName;
	}

	/** @param dicName 字典名词 */
	public void setDicName(String dicName) {
		this.dicName = dicName;
	}
		
	/** @return 字典值 */
	public String getDicValue() {
		return dicValue;
	}

	/** @param dicValue 字典值 */
	public void setDicValue(String dicValue) {
		this.dicValue = dicValue;
	}
		
	/** @return 字典词 */
	public String getDicText() {
		return dicText;
	}

	/** @param dicText 字典词 */
	public void setDicText(String dicText) {
		this.dicText = dicText;
	}
		
	
	/**
	 * 将请求参数转换成实体映射类，用作逻辑处理和查询参数类
	 * @return DicInfo
	 */
	public DicInfo toEntity() {
		DicInfo dicInfo = new DicInfo();
		BeanUtils.copyProperties(this, dicInfo);
		
		return dicInfo;
	}
	
	@Override
	public String toString() {
		return JsonUtils.toJson(this);
	}
	
}