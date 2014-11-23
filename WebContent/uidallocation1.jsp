<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass">
	<legend>
		<h4>UID Allocation</h4>
	</legend>
	<%
		Connection con;
		Statement stmt;
		ResultSet rs;
		int applicationno, uid;
		String status, surveyorname;

		applicationno = Integer.parseInt((String) session
				.getAttribute("applicationno"));
		surveyorname = (String) session.getAttribute("surveyorname");
		uid = 1000;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/uiddb", "root", "");
			stmt = con.createStatement();
			rs = stmt.executeQuery("select max(uid) from citizentable");
			if (rs.next()) {
				uid = rs.getInt(1) + 1;
				if (uid == 1)
					uid = 1000;
			} else
				uid = 1000;
	%>
	<form class="form-horizontal" role="form" method=post
		action='uidallocation2.jsp'>
		<div class="form-group">
			<label for="applicationno" class="col-sm-2 control-label">Application
				No</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="applicationno"
					name="applicationno" value="<%=applicationno%>" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="surveyorname" class="col-sm-2 control-label">Surveyor
				Name</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="surveyorname"
					name="surveyorname" value="<%=surveyorname%>" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="uid" class="col-sm-2 control-label">UID</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="uid" name="uid"
					value="<%=uid%>" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="pwd" class="col-sm-2 control-label">Password</label>
			<div class="col-sm-8">
				<input type="password" class="form-control" id="pwd" name="pwd"
					placeholder="6-14 characters">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button type="submit" class="btn btn-primary">Allot UID</button>
			</div>
		</div>
		<%
			} catch (Exception ee) {
				out.println("Invalid Data! All fields are mandatory..."
						+ ee.getMessage());
			}
		%>
	
</body>
</html>