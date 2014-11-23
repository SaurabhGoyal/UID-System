<%@ page import="java.util.Date,java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass middle">
	<h4>Passport application</h4>
	<hr>
<%
	String uid;
	Connection con;
	Statement stmt;
	ResultSet rs;

	Date date;
	String formattedDate = "";
	date = new Date();
	formattedDate = date.getDate() + "/" + (date.getMonth() + 1) + "/"+ (date.getYear() + 1900);

	uid = (String) session.getAttribute("uid");
	try {
		rs = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb","root","");
		stmt = con.createStatement();
		stmt.executeUpdate("insert into passporttable values(" + uid + ",'"+ formattedDate + "','Processing','0','0','0','0','0')");
		out.println("Application submitted successfully for citizen <font color=red>"+ uid);
	} catch (Exception ee) {
		out.println("Passport already applied for.");
	}
%>
</body>
</html>