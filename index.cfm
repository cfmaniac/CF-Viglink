<cfscript>
/*GetProgram = queryNew("mallID, Program, ProgramName, APIKEY", "cf_sql_integer, cf_sql_varchar, cf_sql_varchar, cf_sql_varchar",
        [[ 1, "VGL", "VigLink", "9b89208191b8d579ffdcc7520062f890" ]
        ]);*/   
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
                <li><a href="index.cfm">Link-Tester (with JS API)</a>
                </li>
                 <li><a href="cuid.cfm">CUI Report (with JS API)</a>
                </li>
                <li><a href="links.cfm">Links-Test No API</a>
                </li>
                <li><a href="catalog.cfm">Catalog Search</a>
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
                    <div class="col-md-4 nolinks well pull-left">
                        <p class="">Viglink.com with <pre>nolinks</pre> class on parent div</p>
                        <a rel="norewrite" href="http://api.viglink.com/api/click?key=9b89208191b8d579ffdcc7520062f890&out=http://loyaltysuperstore.net&loc=http://loyaltysuperstore.com&cuid=4231215">LoyaltySuperstore.net via VigLink</a><br>
                        <a rel="norewrite" href="http://api.viglink.com/api/click?key=9b89208191b8d579ffdcc7520062f890&out=http://qa.loyaltysuperstore.com&loc=http://loyaltysuperstore.com&cuid=4231215">qa.LoyaltySuperstore.com via VigLink</a><br>
                        <a rel="norewrite" href="http://api.viglink.com/api/click?key=9b89208191b8d579ffdcc7520062f890&out=http://loyaltysuperstore.com&loc=http://loyaltysuperstore.com&cuid=4231215">LoyaltySuperstore.com via VigLink</a><br>
                    <p>The Result here is just a Standard Hyperlink to the Resource.</p>
                    </div>
                    
                    <div class="col-md-4 well pull-right">
                        <p class="">VigLink.com Links with <pre>norewrite</pre> attribute:</p>
                        <a rel="norewrite" href="http://api.viglink.com/api/click?key=9b89208191b8d579ffdcc7520062f890&out=http://loyaltysuperstore.net&loc=http://loyaltysuperstore.com&cuid=4231215">LoyaltySuperstore.net via VigLink</a><br>
                        <a rel="norewrite" href="http://api.viglink.com/api/click?key=9b89208191b8d579ffdcc7520062f890&out=http://qa.loyaltysuperstore.com&loc=http://loyaltysuperstore.com&cuid=4231215">qa.LoyaltySuperstore.com via VigLink</a><br>
                        <a rel="norewrite" href="http://api.viglink.com/api/click?key=9b89208191b8d579ffdcc7520062f890&out=http://loyaltysuperstore.com&loc=http://loyaltysuperstore.com&cuid=4231215">LoyaltySuperstore.com via VigLink</a><br>
                        <p>The Result here is that it maintains the complete api.viglink.com link</p>
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