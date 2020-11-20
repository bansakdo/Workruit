package Practice;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class aaa {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		


		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String aa = "2019-12-12";
		Date da;
		try {
			da = dateFormat.parse(aa);
			System.out.print(da);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
