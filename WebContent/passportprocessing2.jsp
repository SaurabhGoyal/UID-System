<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass">
	<h4>Passport Processing</h4>
	<hr>

	<%
		Connection con;
		Statement stmt;
		ResultSet rs;
		String uid;

		try {
			uid = request.getParameter("uid");
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/uiddb", "root", "");
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from citizentable where uid="+ uid);
			if (rs.next()) {
	%>
	<legend>
		<h4>Citizen Profile</h4>
	</legend>
	<form class="form-horizontal" role="form" method=post
		action='passportprocessing3.jsp'>
		<div class="form-group">
			<label for="uid" class="col-sm-2 control-label">Citizen Id</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="uid" name="uid"
					value="<%=uid%>" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">Citizen Name</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="name" name="name"
					value="<%=rs.getString(4)%>" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="gender" class="col-sm-2 control-label">Gender</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="gender" name="gender"
					value="<%=rs.getString(12)%>" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="fathername" class="col-sm-2 control-label">Father's
				Name</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="fathername"
					name="fathername" value="<%=rs.getString(7)%>" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="dob" class="col-sm-2 control-label">Date Of Birth</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="dob" name="dob"
					value="<%=rs.getString(6)%>" readonly="readonly">
			</div>
		</div>
		</div>
		<div class="form-group">
			<label for="address" class="col-sm-2 control-label">Address</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="address" name="address"
					value="<%=rs.getString(5)%>" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="pincode" class="col-sm-2 control-label">Pincode</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="pincode" name="pincode"
					value="<%=rs.getString(11)%>" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="contactno" class="col-sm-2 control-label">Contact
				No</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="contactno"
					name="contactno" value="<%=rs.getString(8)%>" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="occupation" class="col-sm-2 control-label">Occupation</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="occupation"
					name="occupation" value="<%=rs.getString(9)%>" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="remarks" class="col-sm-2 control-label">Remarks</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="remarks" name="remarks"
					placeholder="Remarks about test">
			</div>
		</div>
		<div class="form-group">
			<label for="radio" class="col-sm-2 control-label">Status</label>
			<div class="radio col-sm-8">
				<label> <input type="radio" name="status" id="Accept"
					value="Accept" checked>Accept
				</label> <label> <input type="radio" name="status" id="Reject"
					value="Reject">Reject
				</label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button type="submit" class="btn btn-primary">Process</button>
			</div>
		</div>
	</form>


	<%
		} else {
				out.println("<font color=red size=2>Error");
			}
		} catch (Exception ex) {
			out.println(ex.getMessage());
		}
	%>