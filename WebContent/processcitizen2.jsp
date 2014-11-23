<%@ page import="java.util.Date,java.sql.*"%>

<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass">
	<%
		Connection con;
		Statement stmt, stmt1;
		ResultSet rs;
		int applicationno;

		Date date;
		String formattedDate = "";
		date = new Date();
		formattedDate = date.getDate() + "/" + (date.getMonth() + 1) + "/"
				+ (date.getYear() + 1900);

		try {
			applicationno = Integer.parseInt(request
					.getParameter("applicationno"));
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/uiddb", "root", "");
			stmt1 = con.createStatement();
			rs = stmt1
					.executeQuery("select * from citizentable where applicationno="
							+ applicationno);

			if (rs.next()) {
	%>
	<legend>
		<h4>CITIZEN VERIFICATION</h4>
	</legend>
	<form class="form-horizontal" role="form" method=post
		action='processcitizen3.jsp'>
		<div class="form-group">
			<label for="applicationno" class="col-sm-2 control-label">Application
				No</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="applicationno"
					name="applicationno" value="<%=applicationno%>" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">Citizen
				Name</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="name"
					name="name" value="<%=rs.getString(4)%>">
			</div>
		</div>
		<div class="form-group">
			<label for="gender" class="col-sm-2 control-label">Gender</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="gender"
					name="gender" value="<%=rs.getString(12)%>">
			</div>
		</div>
		<div class="form-group">
			<label for="fathername" class="col-sm-2 control-label">Father's
				Name</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="fathername"
					name="fathername" value="<%=rs.getString(7)%>">
			</div>
		</div>
		<div class="form-group">
			<label for="date" class="col-sm-2 control-label">Verification
				Date</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="date" name="date"
					disabled value="<%=formattedDate%>">
			</div>
		</div>
		<div class="form-group">
			<label for="dob" class="col-sm-2 control-label">Date Of Birth</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="dob" name="dob"
					value="<%=rs.getString(6)%>">
			</div>
		</div>
		</div>
		<div class="form-group">
			<label for="address" class="col-sm-2 control-label">Address</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="address" name="address"
					value="<%=rs.getString(5)%>">
			</div>
		</div>
		<div class="form-group">
			<label for="pincode" class="col-sm-2 control-label">Pincode</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="pincode" name="pincode"
					value="<%=rs.getString(11)%>">
			</div>
		</div>
		<div class="form-group">
			<label for="contactno" class="col-sm-2 control-label">Contact
				No</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="contactno"
					name="contactno" value="<%=rs.getString(8)%>">
			</div>
		</div>
		<div class="form-group">
			<label for="occupation" class="col-sm-2 control-label">Occupation</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="occupation"
					name="occupation" value="<%=rs.getString(9)%>">
			</div>
		</div>
		<div class="form-group">
			<label for="surveyorname" class="col-sm-2 control-label">Surveyor Name</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="surveyorname"
					name="surveyorname" placeholder="Name of the surveyor">
			</div>
		</div>
		<div class="form-group">
			<label for="radio" class="col-sm-2 control-label">Status</label>
			<div class="radio col-sm-8">
				<label> <input type="radio" name="status" id="Accept"
					value="Accept" checked>Accept
				</label> 
				<label> <input type="radio" name="status" id="Reject"
					value="Reject">Reject
				</label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button type="submit" class="btn btn-primary">Confirm</button>
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