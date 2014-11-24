<%@ page import="java.util.Date,java.sql.*"%>
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
<h4>PS Staff Registration</h4><hr>

<%
	int applicationno;
	String psstaffname, location, pwd;
	Connection con;
	Statement stmt;
	ResultSet rs;
	applicationno = 1000;

	Date date;
	String formattedDate = "";
	date = new Date();
	formattedDate = date.getDate() + "/" + (date.getMonth() + 1) + "/"+ (date.getYear() + 1900);

	try {
		psstaffname = request.getParameter("psstaffname");
		location = request.getParameter("location");
		pwd = request.getParameter("pwd");
		if(psstaffname.equals("")||location.equals("")||pwd.equals("")){
			out.println("<font color=red>all fields mandatory");
			return;
		}	
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb", "root", "");

		stmt = con.createStatement();
		rs = stmt.executeQuery("select max(psstaffid) from psstafftable");
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
		stmt.executeUpdate("insert into psstafftable values("+ applicationno + ",'" + psstaffname + "','" + location	+ "','" + formattedDate + "','" + pwd + "')");
		out.println("Registration Succesfull for PS Staff. ID Generated : <font color=red><b>"	+ applicationno);
	} catch (Exception ee) {
		out.println(ee.getMessage());
	}
%>
</body>
</html>