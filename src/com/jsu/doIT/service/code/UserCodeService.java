package com.jsu.doIT.service.code;

import com.jsu.doIT.base.DaoSupport;
import com.jsu.doIT.pageBase.PageBean;
import com.jsu.doIT.po.Usercode;

public interface UserCodeService extends DaoSupport<Usercode> {
	/**
	 * 根据用户Id查找用户代码
	 * 
	 * @param userId
	 *            用户Id
	 * @param currentPage
	 *            当前页
	 * @param PageSize
	 *            页面最大记录数
	 * @return 一个分页对象
	 */
	public PageBean findCodeByUserId(Integer userId, Integer currentPage,
			Integer PageSize);
}
