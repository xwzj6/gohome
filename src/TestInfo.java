import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.zufe.bean.Lost;
import com.zufe.bean.LostPage;
import com.zufe.bean.People;
import com.zufe.bean.ProvinceInfo;
import com.zufe.bean.RecordPage;
import com.zufe.bean.Team;
import com.zufe.bean.User;
import com.zufe.bean.UserPage;
import com.zufe.dao.LostDao;
import com.zufe.dao.PeopleDao;
import com.zufe.dao.ProvinceDao;
import com.zufe.dao.RecordDao;
import com.zufe.dao.TeamDao;
import com.zufe.dao.UserDao;
import com.zufe.util.DBUtil;

public class TestInfo {

	static String getWechat(){
		Random random=new Random();
		String str=""+(char)((int)'a'+random.nextInt(26));
		for(int i=1;i<10;i++){
			str=str+ (char)((int)'a'+random.nextInt(26));
		}
		return str;
	}
	static String getgname(){
		Random random=new Random();
		int rand=random.nextInt(glen);
		String str=girlName.substring(rand,rand+1);;
		rand=random.nextInt(glen);
		str=str+girlName.substring(rand,rand+1);
		return str;
	}
	static String getbname(){
		Random random=new Random();
		int rand=random.nextInt(blen);
		String str=boyName.substring(rand,rand+1);
		random=new Random();
		rand=random.nextInt(blen);
		str=str+boyName.substring(rand,rand+1);
		return str;
	}
	
	//�Զ��������֣����ģ�
	 static String girlName = "���Ӣ���������Ⱦ���������֥��Ƽ�����ҷ���ʴ��������÷���������滷ѩ�ٰ���ϼ����ݺ�����𷲼Ѽ�������������Ҷ�������������ɺɯ������ٻ�������ӱ¶������������Ǻɵ���ü������ޱݼ���Է�ܰ�������԰��ӽ�������ع���ѱ�ˬ������ϣ����Ʈ�����������������������ܿ�ƺ������˿ɼ���Ӱ��֦˼��";
	 static String boyName = "ΰ�����㿡��ǿ��ƽ�����Ļ�������������־��������ɽ�ʲ���������Ԫȫ��ʤѧ��ŷ���������ɱ�˳���ӽ��β��ɿ��ǹ���ﰲ����ï�����м�ͱ벩���Ⱦ�����׳��˼Ⱥ���İ�����ܹ����ƺ���������ԣ���ܽ���������ǫ�����֮�ֺ��ʲ����������������ά�������������󳿳�ʿ�Խ��������׵���ʱ̩ʢ��衾��ڲ�����ŷ纽��";
	 
	 static int blen=boyName.length();
	 static int glen=girlName.length();
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
//		 //��Ӷ���
//		 Team team = new Team();
//		 ProvinceDao provinceDao = new ProvinceDao();
//		 TeamDao teamDao = new TeamDao();
//		 System.out.println(provinceDao.getProvinceNameById(1));
//		 for (int i = 1; i <= 34; i++) {
//			 String provinceName = provinceDao.getProvinceNameById(i);
//			 team.setTeamId(i);
//			 team.setTeamLeader(null);
//			 team.setTeamProvince(provinceName);
//			 team.setTeamName(provinceName + "1��");
//			 teamDao.addTeam(team);
//		 }
//		 for (int i = 1; i <= 34; i++) {
//			 String provinceName = provinceDao.getProvinceNameById(i);
//			 team.setTeamId(i+34);
//			 team.setTeamLeader(null);
//			 team.setTeamProvince(provinceName);
//			 team.setTeamName(provinceName + "2��");
//			 teamDao.addTeam(team);
//			}
//		
//		 // ��Ӷ�Ա
//		 User user = new User();
//		 UserDao userDao = new UserDao();
//		 for (int i = 1; i < 10; i++) {
//			 if(i%2==0)user.setUserName("��" + getbname());
//			 else user.setUserName("��" + getgname());
//			 
//				 user.setUserState("����Ա");
//			 
//			 user.setUserPass("123456");
//			 user.setUserAge(20);
//			 user.setUserSex((i % 2 == 0) ? "��" : "Ů");
//			 user.setUserPhone("1831101000"+i);
//			 user.setUserWechat(getWechat());
//			 userDao.addUser(user);
//			 System.out.println("userId" + user.getUserId() + ",userName"
//			 + user.getUserName());
//		 }
//		 for (int i = 1; i < 1000; i++) {
//			 if(i%2==0)user.setUserName("��" + getbname());
//			 else user.setUserName("��" + getgname());
//			 
//				 user.setUserState("־Ը��");
//			 
//			 user.setUserPass("123456");
//			 user.setTeamId(i % 68 + 1);
//			 user.setUserAge(20);
//			 user.setUserSex((i % 2 == 0) ? "��" : "Ů");
//			 user.setUserPhone("1831101"+(1000+i));
//			 user.setUserWechat(getWechat());
//			 userDao.addUser(user);
//		 }
		

		
//		  // ���ʧ���˿� 
//		People people = new People();
//		PeopleDao peopleDao = new PeopleDao();
//		String edu[] = { "��������", "����", "ר��", "����", "����", "Сѧ", "Сѧ����" };
//		for (int i = 1; i <= 1000; i++) {
//			
//			if (i % 2 == 0){
//				people.setPeopleName("��" + getbname());
//				people.setPeopleSex("��");
//			}else{
//				people.setPeopleName("��" + getgname());
//				people.setPeopleSex("Ů");
//			}
//			Date date = new Date((i % 5 + 4) * 10, 3, 2);
//			people.setPeopleBirth(date); // people.setPeopleHometown("");
//			people.setPeopleHeight(170);
//			people.setPeopleEducation(edu[i % 7]);
//			// people.setPeopleHealth(); // people.setPeopleFigure(); //
//			people.setPeoplePhoto("oldman,jpg");
//			if(i<800)people.setIsLost(0);
//			else people.setIsLost(1);
//			people.setProvinceId(i % 34 + 1);
//			peopleDao.addPeople(people);
//		}

		
		  //���ʧ�ټ�¼
		Lost lost = new Lost();
		LostDao lostDao = new LostDao();
		PeopleDao peopleDao = new PeopleDao();
		for (int i = 1; i < 4000; i++) {
			int peopleId=i%800+2004;
			lost.setPeopleId(peopleId);
			lost.setLostAddr("����");
			Random random = new Random();
			lost.setLostTime(new Time(random.nextInt(24), 20, 20));

			lost.setLostDate(new Date(118 + random.nextInt(3), random
					.nextInt(12) + 1, 7));
			lost.setLostDescription("��");
			lost.setRelativesPhone("��");
			lost.setRelativesName("��" + getbname());
			lost.setRelativesSex("��");
			lost.setRelativesRelationship("����");
lost.setRelativesPhone("1831105"+(1000+i));
			 
				lost.setIsFind(1);
				lost.setFinishHour(random.nextInt(72) + 1);
				lost.setIsCheck(1);
			
			lost.setProvinceId(peopleDao.getPeopleByPeopleId(peopleId).getProvinceId());
			lostDao.addLost(lost);
		}
		for (int i = 1; i < 2000; i++) {
			int peopleId=2804+i%200;
			lost.setPeopleId(peopleId);
			lost.setLostAddr("����");
			Random random = new Random();
			lost.setLostTime(new Time(random.nextInt(24), 20, 20));

			lost.setLostDate(new Date(115 + random.nextInt(3), random
					.nextInt(12) + 1, 7));
			lost.setLostDescription("��");
			lost.setRelativesPhone("��");
			lost.setRelativesName("��" + getbname());
			lost.setRelativesSex("��");
			lost.setRelativesRelationship("����");
			lost.setRelativesPhone("1831106"+(1000+i));
				lost.setIsFind(1);
				lost.setFinishHour(random.nextInt(10));
				lost.setIsCheck(1);
			lost.setProvinceId(peopleDao.getPeopleByPeopleId(peopleId).getProvinceId());
			lostDao.addLost(lost);
		}
		for (int i = 1; i < 200; i++) {
			int peopleId=2804+i%200;
			lost.setPeopleId(peopleId);
			lost.setLostAddr("����");
			Random random = new Random();
			lost.setLostTime(new Time(random.nextInt(24), 20, 20));
			lost.setLostDate(new Date(118 + random.nextInt(3), random.nextInt(12) + 1, 7));
			lost.setLostDescription("��");
			lost.setRelativesPhone("��");
			lost.setRelativesName("��" + getbname());
			lost.setRelativesSex("��");
			lost.setRelativesRelationship("����");
			lost.setRelativesPhone("1831107"+(1000+i));
			int state = random.nextInt(2);
			if (state == 0) {
				lost.setIsFind(0);
				lost.setFinishHour(0);
				lost.setIsCheck(1);
			}
			if (state == 1) {
				lost.setIsFind(0);
				lost.setFinishHour(0);
				lost.setIsCheck(0);
			}
			lost.setProvinceId(peopleDao.getPeopleByPeopleId(peopleId)
					.getProvinceId());
			lostDao.addLost(lost);
		}
		/*
		 * ProvinceInfo provinceInfo=new ProvinceInfo(); ProvinceDao
		 * provinceDao=new ProvinceDao();
		 * provinceInfo=provinceDao.getProvinceInfoByProvinceId(5);
		 * System.out.println(provinceInfo.getLost_Men());
		 * System.out.println(provinceInfo.getLost_Women());
		 * 
		 * System.out.println(provinceInfo.getLost());
		 * System.out.println(provinceInfo.getTeam());
		 */
		/*
		 * // ����ʧ��״̬ Connection conn = DBUtil.getConnection(); Statement stmt =
		 * null; ResultSet rs = null; String sql =
		 * "update people set is_lost=0"; try{ stmt = conn.createStatement();
		 * stmt.executeUpdate(sql); }catch(Exception e) { e.printStackTrace();
		 * }finally{ DBUtil.ColseJDBC(rs, stmt, conn); }
		 * 
		 * System.out.print("�������");
		 */
		/*
		 * User user=new User(); user.setUserId("000002"); UserDao userDao=new
		 * UserDao();
		 * if(userDao.deleteUser(user)==true)System.out.print("�������"); else
		 * System.out.print("����ʧ��");
		 */

	}
}
