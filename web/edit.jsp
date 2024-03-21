<%-- 
    Document   : edit
    Created on : Jul 12, 2023, 3:24:09 PM
    Author     : chi
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <title>Admin</title>
    </head>
    <body>
                <div class="modal-content">
                    <form action="edit" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" value="${o.name}" name="name" class="form-control" required>
                                <input type="text" hidden value="${o.id}" name="id" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="text" value="${o.image}" name="image" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Brand</label>
                                <select name="brand">
                                    <c:forEach var="o" items="${brand}">
                                        <option ${o.id==o.id?'selected':''} value="${o.id}">${o.name}</option>

                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category">
                                    <c:forEach var="o" items="${category}">
                                        <option ${o.id==o.id?'selected':''}  value="${o.id}">${o.name}</option>

                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="text" value="${o.price}" name="price" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Stock</label>
                                <input type="number"value="${o.stock}" name="stock" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required>${o.description}</textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
    </body>
    
    <script src="lib/ckeditor/ckeditor.js" type="text/javascript"></script>
    <script type="text/javascript">
        CKEDITOR.replace('description');
    </script>
    
</html>
