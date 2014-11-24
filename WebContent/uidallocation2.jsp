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
		<h4>UID Allocation</h4>
	</legend>

<%
	Connection con;
	Statement stmt;
	ResultSet rs;
	int applicationno, uid;
	String pwd, surveyorname;
	applicationno = Integer.parseInt((String)session.getAttribute("applicationno"));
	surveyorname = (String) session.getAttribute("surveyorname");
	uid = Integer.parseInt(request.getParameter("uid"));
	pwd = request.getParameter("pwd");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb","root","");
		stmt = con.createStatement();
		stmt.executeUpdate("Update citizentable set uid=" + uid + ",pwd='"+ pwd + "',applicationstatus='Accepted' where applicationno=" + applicationno);
		out.println("<font color=green>UID Allocated.</font><br>");
		out.println("Application Id:"+applicationno+"<br>"+"UID:<b>"+uid+"</b><br>"+"Password:"+pwd+"<br>");
	} catch (Exception ee) {
		out.println(ee.getMessage());
	}
%>
</body>
</html>