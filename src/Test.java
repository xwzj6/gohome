import com.zufe.bean.Lost;
import com.zufe.bean.LostPage;
import com.zufe.bean.People;
import com.zufe.bean.ProvinceInfo;
import com.zufe.bean.Team;
import com.zufe.bean.User;
import com.zufe.dao.LostDao;
import com.zufe.dao.PeopleDao;
import com.zufe.dao.ProvinceDao;
import com.zufe.dao.RecordDao;
import com.zufe.dao.TeamDao;
import com.zufe.dao.UserDao;
import com.zufe.util.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Test {

	/**
	 * @param args
	 * @throws SQLException
	 */
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		/*
		 * ProvinceDao provinceDao=new ProvinceDao(); ProvinceInfo
		 * provinceInfo=new ProvinceInfo();
		 * provinceInfo=provinceDao.getProvinceInfoByProvinceId(5);
		 * System.out.println("Admin:"+provinceInfo.getAdmin());
		 * System.out.println("Lost:"+provinceInfo.getLost());
		 * System.out.println("LostFound:"+provinceInfo.getLostFound());
		 * System.out.println("Men:"+provinceInfo.getMen());
		 * System.out.println("Women:"+provinceInfo.getWomen());
		 * System.out.println("Team:"+provinceInfo.getTeam()); /* for(int
		 * i=1;i<35;i++){
		 * System.out.println(provinceDao.getProvinceNameById(i)+":"+
		 * provinceDao.getUserNumbyProvinceId(i)); }
		 */
		/*
		 * User user=new User(); UserDao userDao=new UserDao();
		 * user=userDao.getUserById("100003"); user.setUserSex("ÄÐ");
		 * userDao.changeUserInfo(user);
		 */
		/*
		 * Team team=new Team(); TeamDao teamDao=new TeamDao(); for(int
		 * i=0;i<35;i++){ team=teamDao.getTeamByTeamId(i);
		 * team.setTeamTaskHour(0); teamDao.updateTeam(team); }
		 */
		/*
		 * People people=new People(); PeopleDao peopleDao=new PeopleDao();
		 * people=peopleDao.getPeopleByPeopleId(1004); people.setPeopleSex("ÄÐ");
		 * peopleDao.updatePeople(people);
		 */
		/*
		 * List<Lost> lostList=new ArrayList<Lost>(); LostDao lostDao=new
		 * LostDao(); LostPage lostPage=new LostPage(); int isCheck=1; int
		 * pageNo=1; int provinceId=0; String key="1"; lostPage.setPageNo(1);
		 * lostList=lostPage.getPageData(isCheck,key,provinceId);
		 * 
		 * PeopleDao peopleDao=new PeopleDao(); for(Lost l:lostList){ People
		 * p=new People(); p=peopleDao.getPeopleByPeopleId(l.getPeopleId());
		 * System.out.println("peopleName:"+p.getPeopleName()); }
		 */
		RecordDao recordDao=new RecordDao();
		List<User> userList=new ArrayList<User>();
		userList=recordDao.getNUser(8);
		for(User u:userList){
			System.out.println(u.getUserId()+" "+u.getUserName()+" "+recordDao.getRecordCount(u.getUserId()));
		}
	}

}
