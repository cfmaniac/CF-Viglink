<cfscript>
   

  function GetVigLinkCatalog(required string keyword){
               //these are required:
               viglinkAPIKey = '9b89208191b8d579ffdcc7520062f890';
               keyword = 'dewalt'; 
               
               vigLinkCatalog = new http();
               vigLinkCatalog.setMethod('get');
               vigLinkCatalog.setUrl('http://catalog.viglink.com/vigcatalog/products.xml?key=' & viglinkAPIKey & '&keyword=' & keyword);
               vigLinkContent = vigLinkCatalog.send().getPrefix(); 
               Catalog = viglinkContent.fileContent;
               
               return Catalog;
  } 


</cfscript>
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
                <li><a href="index.cfm">Link-Tester</a>
                </li>
                 <li><a href="cuid.cfm">CUI Report (with JS API)</a>
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
                <cfscript>
               
               Writeoutput(getviglinkcatalog('Dewalt'));
               </cfscript>
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
    <script type="text/javascript">
  var vglnk = { key: '9b89208191b8d579ffdcc7520062f890' };

  (function(d, t) {
    var s = d.createElement(t); s.type = 'text/javascript'; s.async = true;
    s.src = '//cdn.viglink.com/api/vglnk.js';
    var r = d.getElementsByTagName(t)[0]; r.parentNode.insertBefore(s, r);
  }(document, 'script'));
</script>
</body>

</html>