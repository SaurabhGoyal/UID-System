<%@ page import="java.util.Date,java.sql.*"%>

<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass">
<h4>AAI Staff Registration</h4><hr>

<%
	int applicationno;
	String aaistaffname, location, pwd;
	Connection con;
	Statement stmt;
	ResultSet rs;
	applicationno = 1000;

	try {
		aaistaffname = request.getParameter("aaistaffname");
		location = request.getParameter("location");
		pwd = request.getParameter("pwd");
		if(aaistaffname.equals("")||location.equals("")||pwd.equals("")){
			out.println("<font color=red>all fields mandatory");
			return;
		}	
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb", "root", "");
		
		stmt = con.createStatement();
		rs = stmt.executeQuery("select max(aaistaffid) from aaitable");
		try {
			if (rs.next())
				applicationno = rs.getInt(1) + 1;
			if (applicationno == 1)
				applicationno = 1000;
		} catch (Exception ee) {
			applicationno = 1000;
			out.println(ee.getMessage());
		}
		stmt.close();
		stmt = con.createStatement();
		stmt.executeUpdate("insert into aaitable values('"+ applicationno + "','" + aaistaffname + "','" + location+ "','" + pwd + "')");
		out.println("Registration Succesfull for AAI Staff. ID Generated : <font color=red><b>"	+ applicationno);
	} catch (Exception ee) {
		out.println("Invalid Data! All fields are mandatory..."	+ ee.getMessage());
	}
%>
</body>
</html>