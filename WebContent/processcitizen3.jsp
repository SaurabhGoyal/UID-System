<%@ page import="java.sql.*"%>

<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body class="paddedClass">

<%
	Connection con;
	Statement stmt;
	ResultSet rs;
	int applicationno;
	String status, surveyorname;

	try {
		applicationno = Integer.parseInt(request.getParameter("applicationno"));
		surveyorname = request.getParameter("surveyorname");
		status = request.getParameter("status");
		if(surveyorname.equals("")){
			out.println("<font color=red>all fields mandatory");
			return;
		}
				Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb","root","");
		stmt = con.createStatement();
		if (status.equals("Accept")) {
			String no = applicationno + "";
			session.setAttribute("applicationno", no);
			session.setAttribute("surveyorname", surveyorname);
			response.sendRedirect("uidallocation1.jsp");
		} else {
			stmt.executeUpdate("update citizentable set applicationstatus='Rejected' where applicationno="	+ applicationno);
			out.println("<font color=red><b>Candidate Application Rejected.");
		}
	} catch (Exception ex) {
		out.println(ex.getMessage());
	}
%>
</body>
</html>