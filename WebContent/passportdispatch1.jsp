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
	<legend>
		<h4>Passport Dispatch</h4>
	</legend>

	<%
		String staffid, tpcode;
		Connection con;
		Statement stmt;
		ResultSet rs;
		String formattedDate = "", expiryDate = "";
		java.util.Date date = new java.util.Date();
		formattedDate = date.getDate() + "/" + (date.getMonth() + 1) + "/"
				+ (date.getYear() + 1900);
		expiryDate = date.getDate() + "/" + (date.getMonth() + 1) + "/"
				+ (date.getYear() + 1910);

		staffid = (String) session.getAttribute("loginid");

		try {
			rs = null;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/uiddb", "root", "");
			stmt = con.createStatement();
			rs = stmt
					.executeQuery("select uid from passporttable where status='Accept'");
	%>

	<form id="myForm" class="form-horizontal" role="form" method=post
		action=passportdispatch2.jsp>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">Citizen Id</label>
			<div class="col-sm-8">
				<select name="uid">
					<%
						while (rs.next()) {
								out.println("<option>" + rs.getString(1) + "</option>");
							}
					%>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="passportno" class="col-sm-2 control-label">Passport
				No</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="passportno"
					name="passportno" placeholder="Enter a new passport no">
			</div>
		</div>
		<div class="form-group">
			<label for="issuedate" class="col-sm-2 control-label">Issue
				Date</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="issuedate"
					name="issuedate" value="<%=formattedDate%>" readonly='readonly'>
			</div>
		</div>
		<div class="form-group">
			<label for="expirydate" class="col-sm-2 control-label">Expiry
				Date</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="expirydate"
					name="expirydate" value="<%=expiryDate%>" readonly='readonly'>
			</div>
		</div>

		<div class="form-group">
			<label for="issuingauthority" class="col-sm-2 control-label">Issuing
				Authority</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="issuingauthority"
					name="issuingauthority" value="Govt. Of India">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button type="submit" class="btn btn-primary">Issue</button>
				<button type="reset" class="btn btn-default">Reset</button>
			</div>
		</div>
	</form>
	<%
		} catch (Exception ex) {
			out.println(ex.getMessage());
		}
	%>
</body>
</html>