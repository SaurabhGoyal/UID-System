<%@ page import="java.util.*,java.sql.*"%>
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
<h4>Transit Status Change</h4><hr>
<%
	String transitstatus;
	int uid;
	Connection con;
	Statement stmt;
	ResultSet rs;

	String formattedDate = "";
	java.util.Date date = new java.util.Date();
	formattedDate = date.getDate() + "/" + (date.getMonth() + 1) + "/"+ (date.getYear() + 1900);

	uid = Integer.parseInt(request.getParameter("uid"));
	transitstatus = request.getParameter("transitstatus");

	try {
		rs = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb","root","");
		stmt = con.createStatement();
		if (transitstatus.equals("Not-allowed")) {
			stmt.executeUpdate("insert into transittable values(" + uid+ ",'Not-allowed','" +formattedDate + "')");
			out.println("Transit Status for <font color=red> " + uid+ "<font color=black> Set");
		} else {
			stmt.executeUpdate("delete from transittable where uid=" + uid);
			out.println("Transit Status revoked for <font color=red> "+ uid + "<font color=black> Set");
		}
		con.close();
	} catch (Exception ex){
		out.println(ex.getMessage());
	}
%>
</body>
</html>