<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrapValidator.min.css"/>
<link rel="stylesheet" href="css/font-awesome.min.css"/>
<link rel="stylesheet" href="css/mystyle.css">
<script type="text/javascript" src="scripts/jquery.min.js" ></script>
<script type="text/javascript" src="scripts/bootstrap.min.js" ></script>
<script type="text/javascript" src="scripts/bootstrapValidator.min.js" ></script>
<script type="text/javascript" src="scripts/myscript.js"></script>
</head>
<body class="paddedClass">
<h4>Transit Status Check</h4><hr>
<%
	String uid;
	Connection con;
	Statement stmt;
	ResultSet rs,rs2;
	String passportno, issuedate, expirydate, issuingauthority, cname,address, dob, fathername, contactno, gender, photo;
	java.util.Date date=new java.util.Date();
	String formattedDate = "";
	formattedDate = date.getDate() + "/" + (date.getMonth() + 1) + "/"+ (date.getYear() + 1900);

	uid = request.getParameter("uid");
	passportno = "";
	try {
		rs = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb","root","");
		stmt = con.createStatement();
		rs = stmt.executeQuery("select passportno from passporttable where uid='" + uid	+ "'");
		if (rs.next()) {
			passportno = rs.getString(1);
		}
		rs.close();
		
		String location = "";
		String aaistaffid = (String) session.getAttribute("loginid");
		rs = stmt.executeQuery("select location from aaitable where aaistaffid='" + aaistaffid	+ "'");
		if (rs.next()) {
			location = rs.getString(1);
		}
		rs.close();

		rs = stmt.executeQuery("select * from transittable where uid="+ uid);
		if (rs.next()) {
			out.println("<font color=red>Stop " + uid + "! not-allowed to travel. ");
			stmt.executeUpdate("insert into travelrecordstable values(" + uid + ",'" + passportno + "','Stopped','" + formattedDate+ "','" + location + "')");
		} 
		else {
			rs2 = stmt.executeQuery("select * from travelrecordstable where uid="+ uid+" and status='Stopped'");
			if (rs2.next())
				out.println("<font color=red>" + uid + " has been stopped earlier, Check ID.");
			else {
				out.println("<font color=green>" + uid + " has clean record, Allowed to transit.");
				stmt.executeUpdate("insert into travelrecordstable values(" + uid+ ",'" + passportno + "','Allowed','"+ formattedDate + "','" + location + "')");
			}
		}

	} catch (Exception ex) {
		out.println(ex.getMessage());
	}
%>
</body>
</html>