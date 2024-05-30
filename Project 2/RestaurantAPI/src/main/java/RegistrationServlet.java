


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

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 List<Registration> students = new ArrayList<>();

	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rcee", "root", "");
	            System.out.println("Connection success");

	            // SQL query to retrieve data from the 'student' table
	            String selectQuery = "SELECT * FROM registration";

	            // Create a PreparedStatement to execute the query
	            PreparedStatement preparedStatement = con.prepareStatement(selectQuery);

	            // Execute the query and get the result set
	            ResultSet resultSet = preparedStatement.executeQuery();

	            // Process the result set
	            while (resultSet.next()) {
	                int sid = resultSet.getInt("sid");
	                String sname = resultSet.getString("sname");
	                String email = resultSet.getString("email");
	                String password = resultSet.getString("password");
	                

	                
					// Create a Student object and add it to the list
	                students.add(new Registration(sid, sname, email, password));

	                
	                // You can use the retrieved values as needed
	               // System.out.println("SID: " + sid + ", Name: " + sname + ", email: " + email + ", Password: " + password,"number: " + number + ");
	            }

	            // Close the resources
	            resultSet.close();
	            preparedStatement.close();
	            con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	     // Convert List<Student> to JSON-like string
	        StringBuilder jsonString = new StringBuilder("[");
	        for (Registration student : students) {
	            jsonString.append(student.toString()).append(",");
	        }
	        if (jsonString.length() > 1) {
	            jsonString.setLength(jsonString.length() - 1); // Remove the trailing comma
	        }
	        jsonString.append("]");
	        // Convert the list of students to JSON
	       // String jsonResponse = new Gson().toJson(students);

	        // Set the content type to JSON
	       // response.setContentType("application/json");

	        // Write the JSON response to the client
	        PrintWriter out = response.getWriter();
	        out.write(jsonString.toString());
	        out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		// Implement logic to insert a student into the database
        // ...

    	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rcee","root","");
			System.out.println("connection success");
			String sname = request.getParameter("sname");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        

			// Create a prepared statement for inserting data
            String query = "INSERT INTO registration (sname, email, password) VALUES (?, ?, ?)";
            PreparedStatement ps = null;
            ps = con.prepareStatement(query);
            ps.setString(1, sname);
            //String email = null;
			ps.setString(2, email);
            ps.setString(3, password);
            

            // Execute the query
            int rowsAffected = ps.executeUpdate();

            // Prepare the JSON response
            String jsonResponse = "{\"success\": false, \"message\": \"Failed to insert student.\"}";
            if (rowsAffected > 0) {
                jsonResponse = "{\"success\": true, \"message\": \"Student inserted successfully!\"}";
            }

            
            out.write(jsonResponse);
			
				            con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } 
	}

		/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rcee","root","");
			System.out.println("connection success");
			System.out.println(request.getParameter("sname"));
			int sid =Integer.parseInt(request.getParameter("sid"));
			System.out.println(request.getParameter("sname")+":"+request.getParameter("password"));
				
			String sname = request.getParameter("sname");	       
	        String password = request.getParameter("password");
	        
	        
			// Create a prepared statement for inserting data
           String query="update registration set sname=?,password=?  where sid=?";
	        //String query = "INSERT INTO student (sname, email, password,number) VALUES (?, ?, ?,?)";
            PreparedStatement ps = null;
            ps = con.prepareStatement(query);
            ps.setString(1, sname);
            String email = null;
			ps.setString(2, email);
            ps.setString(3, password);
            
            ps.setInt(4, sid);
            
            // Execute the query
            int rowsAffected = ps.executeUpdate();

            // Prepare the JSON response
            String jsonResponse = "{\"success\": false, \"message\": \"Failed to update student.\"}";
            if (rowsAffected > 0) {
                jsonResponse = "{\"success\": true, \"message\": \"Student updated successfully!\"}";
            }
            PrintWriter out=response.getWriter();
            
            out.write(jsonResponse);
			
				            con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } 
    	
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rcee","root","");
			System.out.println("connection success");
			int sid =Integer.parseInt( request.getParameter("sid"));
			
			// Create a prepared statement for inserting data
            String query="delete from registration where sid=?";
	        //String query = "INSERT INTO student (sname,email, password,number) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = null;
            ps = con.prepareStatement(query);
           
            ps.setInt(1, sid);

            // Execute the query
            int rowsAffected = ps.executeUpdate();

            // Prepare the JSON response
            String jsonResponse = "{\"success\": false, \"message\": \"Failed to delete student.\"}";
            if (rowsAffected > 0) {
                jsonResponse = "{\"success\": true, \"message\": \"Student deleted successfully!\"}";
            }
            PrintWriter out=response.getWriter();
            
            out.write(jsonResponse);
			
            con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } 
	}

}
