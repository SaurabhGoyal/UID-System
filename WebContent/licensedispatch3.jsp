<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass">
<h4>License Scheduling</h4><hr>
<%
	Connection con;
	Statement stmt;
	ResultSet rs;
	String uid, licenseno, issuedate, expirydate, issuingauthority, vehicletype;

	uid = request.getParameter("uid");
	licenseno = request.getParameter("licenseno");
	issuedate = request.getParameter("issuedate");
	expirydate = request.getParameter("expirydate");
	issuingauthority = request.getParameter("issuingauthority");
	vehicletype = request.getParameter("vehicletype");
	
	try {
		if (licenseno.equals("") || issuingauthority.equals("")) {
			out.println("<font color=red>all fields mandatory");
			return;
		}
		else {
			rs = null;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb", "root", "");
			stmt = con.createStatement();
			int stat = stmt.executeUpdate("update licensetable set licenseno='"+ licenseno+ "',issuedate='"+ issuedate+ "',expirydate='"+ expirydate+ "',issuingauthority='"
							+ issuingauthority+ "',status='Despatched'"+ " where uid="+ uid	+ " and vehicletype='"+ vehicletype+ "'");
			if (stat > 0)
				out.println("License Despatched for Citizen <font color=red>"+ uid);
			else
				out.println("Error in update");
		}
	} catch (Exception ex) {
		out.println(ex.getMessage());
	}
%>
</body>
</html>