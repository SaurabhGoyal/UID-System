<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass middle">

<%
	String uid;
	Connection con;
	Statement stmt;
	ResultSet rs;

	uid = (String) session.getAttribute("uid");

	try {
		rs = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb", "root", "");
		stmt = con.createStatement();
		rs = stmt.executeQuery("select * from rtaschedule where uid="+ uid);

		out.println("<h4>RTA TEST SCHEDULE</h4><hr><b>Citizen Id : " + uid+"</b><hr>");
		if (!rs.isBeforeFirst() ) {    
			out.println("<b>No test schedules for this UID.</b>"); 
		}
		else{
			out.println("<table class='table table-striped'><tr><td>Venue</td><td>Report To</td><td>Date</td><td>Time</td><td>Vehicle-Type</td></tr>");
			while (rs.next()) {
				out.println("<tr><td>" + rs.getString(4) + "</td><td>"+ rs.getString(2) + "</td><td>" + rs.getString(5)
					+ "</td><td>" + rs.getString(6) + "</td><td>"+ rs.getString(3) + "</td></tr>");
			}
			out.println("</table><hr>");
		}
	} catch (Exception ee) {
		out.println(ee.getMessage());
	}
%>
</body>
</html>