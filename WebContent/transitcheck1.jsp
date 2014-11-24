<%@ page import="java.sql.*"%>
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
	String aaistaffid;
	Connection con;
	Statement stmt;
	ResultSet rs;
	aaistaffid = (String) session.getAttribute("loginid");

	try {
		rs = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb","root","");
		stmt = con.createStatement();

		out.println("<form method=post action=transitcheck2.jsp>");
		rs = stmt.executeQuery("select uid from passporttable where status='Despatched'");
		out.println("<form method=post action=transitcheck2.jsp>");
		out.println("Citizen ID : <select name=uid>");
		while (rs.next()) {
			out.println("<option>" + rs.getString(1) + "</option>");
		}
		out.println("</select><br><br><button type='submit' class='btn btn-primary'>Check</button></FORM>");
	} catch (Exception ee) {
		out.println(ee.getMessage());
	}
%>
</body>
</html>