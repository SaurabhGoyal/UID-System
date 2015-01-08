<%@ page import="java.sql.*"%>
<%
	String usertype,loginid,pwd;
	Connection con;
	Statement stmt;
	ResultSet rs;
	
	usertype = request.getParameter("usertype");
	loginid = request.getParameter("loginid");
	pwd = request.getParameter("pwd");
	out.println("->" + usertype);

	try {
		rs = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/uiddb","root","");
		stmt = con.createStatement();
		if (usertype.equals("Admin")) {
			rs = stmt.executeQuery("select adminid from admintable where adminid='"	+ loginid + "' and pwd='" + pwd + "'");
			if (rs.next()) {
				session.setAttribute("usertype", usertype);
				session.setAttribute("loginid", loginid);
				response.sendRedirect("adminhome.htm");
			}else
				out.println("<font color=red><b>Invalid Login....<a href='menubar.htm'>Try Again</a>");
		}	

		if (usertype.equals("Passport seva staff")) {
			rs = stmt.executeQuery("select psstaffid from psstafftable where psstaffid="+ loginid + " and pwd='" + pwd + "'");

			if (rs.next()) {
				session.setAttribute("usertype", usertype);
				session.setAttribute("loginid", loginid);
				response.sendRedirect("psstaffhome.jsp");
			} else
				out.println("<font color=red><b>Invalid Login....<a href='menubar.htm'>Try Again</a>");
		}

		if (usertype.equals("CrimeDept")) {
			rs = stmt.executeQuery("select stationid from trcontroltable where stationid='"	+ loginid+ "' and pwd='"+ pwd+ "' and controltype='CD'");

			if (rs.next()) {
				session.setAttribute("usertype", usertype);
				session.setAttribute("loginid", loginid);
				response.sendRedirect("crimedepthome.htm");
			} else
				out.println("<font color=red><b>Invalid Login....<a href='menubar.htm'>Try Again</a>");
		}

		if (usertype.equals("Citizen")) {
			rs = stmt.executeQuery("select uid from citizentable where uid="+loginid + " and pwd='" + pwd + "'");

			if (rs.next()) {
				session.setAttribute("usertype", usertype);
				session.setAttribute("loginid", loginid);
				response.sendRedirect("citizenhome.jsp");
			} else
				out.println("<font color=red><b>Invalid Login....<a href='menubar.htm'>Try Again</a>");
		}

		if (usertype.equals("AAI")) {
			rs = stmt.executeQuery("select aaistaffid from aaitable where aaistaffid='"
							+ loginid + "' and pwd='" + pwd + "'");

			if (rs.next()) {
				session.setAttribute("usertype", usertype);
				session.setAttribute("loginid", loginid);
				response.sendRedirect("aaihome.htm");
			} else
				out.println("<font color=red><b>Invalid Login....<a href='menubar.htm'>Try Again</a>");
		}

		if (usertype.equals("RTO")) {
			rs = stmt.executeQuery("select stationid from trcontroltable where stationid='"
							+ loginid + "' and pwd='" + pwd + "' and controltype='RTA'");

			if (rs.next()) {
				session.setAttribute("usertype", usertype);
				session.setAttribute("loginid", loginid);
				response.sendRedirect("rtahome.jsp");
			} else
				out.println("<font color=red><b>Invalid Login....<a href='menubar.htm'>Try Again</a>");
		}
	} catch (Exception ex) {
		out.println(ex.getMessage());
	}
%>