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

	<%
		String stationid, tpcode;
		Connection con;
		Statement stmt;
		ResultSet rs;

		java.util.Date dt;
		String formattedDate = "";
		dt = new java.util.Date();
		formattedDate = dt.getDate() + "/" + (dt.getMonth() + 1) + "/"
				+ (dt.getYear() + 1900);

		stationid = (String) session.getAttribute("loginid");

		try {
			rs = null;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/uiddb", "root", "");
			stmt = con.createStatement();
			String pincode = (String) session.getAttribute("pincode");
			rs = stmt
					.executeQuery("select * from rtaschedule where status='Scheduled' and uid in(select uid from citizentable where pincode='"
							+ pincode + "')");
			out.println("<h4>RTA Test Schedules For Today<hr>RTA Station : "
					+ stationid + "</h4><hr>");
			if (!rs.isBeforeFirst()) {
				out.println("<b>No applications for this station for today.</b>");
			} else {
				out.println("<table class='table table-striped'><tr><th>Citizen ID</th><th>Venue</th><th>Report To</th><th>Date</th><th>Time</th></tr>");
				while (rs.next()) {
					String uid = rs.getString(1);
					String venue = rs.getString(2);
					String rto = rs.getString(4);
					String date = rs.getString(5);
					out.println("<tr><td>" + uid + "</td><td>" + venue
							+ "</td><td>" + rto + "</td><td>" + date
							+ "</td><td>" + rs.getString(7) + "</td></tr>");
				}
				out.println("</table><hr>");
				rs.close();
				rs = stmt.executeQuery("select uid from rtaschedule where status='Scheduled' and uid in(select uid from citizentable where pincode='"
								+ pincode + "')");
	%>
	<form class="form-horizontal" role="form" method=post action='licensetestresults2.jsp'>
		<div class="form-group">
			<label for="uid" class="col-sm-2 control-label">Citizen Id</label>
			<div class="col-sm-8">
				<select name='uid'>
					<%
						while (rs.next()) {
									out.println("<option>" + rs.getString(1) + "</option>");
								}
					%>
				</select>
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
				</label> 
				<label> <input type="radio" name="status" id="Reject"
					value="Reject">Reject
				</label>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button type="submit" class="btn btn-primary">Set Status</button>
			</div>
		</div>
	</form>
	<%
		}
		} catch (Exception ex) {
			out.println(ex.getMessage());
		}
	%>