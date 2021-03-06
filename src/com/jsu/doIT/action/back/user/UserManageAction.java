package com.jsu.doIT.action.back.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jsu.doIT.base.MyActionSupport;
import com.jsu.doIT.pageBase.PageBean;
import com.jsu.doIT.po.User;
import com.jsu.doIT.po.Userinfo;
import com.jsu.doIT.po.Useroffice;
import com.jsu.doIT.utils.JSONSupport;
import com.jsu.doIT.utils.converter.DateConvert;
import com.jsu.doIT.vo.UserVO;
import com.jsu.doIT.vo.UserinfoVO;

@Controller
@Scope("prototype")
public class UserManageAction extends MyActionSupport<User> {

	private static final long serialVersionUID = 1959130079690813667L;

	private PageBean userPage;
	private Date begin;
	private Date end;
	private Integer currentPage;
	
	public void setBegin(Date begin) {
		this.begin = begin;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public String UI() {
		return "UI";
	}

	public String detail() {
		model = userService.findById(model.getUserId());
		return "detail";
	}

	@SuppressWarnings("unchecked")
	public String getData() {
		try {
			userPage = userService.findPage(currentPage, 10, begin, end, model.getUserName(), model.getStatus());

			List<User> users = (List<User>) userPage.getRecordList();
			List<UserVO> userVOs = new ArrayList<UserVO>();

			for (User user : users) {
				userVOs.add(PO2VO(user));
			}
			userPage.setRecordList(userVOs);
			JSONprint(JSONSupport.json(userPage));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public UserVO PO2VO(User user) {
		UserVO userVO = new UserVO();
		try {
			BeanUtils.copyProperties(userVO, user);
			Userinfo userinfo = user.getUserinfo();
			String userStatus = "未激活";
			if (user.getStatus() == 1) {
				userStatus = "已激活";
			} else if (user.getStatus() > 1) {
				userStatus = "被冻结";
			}
			String userName = userVO.getUserName();
			if (userName.contains(model.getUserName())) {
				userName = userName.replace(model.getUserName(), "<span style='color: #0099FF'>" + model.getUserName()
						+ "</span>");
			}
			userVO.setUserName(userName);
			userVO.setUserStatus(userStatus);
			UserinfoVO userinfoVO = new UserinfoVO();
			BeanUtils.copyProperties(userinfoVO, userinfo);
			userinfoVO.setUserregistTime(DateConvert.datetoString(userinfo.getRegistTime()));
			Useroffice useroffice = userinfo.getUseroffice();
			if (useroffice != null) {
				userinfoVO.setOfficeName(useroffice.getOfficeName());
			} else {
				userinfoVO.setOfficeName("暂无");
			}
			userVO.setUserinfoVO(userinfoVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userVO;
	}
}
