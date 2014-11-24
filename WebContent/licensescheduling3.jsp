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
<h4>License Scheduling</h4>
	<hr>
<%
	String uid,venue,rto,date,time;
	Connection con;
	Statement stmt, stmt1;
	ResultSet rs;
	String cname;

	try {
		uid = request.getParameter("uid");
		venue = request.getParameter("venue");
		rto = request.getParameter("rto");
		date = request.getParameter("date");
		time = request.getParameter("time");
		String vehicletype = request.getParameter("vehicletype");
	
		if(venue.equals("")||rto.equals("")||date.equals("")||time.equals("")){
			out.println("<font color=red>all fields mandatory");
			return;
		}	
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb","root","");
		
		stmt = con.createStatement();
		stmt.executeUpdate("insert into rtaschedule values(" + uid + ",'" + rto + "','"+ vehicletype + "','" + venue + "','" + date + "','"+ time +"','Scheduled')");
		out.println("<font color=green>Test scheduled for " + uid + " on " + date+", "+time+"</font>");
	} catch (Exception ex) {
		out.println(ex.getMessage());
	}
%>
</body>
</html>