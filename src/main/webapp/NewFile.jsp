<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Color Selector</title>
</head>
<body>
    <table border="1">
        <tr>
            <th>Colors from Database:</th>
        </tr>
        <%
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            int selectedId = 1; // Change this ID as needed
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/styloxfashionhub", "root", "root");
                String query = "SELECT colors FROM products WHERE id = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, selectedId);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    String colorString = rs.getString("colors").trim();
                    String[] colorsArray = colorString.split(",");
        %>
                    <form method="post">
                        <table border="1">
                            <tr>
                                <th>Select a color:</th>
                            </tr>
                            <%
                                for (String color : colorsArray) {
                                    color = color.trim();
                            %>
                                    <tr>
                                        <td>
                                            <input type="radio" name="color" value="<%= color %>"> <%= color %>
                                        </td>
                                    </tr>
                            <%
                                }
                            %>
                        </table>
                    </form>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>
    </table>
</body>
</html>
