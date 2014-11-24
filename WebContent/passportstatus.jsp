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
<body class="paddedClass middle">
	<h4>Passport Application Status</h4>
	<hr>

	<%
		String uid;
		Connection con;
		Statement stmt, stmt1;
		ResultSet rs;
		uid = (String) session.getAttribute("uid");

		try {
			rs = null;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/uiddb", "root", "");
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from passporttable where uid="
					+ uid);
			if (rs.next()) {
				String status = rs.getString(3);
				if (status.equals("Processing"))
					out.println("<b>" + uid
							+ " : Awaiting police verification !");

				if (status.equals("Accept"))
					out.println("<b>"
							+ uid
							+ " : <font color='green'>Police verification phase completed, Awaiting Despatch !</font>");

				if (status.equals("Reject"))
					out.println("<b>"
							+ uid
							+ " : Police verification phase completed, <font color=red> Application rejected due to <u>"
							+ rs.getString(8));

				if (status.equals("Despatched")) {
					String passportno, issuedate, expirydate, issuingauthority;
					passportno = rs.getString(4);
					issuedate = rs.getString(5);
					expirydate = rs.getString(6);
					issuingauthority = rs.getString(7);
					rs.close();
	%>
	<h4><center>Govt. Of India <br>Citizen Passport(UID: <%=uid%>)<br></center></h4>
<center>
<table class="table table-striped">
	<tr><td><b>Citizen Name :</b></td><td><%=session.getAttribute("name")%></td><td><b>Address :</b></td><td><%=session.getAttribute("address")%></td></tr>
	<tr><td><b>Birth Date :</b></td><td><%=session.getAttribute("dob")%></td><td><b>Contact No :</b></td><td><%=session.getAttribute("contactno")%></td></tr>
	<tr><td><b>Father's Name :</b></td><td><%=session.getAttribute("fathername")%></td><td><b>Gender :</b></td><td><%=session.getAttribute("gender")%></td></tr>
	<tr><td><b>Passport No :</b></td><td><%=passportno%></td><td><b>Issuing Authority :</b></td><td><%=issuingauthority%></td></tr>
	<tr><td><b>Issue Date :</b></td><td><%=issuedate%></td><td><b>Expiry Date :</b></td><td><%=expirydate%></td></tr>
</table>
</center>
	
		<%
				}

					} else {
						out.println("<b>No application from this UID</b>");
					}

				} catch (Exception ee) {
					out.println(ee.getMessage());
				}
		%>			
</body></html>