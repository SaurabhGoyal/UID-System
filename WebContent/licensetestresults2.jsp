<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass">

<%
	String stationid, tpcode,status,uid,remarks;
	Connection con;
	Statement stmt;
	ResultSet rs;

	stationid = (String) session.getAttribute("loginid");
	uid = request.getParameter("uid");
	remarks = request.getParameter("remarks");
	status = request.getParameter("status");
	
	
	try {
		if(remarks.equals("")){
			out.println("<font color=red>all fields mandatory");
			return;
		}
		else{
			rs = null;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb","root","");
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from rtaschedule where uid="+ uid);
			if (rs.next()) {
				rs.close();
				stmt = con.createStatement();
				stmt.executeUpdate("update licensetable set status='" + status	+ "',remarks='" + remarks + "' where uid=" + uid);
				stmt.executeUpdate("update rtaschedule set status='" + status+ "' where uid=" + uid);
				out.println("License Status Updated.");
			} else
				out.println("Error");
		}

	} catch (Exception ee) {
		out.println(ee.getMessage());
	}
%>
</body>
</html>