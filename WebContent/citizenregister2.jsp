<%@ page import="java.sql.*"%>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass">

	<%
		int applicationno = 1, pincode;
		String name, address, dob, fathername, contactno, occupation, photo, gender;
		Connection conn;
		Statement stmt, stmt1;
		ResultSet rs;
	%>

	<%
		try {
			name = request.getParameter("name");
			address = request.getParameter("address");
			dob = request.getParameter("dob");
			fathername = request.getParameter("fathername");
			contactno = request.getParameter("contactno");
			occupation = request.getParameter("occupation");
			photo = request.getParameter("photo");
			gender = request.getParameter("gender");
			pincode = Integer.parseInt(request.getParameter("pincode"));

			if (name.equals("") || address.equals("") || dob.equals("")
					|| fathername.equals("") || contactno.equals("")
					|| occupation.equals("") || gender.equals("")
					|| pincode == 0) {
				out.println("<font color=red>all fields mandatory");
				return;
			}

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/uiddb", "root", "");

			stmt1 = conn.createStatement();
			rs = stmt1
					.executeQuery("select max(applicationno) from citizentable");
			try {
				if (rs.next())
					applicationno = rs.getInt(1) + 1;
			} catch (Exception ee) {
				applicationno = 1;
				out.println(ee.getMessage());
			}
			stmt = conn.createStatement();
			stmt.executeUpdate("insert into citizentable values("
					+ applicationno + ",0,'0'" + ",'" + name + "','"
					+ address + "','" + dob + "','" + fathername + "',"
					+ contactno + ",'" + occupation + "','" + photo + "',"
					+ pincode + ",'" + gender + "','Processing')");
			out.println("Registration Successful for application "
					+ applicationno);
		} catch (Exception ee) {
			out.println("Invalid Data! All fields are mandatory..."
					+ ee.getMessage());
		}
	%>
</body>
</html>