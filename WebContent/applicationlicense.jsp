<%@ page import="java.util.Date,java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass middle">
	<h4>License application</h4>
	<hr>

	<%
		String uid, vehicletype;
		Connection con;
		Statement stmt;
		ResultSet rs;

		Date date;
		String formattedDate = "";
		date = new Date();
		formattedDate = date.getDate() + "/" + (date.getMonth() + 1) + "/"
				+ (date.getYear() + 1900);

		uid = (String) session.getAttribute("uid");
		vehicletype = (String) request.getParameter("vehicletype");
		if (vehicletype == null) {
			out.println("<form role='form'>Select vehicle type to apply license for : <select name='vehicletype'>");
			out.println("<option>2</option><option>4</option><option>HV</option>");
			out.println("</select><br><br><button type='submit' class='btn btn-primary'>Apply</button></form>");
		}

		else {
			try {
				rs = null;
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/uiddb", "root", "");
				stmt = con.createStatement();
				stmt.executeUpdate("insert into licensetable values(" + uid
						+ ",'" + formattedDate
						+ "','Processing','0','0','0','0','" + vehicletype
						+ "','0')");
				out.println("License Application submitted successfully for citizen <font color=red>"
						+ uid);
			} catch (Exception ee) {
				out.println("License Already Applied For.");
			}
		}
	%>
</body>
</html>