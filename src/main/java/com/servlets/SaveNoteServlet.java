package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.*;




public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    public SaveNoteServlet() {
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		try {
		
			
			// fetch the title and content
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note = new Note(title, content, new Date());
			
//			System.out.println(note.getId()+ " : " + note.getTitle());
			
			// save the data to database ....
			
			Session s =  FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			
			s.persist(note);
			tx.commit();
			s.close();
			
			response.setContentType("text/html");
			
			PrintWriter out = response.getWriter();
			out.print("<h1 style='text-align:center;'> note is added successfullt </h1>");
			out.print("<h1 style='text-align:center;'> <a href='all_notes.jsp'> view all notes</a>  </h1>");
			out.print("<div style='text-align:center;'><img src='image2/thumbs-up.png' alt='Image'></div>");
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}

}
