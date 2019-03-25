import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.team.app.utils.DateUtil;

public class test6 {
		
	public static Date convertToDayAndHour(String id) throws ParseException{
		int hrs=Integer.parseInt(id);
		int day = hrs / 24;
		int hrscompltd = day * 24;
		int dayhr = hrs - hrscompltd;
		
			day += 1;
		String hrmm="";	
			
			/*if (dayhr == 23 ) {
				System.out.println("IN if day"+dayhr);
				hrmm = ":59:59";
			}else {
				System.out.println("IN else day"+dayhr);
				hrmm = ":00:00";
			}*/
		
				
		if (hrs == 23  
				|| hrs == 47|| hrs == 71|| hrs == 95|| hrs == 119|| hrs == 143
				|| hrs == 167|| hrs == 191|| hrs == 215|| hrs == 239|| hrs == 263
				|| hrs == 287|| hrs == 311| hrs == 335|| hrs == 359|| hrs == 383
				|| hrs == 407|| hrs == 431|| hrs == 455|| hrs == 479|| hrs == 503
				|| hrs == 527|| hrs == 551|| hrs == 575|| hrs == 599|| hrs == 623
				|| hrs == 647|| hrs == 671|| hrs == 695|| hrs == 719|| hrs == 743) {

			hrmm = ":59:59";
		} else {
			hrmm = ":00:00";
			dayhr+=1;
			
		}

		

		System.out.println("day" + day);

		Date today = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(today);
		int month = 0;
		int year = cal.get(Calendar.YEAR);

		if (hrs > 360 && day <= 6) {

			month = cal.get(Calendar.MONTH);
		} else {

			month = cal.get(Calendar.MONTH) + 1;
		}

		
		
		
		String getdate = year+"-"+month+"-"+day;

		String startDate = getdate + " " + dayhr + hrmm;
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
				
		java.util.Date date = sdf1.parse(startDate);
		System.out.println("utilDate " + date);
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());

		System.out.println("sqlDate " + sqlDate);

		return sqlDate;

	}
	
	
	public static void main(String[] args) throws ParseException {
	 
		System.out.println("Date as "+DateUtil.changeDateFromat(test6.convertToDayAndHour("40")));
			
	}
		
		
	
}
