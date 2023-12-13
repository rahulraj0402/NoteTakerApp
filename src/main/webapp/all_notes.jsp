<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all notes : Note Taker</title>
 <%@include file="all_js_css.jsp" %>

</head>
<body>


 
 		
 		
 		
 		
 		<div class="container">
 			
 			<%@include file="navbar.jsp" %>
 			<br>
 			<h1 class="text-uppercase">All notes </h1>
 			
 			
 			
 		<div class="row">
 			
 			  <div class="col-12">
 			
 			   <%
 			
 			   Session s = FactoryProvider.getFactory().openSession();
 			   Query q=s.createQuery("from Note");
 			   List<Note> list = q.list();
 			
 			   for(Note note : list){
 				   
 				%>   
 				
 				 <div class="card" >
                     <img class="card-img-top m-4 mx-auto" style="max-width:100px;" src="image/notebook.png" alt="Card image cap">
                       <div class="card-body">
                          <h5 class="card-title"><%= note.getTitle() %></h5>
                          <p class="card-text"><%= note.getContent() %></p>
                          <p style="text-align: right;"> Added date : <b class="text-primary"><%= note.getAddedDate() %></b></p> 
                           <div class="container text-center mt-2" >
                            <a href="deleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
                            <a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
                            <a href="addNotes.jsp" class="btn btn-primary"  style="background-color: yellow; color: black; border: none;"onmouseover="this.style.backgroundColor='darkyellow'"onmouseout="this.style.backgroundColor='yellow'">Add another note</a>
                          </div>
                       </div>
                  </div>
 				
 				
 				<% 
 			   }
 			
 			
 			   s.close();
 			
 			   %>
 			
 			
 			
 			 </div>
 			  
 		</div>
 			
 			
 			
 			
 			
 		</div>
 
 
 


</body>
</html>




<%-- 
 <div class = "container">
 	<%@include file="navbar.jsp" %>
 	<br>
 	<h1 class="text-uppercase">All Notes</h1>
 	
 	<div class="row">
 		
 		<div class="col-12">
 		
 		<%
 		Session s = FactoryProvider.getFactory().openSession();
 		Query q=s.createQuery("From Note");
 		List<Note> list =q.list();
 		
 			
 			%>
 			
 			
 			
 			<div class="card mt-3" >
              <img class="card-img-top m-4 mx-auto" style="max-width:100px;" src="image/notebook.png" alt="Card image cap">
                <div class="card-body px-5">
                  <h5 class="card-title"><%= note.getTitle() %></h5>
                   <p class="card-text">
                   
                    <%= note.getContent() %>
                    
                    </p>
                   <p style="text-align: right;"> Added date : <b class="text-primary"><%= note.getAddedDate() %></b></p> 
                   
                    
                    <div class="container text-center mt-2" >
                    	<a href="deleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
                        <a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
                       <a href="addNotes.jsp" class="btn btn-primary" 
   style="background-color: yellow; color: black; border: none;"
   onmouseover="this.style.backgroundColor='darkyellow'"
   onmouseout="this.style.backgroundColor='yellow'">Add another note</a>
                       
                        
                        
                        
                     </div>
                   
                 </div>
             </div>
 			
 			
 			
 			
 		
 		
 		
 	<% 	
 		}
 	
 		s.close();
 	%>
 		</div>
 		
 	</div>
 	
 	
 	 --%>
  </div>