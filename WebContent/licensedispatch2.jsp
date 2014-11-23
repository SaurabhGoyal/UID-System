<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass">
<h4>License Dispatch</h4><hr>
<%
	String uid;
	Connection con;
	Statement stmt;
	ResultSet rs;
	
	java.util.Date date=new java.util.Date();
	String formattedDate = "",expirydate="";
	formattedDate = date.getDate() + "/" + (date.getMonth() + 1) + "/"+ (date.getYear() + 1900);
	expirydate = date.getDate() + "/" + (date.getMonth() + 1) + "/"+ (date.getYear() + 1910);

	try {
		rs = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb","root","");
		stmt = con.createStatement();
		uid = request.getParameter("uid");
		rs = stmt.executeQuery("select vehicletype from licensetable where uid="+ uid + " and status='Accept'");
	%>
	<form class="form-horizontal" role="form" method=post
		action='licensedispatch3.jsp'>
		<div class="form-group">
			<label for="uid" class="col-sm-2 control-label">Citizen ID</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="uid" name="uid"
					value="<%=uid%>">
			</div>
		</div>
		<div class="form-group">
			<label for="vehicletype" class="col-sm-2 control-label">Vehicle
				Type</label>
			<div class="col-sm-8">
				<select name="vehicletype" class="form-control">
					<%
						while (rs.next())
									out.println("<option> " + rs.getString(1) + "</option>");
					%>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="licenseno" class="col-sm-2 control-label">License No</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="licenseno" name="licenseno"
					placeholder="Enter a new license no"">
			</div>
		</div>
		<div class="form-group">
			<label for="issuedate" class="col-sm-2 control-label">Issue Date</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="issuedate" name="issuedate"
					value="<%=formattedDate%>"  readonly='readonly'>
			</div>
		</div>
		<div class="form-group">
			<label for="expirydate" class="col-sm-2 control-label">Expiry Date</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="expirydate" name="expirydate"
					value="<%=expirydate%>"  readonly='readonly'>
			</div>
		</div>
		<div class="form-group">
			<label for="issuingauthority" class="col-sm-2 control-label">Issuing Authority</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="issuingauthority" name="issuingauthority"
					value="Govt. of India">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button type="submit" class="btn btn-primary">Issue</button>
				<button type="reset" class="btn btn-default">Reset</button>
			</div>
		</div>
	<%
	} catch (Exception ee) {
		out.println(ee.getMessage());
	}
%>
</body>
</html>