<cfscript>
if(isDefined('form.type')){
   report = '#form.type#';
   lgHeader='#form.type# Sales via VigLink';
   
} else {
   report = 'default';
   lgHeader='Sales via VigLink';
}

//local.secret ='8f2ccb2747b6870d1cac3aa35d9e3efe8421c886'; //The API Secret Key
local.secret = '';
local.api_url = 'https://publishers.viglink.com/service/v1/cuidRevenue';
month= #dateformat(now(), "MM")#;
year= #dateformat(now(), "YYYY")#;



//Gets the End Day of the Week:
function getWeekEnding(theMonth,theYear) {
    /**
     * week ending day is a friday for our purposes as the end of the business week
     * this can be modified to return a week ending on whatever day you want
    */
    var endOfWeek = 7;
    var theDay = 0;
    var i = 1;
    var arrDate = arrayNew(1);
    
    var theDate = "";
    
    // loop to find the first saturday of the month
    do {
        theDay = theDay + 1;
    } while (dayOfWeek(createDate(theYear,theMonth,theDay)) NEQ endOfWeek);
    // establish the first saturday of the month
    theDate = createDate(theYear,theMonth,theDay);
    // set the first week end date in the array
    arrDate[i] = theDate;
    /**
     * loop through the rest of the month adding seven to the date until the date
     * exceeds the end of the month
    */
    i=i+1;
    while (month(dateAdd('d',7,theDate)) EQ theMonth) {
        theDate = dateAdd('d',7,theDate);
        arrDate[i] = theDate;
        i = i + 1;
    }
    return arrDate;
}
//Get the Last Day of this Week:
function lastDayOfWeek() {
     var NumberOfDays="";
     var LastDayOfWeek = "";
     if(arrayLen(arguments) is 0) arguments.date = now();
     else arguments.date = arguments[1];
     date = trim(arguments.date);
    
     NumberOfDays = 7 - dayOfWeek(date);

     LastDayOfWeek = dateAdd("d", NumberOfDays, date);
    
     return LastDayOfWeek;
}
//Get the End of the Month Date:
function LastDayOfMonth(strMonth) {
  var strYear=Year(Now());
  if (ArrayLen(Arguments) gt 1)
    strYear=Arguments[2];
  return DateAdd("d", -1, DateAdd("m", 1, CreateDate(strYear, strMonth, 1)));
}
EndofWeeks = getWeekEnding(month, year);
WeekLastDay = dateformat(lastDayOfWeek(now(), "MM/DD/YYYY"));
MonthlastDay = dateformat(LastDayOfMonth(month, year), "MM/DD/YYYY");

</cfscript>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="J Harvey">

    <title>VigLink CUID Reporting</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="assets/css/simple-sidebar.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" media="all" type="text/css" href="assets/css/dataTables.css">

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
            <cfoutput>
            <div class="page-content inset">
                <div class="row">
                  <cfswitch expression="#report#">
   <cfdefaultcase>
      <form method="post" style="width:600px;">
    <div class="form_col"> Report Type: <select name="type" id="type">
        <option value="">Choose Viglink Report</option>
        <option value="Weekly">Weekly</option>
        <option value="Monthly">Monthly</option>
    </select>
    </div>
    <cfoutput>
    <div class="form_col" id="Week" style="display: none;">Week Endings for #monthasstring(month)#: <br>
            <select name="weekEnd">
                <cfloop array="#EndOfWeeks#" index="wk">
               <option value="#dateformat(wk, "MM/DD/YYYY")#">#dateformat(wk, "MM/DD/YYYY")#</option>
               </cfloop>
               <option value="#dateformat(WeekLastDay, "MM/DD/YYYY")#">#dateformat(WeekLastDay, "MM/DD/YYYY")#</option>
            </select>
    </div>
    <div class="form_col" id="Month" style="display: none;"> End of Month:<bR>
            <select name="MonthEnd">
                <!---option value="#MonthLastDay#">#MonthLastDay#</option--->
                <cfloop from="1" to="12" index="mon">
                <option value="#dateformat(LastDayOfMonth(mon, year), "MM/DD/YYYY")#" <cfif #month# EQ #mon#>selected="selected"</cfif>>#dateformat(LastDayOfMonth(mon, year), "MM/DD/YYYY")#</option>
                </cfloop>
            </select>
        
    </div>
    </cfoutput>
    <div class="form_col" id="controller" style="display: none; padding-top:13px;"><input type="submit" value="search"></div>
   	<br style="clear:both;"/>
	
   </form>
   </cfdefaultcase>
   
   <cfcase value="weekly">
      <cfscript>
         local.lastDate = '#dateFormat(form.weekEnd, "YYYY/MM/DD")#'; //If the Date is the for the Week, or Month It needs to be the Last day of the Week or 
         local.period = 'week'; //Day, Week, or Month
         viglink = new http();
         viglink.setMethod("get");
         viglink.setURL("#local.api_url#?lastDate=#local.lastDate#&period=#local.period#&secret=#local.secret#");
         VigLinkCUIData = viglink.send().getPrefix().FileContent;
      </cfscript>
     <cfoutput>
         
         <cfset json = ToString(VigLinkCUIData) />
         <cfif !IsJSON(json)>
         <cfthrow errorCode="400" type="ArgumentException" message="#"Invalid JSON string: " & json#" />
         </cfif>

         <cfset VigLinkObject = DeserializeJSON(VigLinkCUIData) />
         <!---cfdump var="#VigLinkObject#"--->

         <table id="WeeklyCommissions" class="display" cellspacing="0" width="100%">
             <thead>
             <td>Transaction Date</td>
             <td>Member</td>
             <td></td>
             <td></td>
             <td>Earnings</td>
             </thead>
             
             <tbody>
            
             <cfloop collection ="#VigLinkObject#" item = "VLTrans">
                <cfscript>
                total = 0;
              for (key in VigLinkObject) {
                TransDate = dateformat(key, "MM/DD/YYYY");
                
                myarray=VigLinkObject[key];
                for (i=1;i <= ArrayLen(myarray);i++) {
                  for (key2 in myarray[i]) {
                    TransMember =  key2;
                    TransAmount = myarray[i][key2];
                  }
                totalMonthlyPayout = (Total + TransAmount);
                }

              }  
             
             //Now We Query for the Mall Name from the Collected TransMember above:
             /*SQL = "";
             GetMemberInfo = new Query(sql=SQL).execute().getResult();*/
                  
            </cfscript>
             <tr>
               <td>#TransDate#</td>
               <td>#transmember#</td>
               <td></td> 
               <td></td> 
               <td>#DollarFormat(TransAmount)#</td>   
             </tr>  
             </cfloop>
             
             </tbody>
             
             <tfoot>
             <tr>
                 <td colspan="4" style="text-align: right;">Total Payout for Week Ending <strong>#form.weekEnd#</strong></td>
                 <td>#dollarFormat(totalMonthlyPayout)#</td>
             </tr>
             </tfoot>
         </table>
         
         
         
         

      </cfoutput>
   </cfcase>
   
   <cfcase value="monthly">
      <cfscript>
         local.lastDate = '#dateFormat(form.MonthEnd, "YYYY/MM/DD")#'; //If the Date is the for the Week, or Month It needs to be the Last day of the Week or 
         local.period = 'month'; //Day, Week, or Month
         viglink = new http();
         viglink.setMethod("get");
         viglink.setURL("#local.api_url#?lastDate=#local.lastDate#&period=#local.period#&secret=#local.secret#");
         VigLinkCUIData = viglink.send().getPrefix().FileContent;
      </cfscript>
      <cfoutput>
         
         <cfset json = ToString(VigLinkCUIData) />
         <cfif !IsJSON(json)>
         <cfthrow errorCode="400" type="ArgumentException" message="#"Invalid JSON string: " & json#" />
         </cfif>

         <cfset VigLinkObject = DeserializeJSON(VigLinkCUIData) />
         <!---cfdump var="#VigLinkObject#"--->

         <table id="MonthlyCommissions" class="display" cellspacing="0" width="100%">
             <thead>
             <td>Transaction Date</td>
             <td>Member</td>
             <td></td>
             <td></td>
             <td>Earnings</td>
             </thead>
             
             <tbody>
            
             <cfloop collection ="#VigLinkObject#" item = "VLTrans">
                <cfscript>
                total = 0;
              for (key in VigLinkObject) {
                TransDate = dateformat(key, "MM/DD/YYYY");
                
                myarray=VigLinkObject[key];
                for (i=1;i <= ArrayLen(myarray);i++) {
                  for (key2 in myarray[i]) {
                    TransMember =  key2;
                    TransAmount = myarray[i][key2];
                  }
                totalMonthlyPayout = (Total + TransAmount);
                }

              }  
             
             //Now We Query for the Mall Name from the Collected TransMember above:
             /*SQL = "";
             GetMemeberInfo = new Query(sql=SQL).execute().getResult();*/
                  
            </cfscript>
             <tr>
               <td>#TransDate#</td>
               <td>#transmember#)</td>
               <td></td> 
               <td></td> 
               <td>#DollarFormat(TransAmount)#</td>   
             </tr>  
             </cfloop>
             
             </tbody>
             
             <tfoot>
             <tr>
                 <td colspan="4" style="text-align: right;">Total Payout for <strong>#monthasstring(month)#</strong></td>
                 <td>#dollarFormat(totalMonthlyPayout)#</td>
             </tr>
             </tfoot>
         </table>
         
         
         
         

      </cfoutput>
   </cfcase>
</cfswitch>
                    
                  
                  
                  
                    
                </div>
            </div>
            </cfoutput>
           
            
        </div>

    </div>

    <!-- JavaScript -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script type="text/javascript" src="assets/js/dataTables.js"></script>

    <!-- Custom JavaScript for the Menu Toggle -->
    <script>
    
   $(function() { 
   $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("active");
    });
   
   
   <cfif #report# is "default">
   $('#type').on('change', function(){
      Report = $( "#type option:selected" ).val();
      if(Report === 'Weekly'){
         $('#Week, #controller').fadeIn();
         $('#Month').fadeOut();
         
      } else if (Report === 'Monthly'){
         $('#Week').fadeOut();
         $('#Month, #controller').fadeIn();
      } else {
         $('#Week, #Monthly, #controller').fadeOut();
      }
   });
   </cfif>
   
   <cfif #report# is "monthly">
   var GTable = $('#MonthlyCommissions').dataTable({
                        'lengthMenu': [[10, 25, 50, 100, -1], [10, 25, 50, 100, 'All']],
                        'pageLength': 50,
                        'stateSave': true,
                        'width': '1170px',
                        'scrollY': '375px',
                        'language': {
                           'infoEmpty': 'No Commissions to show',
                           'emptyTable': 'No Comissions to show',
                           'lengthMenu': '_MENU_ Items'
                           },
                        'columnDefs': [
                              { 'orderable': false, 'targets': 0 }
                        ]
                        });
                        
                        
   </cfif>
   
   <cfif #report# is "weekly">
   var GTable = $('#WeeklyCommissions').dataTable({
                        'lengthMenu': [[10, 25, 50, 100, -1], [10, 25, 50, 100, 'All']],
                        'pageLength': 50,
                        'stateSave': true,
                        'width': '1170px',
                        'scrollY': '375px',
                        'language': {
                           'infoEmpty': 'No Commissions to show',
                           'emptyTable': 'No Comissions to show',
                           'lengthMenu': '_MENU_ Items'
                           },
                        'columnDefs': [
                              { 'orderable': false, 'targets': 0 }
                        ]
                        });
                        
                        
   </cfif>
   
}); 
 
    
    
    </script>
    <!--- Start the Viglink --->
   
</body>

</html>
