<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="J Harvey">

    <title>VigLink Template- Understanding thier API</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="assets/css/simple-sidebar.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet">

</head>

<body>

    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand"><a href="#">Viglink Testing</a>
                </li>
                <li><a href="index.cfm">Link-Tester (with JS API)</a>
                </li>
                <li><a href="links.cfm">Links-Test No API</a>
                </li>
                <li><a href="catalog.cfm">Catalog Search</a>
                </li>
                <li><a href="cuid.cfm">CUI Report (with JS API)</a>
                </li>
               
            </ul>
        </div>

        <!-- Page content -->
        <div id="page-content-wrapper">
            <div class="content-header">
                <h1>
                    <a id="menu-toggle" href="#" class="btn btn-default"><i class="icon-reorder"></i></a>
                   <img src="assets/img/logo.png"> 
                </h1>
            </div>
            <!-- Keep all page content within the page-content inset div! -->
            <div class="page-content inset">
                <div class="row">
                   <h2>Links Example:</h2>
                             
                    <div class="col-md-4 well pull-right">
                        <a rel="norewrite" href="http://api.viglink.com/api/click?key=9b89208191b8d579ffdcc7520062f890&out=http://loyaltysuperstore.net&loc=http://loyaltysuperstore.com&cuid=4231215">LoyaltySuperstore.net via VigLink</a><br>
                        <a rel="norewrite" href="http://api.viglink.com/api/click?key=9b89208191b8d579ffdcc7520062f890&out=http://qa.loyaltysuperstore.com&loc=http://loyaltysuperstore.com&cuid=4231215">qa.LoyaltySuperstore.com via VigLink</a><br>
                        <a rel="norewrite" href="http://api.viglink.com/api/click?key=9b89208191b8d579ffdcc7520062f890&out=http://loyaltysuperstore.com&loc=http://loyaltysuperstore.com&cuid=4231215">LoyaltySuperstore.com via VigLink</a><br>
                    </div>
                    
                </div>
            </div>
            
            <div class="row">
                   
                    <div class="col-md-6 nolinks well pull-left">
                        <!---cfscript>
                          for (affiliate in GetProgram) 
                             writeOutput("-" & affiliate.program & " : " & affiliate.ProgramName & " " & affiliate.apiKey & "<hr>");
                          
                        </cfscript--->
 
    }
                    </div>
                    
                    
                    
                </div>
            
        </div>

    </div>

    <!-- JavaScript -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.js"></script>

    <!-- Custom JavaScript for the Menu Toggle -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("active");
    });
    </script>
    <!--- Start the Viglink --->
   
</body>

</html>