<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass">
<h4>License Scheduling</h4><hr>
	<%
		String loginid, pincode = "";
		Connection con;
		Statement stmt, stmt1;
		ResultSet rs, rs1;

		loginid = (String) session.getAttribute("loginid");
		try {
			rs = null;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/uiddb", "root", "");
			pincode = (String) session.getAttribute("pincode");
			stmt = con.createStatement();
			rs = stmt
					.executeQuery("select pincode,uid from citizentable where pincode="
							+ pincode
							+ " and uid in (select uid from licensetable where status='Processing')");
			if (!rs.isBeforeFirst()) {
				out.println("<font color=red><b>No applications to schedule. </b></font>");
			} else {
	%>
	<form class="form-horizontal" role="form" method=post
		action='licensescheduling2.jsp'>
		<div class="form-group">
			<label for="uid" class="col-sm-2 control-label">Citizen Id</label>
			<div class="col-sm-8">
				<select name="uid" class="form-control">
					<%
						while (rs.next()) {
									out.println("<option>" + rs.getString(2) + "</option>");
								}
					%>
				</select>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<br><button type="submit" class="btn btn-primary">Next</button>
				</div>
			</div>
		</div>
	</form>

	<%
		}
		} catch (Exception ex) {
			out.println(ex.getMessage());
		}
	%>

</body>
</html>