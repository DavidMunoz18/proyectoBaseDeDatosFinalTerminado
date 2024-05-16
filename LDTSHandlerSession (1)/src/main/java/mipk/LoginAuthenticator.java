package mipk;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginAuthenticator
 */
public class LoginAuthenticator extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginAuthenticator() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("./index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        
        String usuario = request.getParameter("usuario");
        String pass = request.getParameter("contrasenia");
        
        if (usuario == null) usuario = "";
        if (pass == null) pass = "";

       
        usuario = usuario.trim();
        pass = pass.trim();

        try {
            beanDB db = new beanDB();
            db.conectarBD(); 

            
            String query = "SELECT * FROM Usuarios WHERE usuarios Like '" + usuario + "' AND contrasenia =  AES_ENCRYPT('"+ pass + "' , '$2b$12$')";                                                                          
            		

            
            System.out.println("Consulta ejecutada: " + query); 
           
            
            String[][] resultado = db.resConsultaSelectA3(query);

            if (resultado != null && resultado.length > 0) { 
                session.setAttribute("attributo2", usuario);
                session.setAttribute("attributo1", "1");
                response.sendRedirect("index.jsp"); 
            } else { 
                response.sendRedirect("inicioSesion.jsp");
            }

            db.desconectarBD(); 
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            e.printStackTrace(); 
            response.sendRedirect("inicioSesion.jsp"); 
        }
    }
}
