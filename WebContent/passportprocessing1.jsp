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
<h4>Passport Processing</h4><hr>

<%
	String stationid, stationpincode;
	Connection con;
	Statement stmt;
	ResultSet rs;

	stationid = (String) session.getAttribute("loginid");

	try {
		rs = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb", "root", "");
		stmt = con.createStatement();
		rs = stmt.executeQuery("select pincode from trcontroltable where stationid='"+ stationid + "'");

		if (rs.next()) {
			stationpincode = rs.getString(1);
			rs.close();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select pincode,uid from citizentable where uid in (select uid from passporttable where status='Processing')");
			out.println("<form method=post action=passportprocessing2.jsp>");
			out.println("Citizen ID : <select name=uid>");
			while (rs.next()) {
				String citizenpincode = rs.getString(1);
				if (stationpincode.equals(citizenpincode))
					out.println("<option>" + rs.getString(2)+ "</option>");
			}
			out.println("</select><br><br><button type='submit' class='btn btn-primary'>Process</button></FORM>");
		} else
			out.println("<font color=red><b>Error");

	} catch (Exception ex) {
		out.println(ex.getMessage());
	}
%>
</body>
</html>