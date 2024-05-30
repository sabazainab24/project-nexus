

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String res="";
    	// Fetching parameters from the login form
        String email = request.getParameter("email");
        String password = request.getParameter("password");
System.out.println(email+password);
        // Database credentials
        String jdbcUrl = "jdbc:mysql://localhost:3306/rcee";
        String dbUsername = "root";
        String dbPassword = "";

        // SQL query to check if the email and password match
        String query = "SELECT * FROM registration WHERE email = ? AND password = ?";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            // Set parameters for the query
            statement.setString(1, email);
            statement.setString(2, password);

            // Execute the query
            ResultSet resultSet = statement.executeQuery();
            
            // If a row is returned, it means the email and password match
            if (resultSet.next()) {
            	String emailid=resultSet.getString("email");
            	
            	System.out.println(email);
            	HttpSession hp=request.getSession();
            	hp.setAttribute("email", emailid);
            	
            	res="Valid User";
              
            } else {
            	res="Invalid User";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database connection errors or SQL errors
            // You may redirect to an error page or display an error message
            response.sendRedirect("Registration.jsp");
        }
        PrintWriter p=response.getWriter();
        p.write(res);
    }
}
