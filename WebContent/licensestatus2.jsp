<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass middle">
<h4>License Application Status</h4><hr>
<%
	String uid, vehicletype;
	Connection con;
	Statement stmt;
	ResultSet rs;

	uid = (String) session.getAttribute("loginid");
	vehicletype = request.getParameter("vehicletype");

	try {
		rs = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb","root","");
		stmt = con.createStatement();

		rs = stmt.executeQuery("select * from licensetable where uid=" + uid+ " and vehicletype='" + vehicletype + "'");

		if (rs.next()) {
			String status = rs.getString(3);
			if (status.equals("Processing"))
				out.println("UID : <font color=red>"+ uid+ "</font> <b>Awaiting test at RTO.");

			if (status.equals("Accept"))
				out.println("UID : <font color=red>"+ uid+ "</font> <b>License generated, Awaiting dispatch.");

			if (status.equals("Reject"))
				out.println("UID : <font color=red>"+ uid+"<b>Test result : Failed, re-apply for license<br><font color=black>Application rejected due to <font color=red> "+ rs.getString(8));

			if (status.equals("Despatched")) {
				String licenseno, issuedate, expirydate, issuingauthority;
				licenseno = rs.getString(4);
				issuedate = rs.getString(5);
				expirydate = rs.getString(6);
				issuingauthority = rs.getString(7);
				rs.close();

%>				
<h4><center>Govt. Of India <br>Citizen License (UID: <%=uid%>)<br></center></h4>
<center>
<table class="table table-striped">
	<tr><td><b>UID: </b></td><td><%=uid%></td><td><b>Vehicle Type :</b></td><td><%=vehicletype%></td></tr>
	<tr><td><b>Citizen Name :</b></td><td><%=session.getAttribute("name")%></td><td><b>Address :</b></td><td><%=session.getAttribute("address")%></td></tr>
	<tr><td><b>Birth Date :</b></td><td><%=session.getAttribute("dob")%></td><td><b>Contact No :</b></td><td><%=session.getAttribute("contactno")%></td></tr>
	<tr><td><b>Father's Name :</b></td><td><%=session.getAttribute("fathername")%></td><td><b>Gender :</b></td><td><%=session.getAttribute("gender")%></td></tr>
	<tr><td><b>License No :</b></td><td><%=licenseno%></td><td><b>Issuing Authority :</b></td><td><%=issuingauthority%></td></tr>
	<tr><td><b>Issue Date :</b></td><td><%=issuedate%></td><td><b>Expiry Date :</b></td><td><%=expirydate%></td></tr>
</table>
</center>
<%
			}
		}
	} catch (Exception ee) {
		out.println(ee.getMessage());
	}
%>
</body>
</html>