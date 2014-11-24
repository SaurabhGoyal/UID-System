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
	<%
		String loginid, usertype, newpwd1, newpwd2;
		Connection con;
		Statement stmt, stmt1;
		ResultSet rs, rs1;

		loginid = (String) session.getAttribute("loginid");
		usertype = (String) session.getAttribute("usertype");
		newpwd1 = request.getParameter("newpwd1");
		newpwd2 = request.getParameter("newpwd2");

		try {
			out.println("<h4>PASSWORD UPDATION STATUS</h4><hr>");
			if (newpwd1.equals("") || newpwd2.equals("")) {
				out.println("<font color=red>all fields mandatory");
				return;
			}
			if (!newpwd1.equals(newpwd2)) {
				out.println("<font color=red>passwords do not match");
				return;
			}
			rs = null;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/uiddb", "root", "");
			stmt = con.createStatement();

			if (usertype.equals("Admin"))
				stmt.executeUpdate("update admintable set pwd='" + newpwd1
						+ "' where adminid=" + loginid);
			if (usertype.equals("UID Staff"))
				stmt.executeUpdate("update uidstafftable set pwd='"
						+ newpwd1 + "' where staffid=" + loginid);
			if (usertype.equals("Citizen"))
				stmt.executeUpdate("update citizentable set pwd='"
						+ newpwd1 + "' where uid=" + loginid);
			if (usertype.equals("RTA"))
				stmt.executeUpdate("update trcontroltable set pwd='"
						+ newpwd1
						+ "' where controltype='RTA' and stationid='"
						+ loginid + "'");
			if (usertype.equals("CrimeDept"))
				stmt.executeUpdate("update trcontroltable set pwd='"
						+ newpwd1
						+ "' where controltype='CD' and stationid='"
						+ loginid + "'");
			if (usertype.equals("AAI"))
				stmt.executeUpdate("update aaitable set pwd='" + newpwd1
						+ "' where  aaiid='" + loginid + "'");
			out.println("<font color='green'>Password Updated.</font>");

		} catch (Exception ee) {
			out.println(ee.getMessage());
		}
	%>
</body>
</html>