
<%@page import="java.util.Base64"%>
<%@page import="com.archives_soft_design.entity.Article"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style >


.container {
    display: flex;
}

.column {
    padding: 10px;
    border: 1px solid #ccc;
}

.column-80 {
    flex: 70%;
}

.column-20 {
    flex: 30%;
}

.main{
display:flex;}
.first{
flex:50%}
.second{
flex:50%}


</style>
</head>
<body  style="margin-top: 3rem;">

<h3 class="text-center">View UI</h3>

<div class="container">


    <div class="column column-80">
    <h3>View Article</h3>
   
   
   <table class="table">
  <thead>
    <tr>
      <th scope="col">Title</th>
      <th scope="col">Description</th>
      <th scope="col">Banner</th>
      <th scope="col"></th>
     
                        
            
      
    </tr>
  </thead>
  <tbody>
   <% Article article = (Article) request.getAttribute("article"); %>
    <tr>
        <td><%= article.getTitle() %></td>
        <td><%= article.getDescription() %></td>
        <td>
    <img src="data:image/png;base64, <%= Base64.getEncoder().encodeToString(article.getFeaturedimage()) %>" alt="Featured Image">

        </td>
    </tr>
                </tbody>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  <tr>
  
  <td></td>
  
  </tr>
  
  <tr> <th scope="col">Public Url</th>
  
  <th scope="col">Article Date</th>
    <th scope="col">Show On Connect</th>
    <th scope="col">status</th>
  
  </tr>
  
    <tr>
        <td><%= article.getPublicurl() %></td>
        <td><%= article.getArticledate() %></td>
        <td></td>
                <td><%= article.getStatus() %></td>
        
        
    </tr>
  
  
  
  
  
  </tbody>
   </table>
   
   
    </div>
    
    
    
    
    
    
    
    
    
    <div class="column column-20">
    <h5>Action</h5>
    <table class="table">
    
   <tbody>
    <tr>
        <td>
            <div class="d-flex flex-column">
            
                <button class="btn btn-danger mb-1">Deactivate</button>
                <a href="listarticle" class="btn btn-success mb-1">List
</a>

  <a href="edit?articleId=<%= article.getId() %>" class="btn btn-warning mb-1">Edit
</a>

<a href="addarticle" class="btn btn-secondary mb-1">Add
</a>
                <button class="btn btn-info">Connect Preview</button>
            </div>
        </td>
    </tr>
</tbody>

   
    </table>
    </div>
    
    
   
    
</div>



<!-- 

two new div for last each with 50% width
  -->

<div class="main container">

<div class=" column first">


   
   <table class="table">
   <thead>
   
     <tr>
      <th scope="col">Created On</th>
      <th scope="col">Created By</th>
      <th scope="col">Updated On</th>
      <th scope="col">Updated By</th>
     
                        
            
      
    </tr>
   </thead>
   
   <tbody>
    <tr>
        <td><%= article.getCreatedon() %></td>
        <td><%= article.getCreatedby() %></td>
        <td><%= article.getUpdatedon() %></td>
                <td><%= article.getUpdatedby() %></td>
        
    </tr>
   
   
   </tbody>
   
   
   
   
   
   
   
   </table>
   
   
   
   
   
   







</div>
<div class=" column second">


<h5>Action Speakers</h5>
<table class="table">
<thead>
<tr><th>Authors</th>
<th>Action</th>

</tr>

</thead>

</table>

</div>

</div>



















</body>
</html>