


<%@page import="com.archives_soft_design.entity.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add article</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <style>
        #drop-zone {
            width: 300px;
            height: 200px;
            border: 2px dashed #ccc;
            border-radius: 5px;
            padding: 20px;
            text-align: center;
            font-size: 18px;
        }
        #drop-zone.hover {
            border-color: #007bff;
            background-color: #f0f9ff;
        }
       .flex {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

    </style>
</head>
<body>

<div class="container mt-6" style="margin-top: 6rem;">
   <% Article article = (Article) request.getAttribute("article"); %>


<div class="flex">
    <div><h3>Update article(CeFpro Connect Section)</h3></div>
    <div>
        <button class="btn btn-success" type="submit">Save</button>
<a href="listarticle" class="btn btn-primary">List</a>    </div>
</div>
<hr class="border border-primary border-3 opacity-75">

    <form id="articleForm" action="/update-article" method="post">
    
            <input type="hidden" name="id" value="<%= article.getId() %>">
              <input type="hidden" name="preference" value="<%= article.getPreference() %>">
                <input type="hidden" name="status" value="<%= article.getStatus() %>">
                  <input type="hidden" name="published_on_connect" value="<%= article.getPublished_on_connect()%>">
                   
                        
            
             <!-- Include article ID as a hidden field -->
    
    <table class="table">
        <thead>
            <tr>
                <th scope="col">Title</th>
                <th scope="col">Authors</th>
                <th scope="col">Public Url</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="text" name="title" placeholder="" value="<%= article.getTitle() %>"  required></td>
                <td><input type="text" name="author" placeholder="search" value="<%= article.getAuthor()%>"></td>
                <td><input type="text" name="publicurl" placeholder="" value="<%= article.getPublicurl() %>"></td>
            </tr>
            <tr>
                <th scope="col">Article Date</th>
                <th scope="col">Access Category</th>
                <th scope="col">Free View Expiry</th>
            </tr>
            <tr>
                <td><input type="date" name="articledate" placeholder="" value="<%= article.getArticledate() %>"></td>
                <td><input type="text" name="accesscategory" placeholder="Free" value="<%= article.getAccesscategory() %>"></td>
                <td><input type="date" name="freeviewexpiry" placeholder="" value="<%= article.getFreeviewexpiry() %>"></td>
            </tr>
            <tr>
                <th scope="col">Description</th>
                <th scope="col">Featured Image</th>
                <th scope="col">pdf/image</th>
            </tr>
            <tr>
                <td><textarea rows="8" cols="50" name="description" value="<%= article.getDescription() %>"></textarea></td>
                <td>
                    <div id="drop-zone1" ondragover="handleDragOver(event)" ondragleave="handleDragLeave(event)" ondrop="handleDrop(event)">
                        Drop files here or click to select
                        <img src="assets/uploadcloud.png" width="100px"><br>
                        <input type="file" name="featuredimage" id="file-input1" style="display: none;" onchange="handleFileSelect(event)" value="<%= article.getFeaturedimage() %>">
                        <label for="file-input1" style="cursor: pointer;">Select file from local system</label>
                    </div>
                </td>
                <td>
                    <div id="drop-zone2" ondragover="handleDragOver(event)" ondragleave="handleDragLeave(event)" ondrop="handleDrop(event)">
                        Drop files here or click to select
                        <img src="assets/uploadcloud.png" width="100px"><br>
                        <input type="file" name="pdf_image" id="file-input2" style="display: none;" onchange="handleFileSelect(event)" value="<%= article.getPdf_image() %>">
                        <label for="file-input2" style="cursor: pointer;">Select file from local system</label>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <div><button class="btn btn-success" type="submit">Save</button>&nbsp;<a href="listarticle" class="btn btn-primary">List</a>
    </div>
</form>













</div>

<script>
    // Function to handle form submission
    function submitForm() {
        document.getElementById("articleForm").submit();
    }

    // Event listener for the "Save" button
    document.querySelector(".btn-primary").addEventListener("click", function(event) {
        event.preventDefault(); // Prevent the default form submission
        submitForm(); // Call the function to submit the form
    });
</script>










<%
    String alertMessage = (String) request.getAttribute("alertMessage");
    String alertType = (String) request.getAttribute("alertType");
%>

<%-- Display the alert message using JavaScript --%>
<script>
    <%-- Check if there's an alert message --%>
    <% if (alertMessage=="success" && !alertMessage.isEmpty()) { %>
        <%-- Display alert using JavaScript --%>
        alert("<%= alertMessage %>");
    <% } %>
</script>





<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>







<script>
        function handleDragOver(event) {
            event.preventDefault();
            event.stopPropagation();
            event.dataTransfer.dropEffect = 'copy'; // Explicitly show this is a copy.
            document.getElementById('drop-zone').classList.add('hover');
        }

        function handleDragLeave(event) {
            event.preventDefault();
            event.stopPropagation();
            document.getElementById('drop-zone').classList.remove('hover');
        }

        function handleDrop(event) {
            event.preventDefault();
            event.stopPropagation();
            document.getElementById('drop-zone').classList.remove('hover');

            var files = event.dataTransfer.files;
            handleFiles(files);
        }

        function handleFiles(files) {
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                console.log('File:', file);
                // Here you can handle the file, for example, upload it to the server.
            }
        }
    </script>

</body>
</html>