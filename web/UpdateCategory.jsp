<%-- 
    Document   : ManageAccount
    Created on : Jun 18, 2023, 11:11:06 AM
    Author     : Hoang Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Update Category</title>
    <link rel="icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1200px-Manchester_United_FC_crest.svg.png"/>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="css/fontawesome3.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap3.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo3-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
  </head>

  <body id="reportsPage">
    <div class="" id="home">
      <div class="container mt-5">
        
        <!-- row -->
        <div class="row tm-content-row">
            
          </div>
          <div class="tm-block-col tm-col-lg-12">
            <div class="tm-bg-primary-dark tm-block tm-block-settings">
              <h2 class="tm-block-title">Update Category</h2>
              <form action="updatecategory" method="post" class="tm-signup-form row">
                <input type="hidden" name="cid" value="${c.id}"/>
                <div class="form-group col-lg-6">
                  <label for="name">Category Name</label>
                  <input
                    name="name"
                    type="text"
                    value="${c.name}"
                    class="form-control validate"
                  />
                </div>
                
                <div class="form-group col-lg-6">
                  <label class="tm-hide-sm">&nbsp;</label>
                  <button
                    type="submit"
                    class="btn btn-primary btn-block text-uppercase"
                  >
                    Update Category
                  </button>
                </div>
                
              </form>
            </div>
          </div>
        </div>
      </div>
      
    </div>

    <script src="js/jquery3-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/bootstrap3.min.js"></script>
    <!-- https://getbootstrap.com/ -->
  </body>
</html>

