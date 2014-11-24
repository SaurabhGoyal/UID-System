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
	<h4>Passport Processing</h4>
	<hr>
<%
	Connection con;
	Statement stmt;
	ResultSet rs;
	String uid, status, remarks;

	try {
		out.println("<body background='light_blue1.bmp'><TH>Passport status<hr>");

		uid = request.getParameter("uid");
		status = request.getParameter("status");
		remarks = request.getParameter("remarks");
		if (remarks.equals("")) {
			out.println("<font color=red>all fields mandatory");
			return;
		} else {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb", "root", "");
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from citizentable where uid="+ uid);
			if (rs.next()) {
				rs.close();
				stmt = con.createStatement();
				stmt.executeUpdate("update passporttable set status='"+ status + "',remarks='" + remarks+ "' where uid=" + uid);
				out.println("Passport Application for " + uid+ ",status set as " + status+"ed");
			} else {
				out.println("<font color=red>Error");
			}
		}
	} catch (Exception ex){
		out.println(ex.getMessage());
	}
%>
</body>
</html>