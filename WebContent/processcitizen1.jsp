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
<h4>Process Citizens</h4><hr>
<%
	Connection con;
	Statement stmt;
	ResultSet rs;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb", "root", "");
		stmt = con.createStatement();
		rs = stmt.executeQuery("select applicationno from citizentable where uid=0 and applicationstatus='Processing'");
		try {
			out.println("<form method=post class='form-horizontal' role='form' action='processcitizen2.jsp'><table><tr><td>Select UID Application: </td><td><select name=applicationno>");
			while (rs.next()) {
				out.println("<option value=" + rs.getString(1) + ">" + rs.getString(1) + "</option>");
			}
			out.println("</td></table></select>");
			out.println("<br><button type='submit' class='btn btn-primary'>Next</button></form>");
		} catch (Exception ee) {
			out.println(ee.getMessage());
		}
	} catch (Exception ee) {
		out.println(ee.getMessage());
	}
%>
</body>
</html>