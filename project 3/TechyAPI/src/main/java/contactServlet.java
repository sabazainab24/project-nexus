import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FeedbackServlet")
public class contactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public contactServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<contact> feedbackList = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rcee", "root", "");
            System.out.println("Connection success");

            String selectQuery = "SELECT * FROM feedback";
            PreparedStatement preparedStatement = con.prepareStatement(selectQuery);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
           
                String comments = resultSet.getString("comments");

                feedbackList.add(new contact(name, email,comments));
            }

            resultSet.close();
            preparedStatement.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        StringBuilder jsonString = new StringBuilder("[");
        for (contact contact: feedbackList) {
            jsonString.append(contact.toString()).append(",");
        }
        if (jsonString.length() > 1) {
            jsonString.setLength(jsonString.length() - 1);
        }
        jsonString.append("]");

        PrintWriter out = response.getWriter();
        out.write(jsonString.toString());
        out.flush();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rcee", "root", "");
            System.out.println("Connection success");

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comments = request.getParameter("comments");

            String query = "INSERT INTO contact (name, email, comments) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            
            ps.setString(3, comments);

            int rowsAffected = ps.executeUpdate();

            String jsonResponse = "{\"success\": false, \"message\": \"Failed to insert contact.\"}";
            if (rowsAffected > 0) {
                jsonResponse = "{\"success\": true, \"message\": \"contact inserted successfully!\"}";
            }

            out.write(jsonResponse);

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rcee", "root", "");
            System.out.println("Connection success");

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            
            String comments = request.getParameter("comments");
            
            String query = "UPDATE feedback SET name=?, email=?, comments=? WHERE email=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
           
            ps.setString(3, comments);
            

            int rowsAffected = ps.executeUpdate();

            String jsonResponse = "{\"success\": false, \"message\": \"Failed to update feedback.\"}";
            if (rowsAffected > 0) {
                jsonResponse = "{\"success\": true, \"message\": \"Feedback updated successfully!\"}";
            }

            out.write(jsonResponse);

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rcee", "root", "");
            System.out.println("Connection success");

            String email = request.getParameter("email");
            
            String query = "DELETE FROM contact WHERE email=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            int rowsAffected = ps.executeUpdate();

            String jsonResponse = "{\"success\": false, \"message\": \"Failed to delete contact.\"}";
            if (rowsAffected > 0) {
                jsonResponse = "{\"success\": true, \"message\": \"contact deleted successfully!\"}";
            }

            out.write(jsonResponse);

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
