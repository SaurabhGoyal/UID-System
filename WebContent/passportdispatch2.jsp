<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass">
	<legend>
		<h4>Passport Dispatch</h4>
	</legend>

<%
	String uid,passportno,issuedate,expirydate,issuingauthority;
	Connection con;
	Statement stmt;
	ResultSet rs;

	uid = request.getParameter("uid");
	passportno = request.getParameter("passportno");
	issuedate = request.getParameter("issuedate");
	expirydate = request.getParameter("expirydate");
	issuingauthority = request.getParameter("issuingauthority");
	
	if(passportno.equals("")||issuingauthority.equals("")){
		out.println("<font color=red>all fields mandatory");
		return;
	}
	
	try {
		rs = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb","root","");
		stmt = con.createStatement();
		int stat = stmt.executeUpdate("update passporttable set passportno='"+ passportno + "',issuedate='" + issuedate + "',expirydate='" + expirydate+ "',issuingauthority='" + issuingauthority + "',status='Despatched'"	+ " where uid=" + uid);
		if (stat > 0)
			out.println("Passport Despatched for Citizen <font color=red>"+ uid);
		else
			out.println("error in updating database.");
	} catch (Exception ex) {
		out.println(ex.getMessage());
	}
%>
</body>
</html>