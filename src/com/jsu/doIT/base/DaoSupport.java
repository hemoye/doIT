package com.jsu.doIT.base;

import java.util.List;

import com.jsu.doIT.pageBase.PageBean;
import com.jsu.doIT.pageBase.QueryHelper;

/**
 * DAO接口
 * @author hadoop
 * 
 * @param <T> 实体对象
 */
public interface DaoSupport<T> {

	/**
	 * 保存实体
	 * 
	 * @param entity
	 */
	public void save(T entity);

	/**
	 * 删除实体
	 * 
	 * @param entity
	 */
	public void delete(T entity);

	/**
	 * 更新实体
	 * 
	 * @param entity
	 */
	public void update(T entity);

	/**
	 * 按id查询
	 * 
	 * @param id
	 * @return T的实体
	 */
	public T findById(Integer id);

	/**
	 * 按id查询
	 * 
	 * @param ids
	 * @return T实体的集合
	 */
	public List<T> findByIds(Integer[] ids);

	/**
	 * 根据某一个属性来查找
	 * 
	 * @param propertyName
	 * @param value
	 * @return T实体的集合
	 */
	public List<T> findByProperty(String propertyName, Object value);

	/**
	 * 根据hql获取持久化对象
	 * @param hql
	 * @return
	 */
	T get(String hql,Object...params);

	
	/**
	 * 查询所有
	 * 
	 * @return T实体的集合
	 */
	public List<T> findAll();

	/**
	 * 公共的查询分页信息的方法
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @param queryHelper
	 * HQL语句与参数列表
	 * @return
	 */
	public PageBean getPageBean(int pageNum, int pageSize, QueryHelper queryHelper);

}
