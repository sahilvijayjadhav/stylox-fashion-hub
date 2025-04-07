<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*, java.util.*, com.org.main.CartItem, java.text.DecimalFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <!-- Custom CSS -->
  <link rel="stylesheet" href="./css/admin.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
  body {
      background-color: #f4f7f6;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      transition: background-color 0.3s ease;
    }
    .chart-container {
      width: 100%;
      height: 400px;
      margin: 0 auto;
      background: #ffffff;
      border-radius: 20px;
      padding: 20px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.5);
      transition: all 0.3s ease;
    }
    .chart-container:hover {
      transform: scale(1.01);
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
    }
  </style>
</head>
<body>
  <div class="wrapper">
    <!-- Sidebar -->
    <nav id="sidebar" class="bg-navy z-3 position-absolute">
      <div class="sidebar-header d-flex align-items-center justify-content-evenly">
        <h3 class="pb-0">Admin Panel</h3>
        <button type="button" id="sidebarCollapseClose" class="btn bg-white btn-close d-lg-none d-block ">
        </button>
      </div>
      <ul class="list-unstyled components p-0">
        <hr class="mt-0">
        <li class="active">
          <a href="./Dashboard.jsp">Dashboard</a>
        </li>
        <hr>
        <li>
          <a href="./DashboardUserPage.jsp">Users</a>
        </li>
        <hr>
        <li>
          <a href="./DashboardProductPage.jsp">Products</a>
        </li>
        <hr>
        <li>
          <a href="./product-add.jsp">Add Product</a>
        </li>
        <hr>
        <li>
          <a href="./Dashboardorders.jsp">My Orders</a>
        </li>
        <hr>
        <li>
          <a href="./DashboardDeletedOrders.jsp">Previous Orders</a>
        </li>
        <hr class="mb-0">
        <li>
          <a href="./DashboardDeletedProducts.jsp">Deleted Products</a>
        </li>
        <hr>
      </ul>
    </nav>

    <!-- Page Content -->
    <div id="content">
      <!-- Top Navigation Bar -->
      <nav class="navbar navbar-expand-lg navbar-light bg-light d-flex align-items-center justify-content-between">
        <div class="d-flex flex-row">
            <button type="button" id="sidebarCollapse" class="btn btn-navy d-lg-none d-block">
                <span class="navbar-toggler-icon"></span>
              </button>
              <a class="navbar-brand ms-3 fs-3 fw-bold text-uppercase" style="color: #003366;" href="#">Stylox</a>
        </div>
        <a href="./index.jsp" class="btn btn-outline-danger float-end">
            <i class="fa-solid fa-right-from-bracket"></i>
        </a>
      </nav>

      <!-- Main Content -->
      <div class="container-fluid p-4">
        <div class="container">
        <%
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/styloxfashionhub","root","root");
        	PreparedStatement ps = null;
        	ResultSet rs = null;
        %>
        	<div class="row gy-4">
        		<div class="col-4">
        			<div class="card text-bg-primary">
        				<div class="card-header">
        					Total Users
						</div>
						<div class="card-body">
						<%
							ps = con.prepareStatement("select count(id) as totalUsers from users");
							rs = ps.executeQuery();
							if(rs.next()){
						%>
							<h1><%=rs.getInt("totalUsers") %></h1>
						<%		
							}
						%>
							<h2>Users</h2>
						</div>
						<div class="card-footer">
							<a href="./DashboardUserPage.jsp" class="text-white">See Details</a>
						</div>
        			</div>
        		</div>
        		<div class="col-4">
        			<div class="card text-bg-warning">
        				<div class="card-header">
        					Total Products
						</div>
						<div class="card-body">
						<%
							ps = con.prepareStatement("select count(id) as totalProducts from products");
							rs = ps.executeQuery();
							if(rs.next()){
						%>
							<h1><%=rs.getInt("totalProducts") %></h1>
						<%		
							}
						%>
							<h2>Products</h2>
						</div>
						<div class="card-footer">
							<a href="./DashboardProductPage.jsp" class="text-black">See Details</a>
						</div>
        			</div>
        		</div>
        		<div class="col-4">
        			<div class="card text-bg-success">
        				<div class="card-header">
        					Total Orders
						</div>
						<div class="card-body">
						<%
							ps = con.prepareStatement("select count(id) as totalOrders from orders");
							rs = ps.executeQuery();
							if(rs.next()){
						%>
							<h1><%=rs.getInt("totalOrders") %></h1>
						<%		
							}
						%>
							<h2>Orders</h2>
						</div>
						<div class="card-footer">
							<a href="./Dashboardorders.jsp" class="text-white">See Details</a>
						</div>
        			</div>
        		</div>
        		<div class="col-4">
        			<div class="card text-bg-success">
        				<div class="card-header">
        					Today's Earnings
						</div>
						<div class="card-body">
						<%
							double todayTotal = 0.0;
							java.util.Date today = new java.util.Date();
							java.sql.Date todayDate = new java.sql.Date(today.getTime());
							ps = con.prepareStatement("SELECT SUM(total_amount) AS daily_total FROM orders WHERE DATE(created_at) = ?");
							ps.setDate(1, todayDate);
							rs = ps.executeQuery();
							if(rs.next()){
								todayTotal = rs.getDouble("daily_total");
								DecimalFormat df = new DecimalFormat("#,##0.00");
						%>
							<h1>&#8377; <%=df.format(todayTotal) %></h1>
						<%
							}
						%>
							<h2>Earning</h2>
						</div>
						<div class="card-footer">
							<a href="https://dashboard.razorpay.com/app/payments" target="_blank" class="text-white">See Details</a>
						</div>
        			</div>
        		</div>
        		<div class="col-4">
        			<div class="card text-bg-info">
        				<div class="card-header">
        					This Month Earnings
						</div>
						<div class="card-body">
						<%
							double MonthTotal = 0.0;
							Calendar cal = Calendar.getInstance();
							int currentMonth = cal.get(Calendar.MONTH) + 1;
							int currentYear = cal.get(Calendar.YEAR);
							ps = con.prepareStatement("SELECT SUM(total_amount) AS monthly_total FROM orders WHERE MONTH(created_at) = ? and YEAR(created_at) = ?");
							ps.setInt(1, currentMonth);
					        ps.setInt(2, currentYear);
							rs = ps.executeQuery();
							if(rs.next()){
								MonthTotal = rs.getDouble("monthly_total");
								DecimalFormat df = new DecimalFormat("#,##0.00");
						%>
							<h1>&#8377; <%=df.format(MonthTotal) %></h1>
						<%
							}
						%>
							<h2>Earning</h2>
						</div>
						<div class="card-footer">
							<a href="https://dashboard.razorpay.com/app/payments" target="_blank" class="text-black">See Details</a>
						</div>
        			</div>
        		</div>
        		<div class="col-8">
        			<div class="chart-container">
				        <canvas id="ordersChart"></canvas>
				    </div>
        		</div>
        	</div>
        </div>
      </div>
    </div>
  </div>
  

  <!-- Bootstrap 5 JS and Popper -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
  <!-- jQuery (for sidebar toggle) -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- Custom JS -->
  <script>
    $(document).ready(function () {
      $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
      });
      $('#sidebarCollapseClose').on('click', function () {
          $('#sidebar').toggleClass('active');
        });
    });

    <%
        int[] weeklyOrders = new int[5];
        Arrays.fill(weeklyOrders, 0);
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/styloxfashionhub","root","root");
            
            // Get current month and year
            Calendar cal1 = Calendar.getInstance();
            int currentMonth1 = cal1.get(Calendar.MONTH) + 1; // Months are 0-based
            int currentYear1 = cal1.get(Calendar.YEAR);
            
            // Query to get orders grouped by week of month
            String sql = "SELECT WEEK(created_at, 1) - WEEK(DATE_SUB(created_at, INTERVAL DAYOFMONTH(created_at)-1 DAY), 1) + 1 AS week_of_month, " +
                        "COUNT(*) AS order_count " +
                        "FROM orders " +
                        "WHERE MONTH(created_at) = ? AND YEAR(created_at) = ? " +
                        "GROUP BY week_of_month " +
                        "ORDER BY week_of_month";
            
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, currentMonth);
            pstmt.setInt(2, currentYear);
            
            ResultSet rs1 = pstmt.executeQuery();
            
            while(rs1.next()) {
                int week = rs1.getInt("week_of_month") - 1; // Convert to 0-based index
                if(week >= 0 && week < 5) {
                    weeklyOrders[week] = rs1.getInt("order_count");
                }
            }
            
            rs1.close();
            pstmt.close();
            conn.close();
        } catch(Exception e) {
            out.println("console.error('Error loading chart data: " + e.getMessage() + "');");
        }
        
        out.println("const weeklyOrderData = " + Arrays.toString(weeklyOrders) + ";");
    %>
    
    // Create the chart
    document.addEventListener('DOMContentLoaded', function() {
        const ctx = document.getElementById('ordersChart').getContext('2d');
        const ordersChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4', 'Week 5'],
                datasets: [{
                    label: 'Number of Orders',
                    data: weeklyOrderData,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.7)',
                        'rgba(54, 162, 235, 0.7)',
                        'rgba(255, 206, 86, 0.7)',
                        'rgba(75, 192, 192, 0.7)',
                        'rgba(153, 102, 255, 0.7)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    title: {
                        display: true,
                        text: 'Weekly Orders This Month',
                        font: {
                            size: 18
                        }
                    },
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Number of Orders',
                            font: {
                                weight: 'bold'
                            }
                        },
                        ticks: {
                            stepSize: 1
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Week of Month',
                            font: {
                                weight: 'bold'
                            }
                        }
                    }
                }
            }
        });
    });
  </script>
</body>
</html>