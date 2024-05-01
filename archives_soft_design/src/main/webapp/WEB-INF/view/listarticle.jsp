<%@page import="com.archives_soft_design.entity.Article"%>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Article</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="myProjects/webProject/icofont/css/icofont.min.css">

<style>

.flex {
    display: flex;
    justify-content: space-between;
    align-items: center;
        margin-bottom:1rem;
    
}
.article{

 display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top:1rem;
}


</style>
</head>
<body>



<div class="container">


<div class="article">

<div> <h5>Article</h5></div>
<div>
<a href="addarticle" class="btn btn-primary">Add article</a>

</div>


</div>
<br>

<div class="flex">
<div class="first">
<span>shows</span>
<select id="mySelect">
  <option value="option1">10</option>
  <option value="option2">20</option>
  <option value="option3">30</option>
  <option value="option4">40</option>
</select>
   &nbsp;
<span>entries</span>
</div>


<div class="second">

<label>Search:</label><input type="search....." >



</div>

</div>

<table class="table">
  <thead>
    <tr>
      <th scope="col">Title</th>
      <th scope="col">Date</th>
      <th scope="col">Author</th>
      <th scope="col">Preference</th>
            <th scope="col">status</th>
                        <th scope="col">Published on connect</th>
                                    <th scope="col">Actions</th>
                        
            
      
    </tr>
  </thead>
 <tbody>
  <% for (Article article : (List<Article>) request.getAttribute("articles")) { %>
                    <tr>
                        <td><%= article.getTitle() %></td>
                                                <td><%= article.getArticledate() %></td>
                        
                        <td><%= article.getAuthor() %></td>
                        <td><%= article.getPreference() %></td>
                        <td><%= article.getStatus() %></td>
                                                <td><%= article.getPublished_on_connect() %></td>
                        
                                                <td></td>
                        
                        <td class="text-center">
    <div style="display: flex; flex-direction: row;">
    
    
     
      <!-- HTML code -->
<form id="deleteForm" action="/delete-article" method="post">
    <input type="hidden" id="articleId" name="articleId" value="<%= article.getId() %>">
    <button type="submit" class="btn btn-link delete-icon">
        <img src="assets/ui-delete.svg" style="width: 20px;" alt="Delete">
    </button>
</form>
      
     
   <a href="edit?articleId=<%= article.getId() %>" class="btn btn-link">
    <img src="assets/edit.svg" style="width: 20px;" alt="Edit">
</a>
   
    </div>
    <div style="display: flex; flex-direction: row;">
<a href="viewui?articleId=<%= article.getId() %>" class="btn btn-link">
    <div style="margin-right: 5px;"><img src="assets/eye-alt.svg" style="width: 20px;"></div>
</a>
<a href="viewui?articleId=<%= article.getId() %>" class="btn btn-link">
    <div style="margin-right: 5px;"><img src="assets/eye-alt.svg" style="width: 20px;"></div>
</a>      
     
    </div>
</td>
                        
                    </tr>
                <% } %></tbody>
 

</table>

   <% int currentPage = (int) request.getAttribute("currentPage"); %>
      <% int totalPages = (int)request.getAttribute("totalPages"); %>
   

<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-end">
    <li class="page-item <%= currentPage == 0 ? "disabled" : "" %>">
      <a class="page-link" href="?page=<%= currentPage - 1 %>">Previous</a>
    </li>
    <% for (int i = 0; i < totalPages; i++) { %>
      <li class="page-item <%= currentPage == i ? "active" : "" %>">
        <a class="page-link" href="?page=<%= i %>"><%= i + 1 %></a>
      </li>
    <% } %>
    <li class="page-item <%= currentPage == totalPages - 1 ? "disabled" : "" %>">
      <a class="page-link" href="?page=<%= currentPage + 1 %>">Next</a>
    </li>
  </ul>
</nav>




</div>

<!-- delete logic
 -->
<script >





document.querySelectorAll('.delete-icon').forEach(deleteIcon => {
    deleteIcon.addEventListener('click', function() {
        const articleId = this.getAttribute('data-article-id');
        if (confirm('Are you sure you want to delete this article?')) {
            fetch(`/delete-article/${articleId}`, {
                method: 'DELETE'
            })
            .then(response => {
                if (response.ok) {
                    // Article deleted successfully, update UI or reload page
                    location.reload(); // For example, reload the page
                } else {
                    // Handle error
                    console.error('Failed to delete article');
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }
    });
});












</script>

</body>
</html>