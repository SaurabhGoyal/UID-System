<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass">
	<h4>Station Registration</h4>
	<hr>

	<%
		Connection con;
		Statement stmt;
		ResultSet rs;
		String controltype, stationid, location, incharge, pwd, pincode, areaname;

		try {
			stationid = request.getParameter("stationid");
			location = request.getParameter("location");
			incharge = request.getParameter("incharge");
			pwd = request.getParameter("pwd");
			pincode = request.getParameter("pincode");
			areaname = request.getParameter("areaname");
			controltype = request.getParameter("controltype");

			if (stationid.equals("") || location.equals("")
					|| incharge.equals("") || pwd.equals("")
					|| pincode.equals("") || areaname.equals("")) {
				out.println("<font color=red>all fields mandatory");
				return;
			}

			//to check if an RTA or CD(whichever relevent) is already present in the given pincode.
			int valid = 0;

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/uiddb", "root", "");

			stmt = con.createStatement();
			rs = stmt
					.executeQuery("select stationid from trcontroltable where controltype='"
							+ controltype
							+ "' and pincode='"
							+ pincode
							+ "'");

			if (rs.next())
				valid = 1;

			if (valid == 1)
				out.println("<font color=Red>One station already exist in this pincode area : <font color=blue>"
						+ pincode + "<br>");
			else {
				stmt = con.createStatement();
				stmt.executeUpdate("Insert into trcontroltable values('"
						+ stationid + "','" + location + "','" + incharge
						+ "','" + pwd + "','" + pincode + "','" + areaname
						+ "','" + controltype + "')");

				out.println("<font color=red size=2><b>Station Registered.");
				out.println("</form>");
			}
		} catch (Exception ee) {
			out.println(ee.getMessage());
		}
	%>
</body>
</html>