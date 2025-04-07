<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>

        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "poppins", sans-serif;
        }
        body{
            display: flex;
            background: url("https://github.com/sahilvijayjadhav/glasseffect-login-page.github.io/blob/main/img5.jpg?raw=true");
            background-size: cover;
            background-position: center;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        .login{
            border-radius: 10px;
            padding: 30px 40px;
            width: 420px;
            background: transparent;
            border: 2px solid rgba(255, 255, 255, .2);
            backdrop-filter: blur(3px);
            box-shadow: 0 0 10px rgba(0, 0, 0, .2);
            color: white;

        }
        .login h1{
            text-align: center;
        }
        .login .input-box{
            position: relative;
            width: 100%;
            height: 50px;
            margin: 30px 0;
        }
        .input-box input{
            width: 100%;
            height: 100%;
            background: transparent;
            border: none;
            outline: none;
            border: 2px solid rgba(255, 255, 255, .2);
            border-radius: 40px;
            font-size: 16px;
            color: white;
            padding: 20px 45px 20px 20px;

        }
        .input-box i{
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 20px;
        }
        .input-box input::placeholder{
            color: white;
        }
        .login .remeber{
            display: flex;
            justify-content: space-between;
            font-size: 14.5px;
            margin: -15px 0 15px;
        }
        .remeber label input{
            accent-color: #ffffff;
            margin: 3px;
        }
        .remeber a{
            color: white;
            text-decoration: none;
        }
        .remeber a:hover{
            text-decoration: underline;
        }
        .btn{
            height: 45px;
            width: 100%;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, .1);
            border: none;
            outline: none;
            border-radius: 40px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            color: #333;
        }
        .login .register{
            font-size: 14.5px;
            text-align: center;
            margin: 20px 0 15px;
        }
        .register p a{
            color: #fff;
            text-decoration: none;
            font-weight: 600;
        }
        .register p a:hover{
            text-decoration: underline;
        }

        @media only screen and (max-width: 600px) {
            .login{
                width: 300px;
            }
            .input-box input{
                font-size: 14px;
            }
            .input-box i{
                font-size: 17px;
            }
            .login .remeber{
                font-size: 13px;
            }
            .remeber a{
                position: relative;
                top: 5px;
            }
        }

    </style>
</head>
<body>
    <form class="login">
        <h1>ADMIN</h1>
        <div class="input-box">
            <input type="text" name="AdminUserName" required placeholder="Enter Username">
            <i class="fa-solid fa-user"></i>
        </div>
        <div class="input-box">
            <input type="password" name="AdminPassword" required placeholder="Enter Password">
            <i class="fa-solid fa-lock"></i>
        </div>
        <button type="submit" name="submit" class="btn">Submit</button>
    </form>
    <%
    String path = "jdbc:mysql://localhost:3306/styloxfashionhub";
	String username = "root";
	String sqlpassword = "root";
	Connection con = null;
	if(request.getParameter("submit")!=null){
		String AdminUserName = request.getParameter("AdminUserName");
		String AdminPassword = request.getParameter("AdminPassword");
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(path, username, sqlpassword);
			PreparedStatement ps = con.prepareStatement("select * from adminlogin where username = ? and password = ?");
			ps.setString(1, AdminUserName);
			ps.setString(2, AdminPassword);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				String dbUsername = rs.getString("username");
				if(dbUsername.equals(AdminUserName)){
					HttpSession ses = request.getSession();
    				ses.setAttribute("AdminUnsername", dbUsername);
    				response.sendRedirect("Dashboard.jsp");
				}
				else{
		     		%>
		     			<script>alert("Admin Not Found!! Please Enter Correct Username and Password."); window.location="AdminLogin.jsp";</script>
		     		<%					
		     		}
			}
			else{
	     		%>
	     			<script>alert("Admin Not Found!! Please Enter Correct Username and Password."); window.location="AdminLogin.jsp";</script>
	     		<%					
	     		}
		}catch(Exception e){
			e.getMessage();
		}
	}
    %>
</body>
</html>