<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass">
<h4>Transit Status Change</h4><hr>
<%
	String stationid, tpcode;
	Connection con;
	Statement stmt;
	ResultSet rs;

	stationid = (String) session.getAttribute("loginid");

	try {
		rs = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb","root","");
		stmt = con.createStatement();
		rs = stmt.executeQuery("select uid from passporttable where status='Despatched'");
		
		%>
		<form class="form-horizontal" role="form" method=post
		action='transitstatus2.jsp'>
		<div class="form-group">
			<label for="uid" class="col-sm-2 control-label">Citizen Id</label>
			<div class="col-sm-8">
				<select name="uid" class="form-control">
					<%
						while (rs.next()) {
								out.println("<option>" + rs.getString(1) + "</option>");
						}
					%>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="radio" class="col-sm-2 control-label">Transit Status</label>
			<div class="radio col-sm-8">
				<label> <input type="radio" name="transitstatus" id="Allowed"
					value="Allowed" checked>Allow
				</label> <label> <input type="radio" name="transitstatus" id="Not-Allowed"
					value="Not-Allowed">Disallow
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
	} catch (Exception ex){
		out.println(ex.getMessage());
	}
%>