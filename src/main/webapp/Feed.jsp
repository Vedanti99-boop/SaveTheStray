<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
          <%@ page import = "com.SAS.UserDAO" %>
    <%@ page import = "java.sql.ResultSet" %>
              <%@ page import = "com.SAS.Rescue" %>
    <%@ page import = "java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%
	UserDAO userDao = new UserDAO();
                		  
    //String name = (String)session.getAttribute("username");
    String name = null;
    Cookie cookies[] = request.getCookies();

                			
                			for(Cookie cookie : cookies){
                				
                				if(cookie.getName().equals("username")){
                					
                					 name  = cookie.getValue();
                					 session.setAttribute("username", name);
                				}
                			}
                		  System.out.println(name);
                		  
                		  String donatedBy = null;
                			try {
                				ResultSet rs = userDao.getName(name);
                				while(rs.next()) {
                					donatedBy = rs.getString(1);
                					session.setAttribute("name", donatedBy);
                				}
                			} catch (SQLException e) {
                				// TODO Auto-generated catch block
                				e.printStackTrace();
                			}
                			
                			
                		  
%>

    <style>
 
 .header
    *{
    margin: 0;
    padding: 0;
}
.header{
    min-height: 100vh;
    width: 100%;
background: rgb(255,255,255);
    background-image: linear-gradient(rgba(4,9,30,0.7),rgba(4,9,30,0.7)),url(images/log.png);
	background-repeat : repeat-x;
    background-position: center;
    background-size: cover;
    position: relative;
 }


nav{
    display: flex;
    padding: 1% 3%;
    justify-content: space-between;
    align-items: center;
}
nav img{
    width: 50px;
    
}
.nav-links1{
    flex: 1;
    text-align: left;
}
.nav-links1 ul li{
    list-style: none;
    display: inline-block;
    padding: 13px 12px;
    position: relative;
}

.nav-links1 ul li {
    color:#fff;
    text-decoration: none;
    font-size: 16px;
}

.nav-links1 ul li::after{
    content: "";
    width: 0px;
    height:2px;
    background: #f44336;
    display: block;
    margin: auto;
    transition: 0.5s;

}
.nav-links1 ul li:hover::after{
    width: 100px;
}
.nav-links{
    flex: 1;
    text-align: right;
}
.nav-links ul li{
    list-style: none;
    display: inline-block;
    padding: 3px 12px;
    position: relative;
}

.nav-links ul li {
    color:#fff;
    text-decoration: none;
    font-size: 16px;
}

.nav-links ul li::after{
    content: "";
    width: 0px;
    height:2px;
    background: #f44336;
    display: block;
    margin: auto;
    transition: 0.5s;

}
.nav-links ul li:hover::after{
    width: 100px;
}
.dropdown-menu-min-width{
    width: 300px;
}
.input{

background-color: transparent;
background-image: none;

}
.textarea {

background-color: transparent;
background-image: none;

}
a{
	color: white;
	text-decoration : none;
}
</style>

<section class="header">
    <nav>
        <a href="index.html"> <img src="images/slog.png" >   </a>
        <div>
         <div class="nav-links1 " id="navLinks1">
             <ul>
                 <%

                			String isLoggedIn = null;
                			String username = null;
                			for(Cookie cookie : cookies){
                				
                				if(cookie.getName().equals("username")){
                					
                					username  = cookie.getValue();
                					if(username == null){
                						out.print("<li><a href = \"Login.jsp\">LOGIN</a></li>");
                    					out.print("<li><a href = \"Register.jsp\">REGISTER</a></li>");
                					}else{
                						out.print("<li> Welcome, <a href = \"Profile.jsp\"><i><b> " + donatedBy + "</b></i></a></li>");
										}
                					
                					//out.print("<li> Welcome, <a href = \"Profile.jsp\"><i><b> " + donatedBy + "</b></i></a></li>");
                					
                					}
                				if(cookie.getName().equals("isLoggedIn")){
                					if(cookie.getValue().equals("no")){
                					out.print("<li><a href = \"Login.jsp\">LOGIN</a></li>");
                					out.print("<li><a href = \"Register.jsp\">REGISTER</a></li>");
                				}
                					}
                				}	%>
             </ul>
      
          </div>
        </div>
         <div class="nav-links" id="navLinks">
             <i class="fa fa-times" onclick="hideMenu()"></i>
     
             <ul>
                   <li><a href="Home.jsp">HOME</a></li>   
                   <li><a href="">SERVICES</a></li>
                   <li><a href="About.jsp">ABOUT</a></li>
                   <li><a href="Donate.jsp">DONATION</a></li>
                          
             </ul>
         </div>
         <i class="fa fa-bars" onclick="showMenu()" ></i>
     </nav>
     <div class="columns">
     
             <div class="column is-8 has-text-white border-top border-end"><h2>&emsp;Updates</h2>
     
     <%
     String rescueID = null;
     String rescueType = null;
     String rescueDescription = null;
     String reporterContact = null;
     String rescueLocation = null;
     String rescuePhotoPath = null;
     String rescueTimestamp = null;
		try {
			ResultSet rs = userDao.getRescues();
			while(rs.next()) {
				rescueID = rs.getString(1);
				rescueType = rs.getString(2);
				rescueDescription = rs.getString(3);
				reporterContact = rs.getString(4);
				rescueLocation = rs.getString(6);
				rescuePhotoPath = rs.getString(7);
				rescueTimestamp = rs.getString(8);
				
				session.setAttribute("location", rescueLocation);
				
				
				if(rescueType.equals("Emergency")){
					out.print("<div class=\"ml-6 py-3\">"+
					"<form action=\"TakeAction\" method = \"post\"> "+
	                "<div class=\"card has-background-danger\" style=\"width: 50rem;\" >"+
	                 " <img src=\"images/rescue/"+ rescueID +".png\" class=\"card-img-top\" style=\"padding: 7px; max-height : 500px ; max-widht : 700px ; object-fit: contain; \">"+
	                 " <div class=\"card-body\">"+
	                  "  <div class=\"has-text-white\">"+
	                   " <div class=\"mx-2 my-1\">"+
	                   " <h5 class=\"card-title\">Emergency</h5> "+
	                   " <p class=\"card-text\">"+ rescueDescription +"</p>"+
	                  "</div>"+
	             "   </div>"+
	              "</div>"+
	        
	               " <div class=\" my-1\">"+
	                "  <ul class=\"list-group list-group-flush\">"+
	                 "   <li class=\"list-group-item mx-2 has-text-white\"  style=\"background-color: transparent;\"><b>Rescue ID: </b>&emsp;"+ rescueID +"</li> "+
	                  "  <li class=\"list-group-item mx-2 has-text-white\"  style=\"background-color: transparent;\"><b>Contact No: </b>&emsp;"+ reporterContact +"</li> "+
	                   " <li class=\"list-group-item mx-2 has-text-white\"  style=\"background-color: transparent;\"><b>Date & Time: </b>&emsp;"+ rescueTimestamp +"</li> "+
	              "    </ul>"+
	               "   </div>"+
	                "  <div class=\"mx-2 my-2\">"+
	                 " <div class=\"card-body\">"+
	                  "  <div class=\"buttons\">"+
	                 	"<div class = \"has-text-black py-1\">Please make sure you press the \"<b> Take Action</b>\" button <b>only if you are able to perform the rescue</b></div>"+
	                    
	                "      <button class=\"button is-success\" type=\"submit\">&emsp;&emsp;Take Action&emsp;&emsp;</button>"+
	                 "     <button class=\"button is-dark\" >&emsp;&emsp;&emsp;ignore&emsp;&emsp;&emsp;</button>"+
	                  "    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;"+
	                   "   <button class=\"button is-link is-light\" >&emsp;&emsp;Rescue Fund&emsp;&emsp;</button>"+
	                      " <input type='hidden' id='id3' name = \"rescueID\" value = "+ rescueID +" /> "+
	                    "</div> "+ 

	                "  </div>"+
	              "  </div>"+
	              "  </div>"+
	              "</form>"+
	            "</div> ");

					
				}
				
				if(rescueType.equals("Accidental Help")){
					
					out.print("<div class=\"ml-6 py-3\">"+
							"<form action=\"TakeAction\" method = \"post\"> "+
	"		                <div class=\"card has-background-warning\" style=\"width: 50rem;\">"+
	"		                  <img src=\"images/rescue/"+ rescueID +".jpg\" class=\"card-img-top\" style=\"padding: 7px;\">"+
	"		                  <div class=\"card-body\">"+
	"		                    <div class=\"mx-2 my-1\">"+
	"		                    <h5 class=\"card-title\">Accidental Help</h5>"+
	"		                    <p class=\"card-text\">"+ rescueDescription +"</p>"+
	"		                  </div>"+
	"		                </div>"+
	"		                <div class=\" my-1\">"+
	"		                  <ul class=\"list-group list-group-flush\">"+
	"		                    <li class=\"list-group-item mx-2\"  style=\"background-color: transparent;\"><b>Rescue ID: </b>&emsp;"+ rescueID +"</li>"+
	"		                    <li class=\"list-group-item mx-2\"  style=\"background-color: transparent;\"><b>Contact No: </b>&emsp;"+ reporterContact +"</li>"+
	"		                    <li class=\"list-group-item mx-2\"  style=\"background-color: transparent;\"><b>Date & Time: </b>&emsp;"+ rescueTimestamp +"</li>"+
	"		                  </ul>"+
	"		                  </div>"+
	"		                  <div class=\"mx-2 my-2\">"+
	"		                  <div class=\"card-body\">"+

	"		<div class=\"buttons\">"+
			                 	"<div class = \"has-text-black py-1\">Please make sure you press the \"<b>Take Action</b>\" button <b>only if you are able to perform the rescue</b></div>"+
			                    
			                    "  <button class=\"button is-success\" type=\"submit\">&emsp;&emsp;Take Action&emsp;&emsp;</button>"+
			                   "   <button class=\"button is-dark\">&emsp;&emsp;&emsp;ignore&emsp;&emsp;&emsp;</button>"+
			                  "    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;"+
			                 "     <button class=\"button is-link is-light\" >&emsp;&emsp;Rescue Fund&emsp;&emsp;</button>"+
			                " <input type='hidden' id='id3' name = \"rescueID\" value = "+ rescueID +" /> "+
			                "    </div>                     "+
			               "   </div>"+
			              "  </div>"+
			             "   </div>"+
			              "</form>"+
			            "  </div>");					
					
				}

				
				if(rescueType.equals("Animal Abuse")){
					
					out.print(" <div class=\"ml-6 py-3\">"+
							"<form action=\"TakeAction\" method = \"post\"> "+
"			                <div class=\"card has-background-black\" style=\"width: 50rem;\">"+
"			                  <img src=\"images/rescue/"+ rescueID +".jpg\" class=\"card-img-top\" style=\"padding: 7px;\">"+
"			                  <div class=\"card-body\">"+
"			                    <div class=\"mx-2 my-1\">"+
"			                    <h5 class=\"card-title has-text-white\">Animal Abuse</h5>"+
"			                    <p class=\"card-text has-text-white\">"+ rescueDescription +"</p>"+
"			                  </div>"+
"			                </div>"+
"			                <div class=\" my-1\">"+
"			                  <ul class=\"list-group list-group-flush\">"+
"			                    <li class=\"list-group-item mx-2 has-text-white\"  style=\"background-color: transparent;\"><b>Rescue ID: </b>&emsp;"+ rescueID +"</li>"+
"			                    <li class=\"list-group-item mx-2 has-text-white\"  style=\"background-color: transparent;\"><b>Contact No: </b>&emsp;"+ reporterContact +"</li>"+
"			                    <li class=\"list-group-item mx-2 has-text-white\"  style=\"background-color: transparent;\"><b>Date & Time: </b>&emsp;"+ rescueTimestamp +"</li>"+
"			                  </ul>"+
"			                  </div>"+
"			                  <div class=\"mx-2 my-2\">"+
"			                  <div class=\"card-body\">"+

"			                   <div class=\"buttons\">"+
"			                 	<div class = \"has-text-light py-1\">Please make sure you press the \"<b>Take Action</b>\" button <b>only if you are able to perform the rescue</b></div>"+
			                    
"			                      <button class=\"button is-success\" type=\"submit\">&emsp;&emsp;Take Action&emsp;&emsp;</button>"+
"			                      <button class=\"button is-dark\">&emsp;&emsp;&emsp;ignore&emsp;&emsp;&emsp;</button>"+
"			                      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;"+
"			                      <button class=\"button is-link is-light\">&emsp;&emsp;Rescue Fund&emsp;&emsp;</button>"+
		" <input type='hidden' id='id3' name = \"rescueID\" value = "+ rescueID +" /> "+
"			                    </div>"+ 
"			                  </div>"+
"			                </div>"+
"			                </div>"+
							"</form>"+
"			                </div>");
					
				}
				
				if(rescueType.equals("Find The Lost")){
					
	           out.print(" <div class=\"ml-6 py-3\">"+
	                
					"<form action=\"TakeAction\" method = \"post\"> "+
"	                  <div class=\"card has-background-info\" style=\"width: 50rem;\" >"+
"	                    <img src=\"images/log.png\" class=\"card-img-top\" style=\"padding: 7px;\">"+
"	                    <div class=\"card-body\">"+
"	                      <div class=\"has-text-white\">"+
"	                      <div class=\"mx-2 my-1\">"+
"	                      <h5 class=\"card-title\">Find the Lost</h5>"+
"	                      <p class=\"card-text\">"+ rescueDescription +"</p>"+
"	                    </div>"+
"	                  </div>"+
"	                </div>"+
	              
"	                  <div class=\" my-1\">"+
"	                    <ul class=\"list-group list-group-flush\">"+
"	                      <li class=\"list-group-item mx-2 has-text-white\"  style=\"background-color: transparent;\"><b>Rescue ID: </b>&emsp;"+ rescueID +"</li> "+
"	                      <li class=\"list-group-item mx-2 has-text-white\"  style=\"background-color: transparent;\"><b>Contact No: </b>&emsp;"+ reporterContact +"</li> "+
"	                      <li class=\"list-group-item mx-2 has-text-white\"  style=\"background-color: transparent;\"><b>Date & Time: </b>&emsp;"+ rescueTimestamp +"</li> "+
"	                    </ul>"+
"	                    </div>"+
"	                    <div class=\"mx-2 my-2\">"+
"	                    <div class=\"card-body\">"+

"	                    <div class=\"buttons\">"+
"	                 	<div class = \"has-text-black py-1\">Please make sure you press the \"<b>Take Action</b>\" button <b>only if you are able to perform the rescue</b></div>"+
	                    
"	                      <button class=\"button is-success\" type=\"submit\">&emsp;&emsp;Take Action&emsp;&emsp;</button>"+
"	                      <button class=\"button is-dark\">&emsp;&emsp;&emsp;ignore&emsp;&emsp;&emsp;</button>"+
"	                      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;"+
"	                      <button class=\"button is-link is-light\">&emsp;&emsp;Rescue Fund&emsp;&emsp;</button>"+
		" <input type='hidden' id='id3' name = \"rescueID\" value = "+ rescueID +" /> "+
"	                    </div> "+
"	                    </div>"+
"	                  </div>"+
"	                  </div>"+
					"</form>"+
"	              </div>");

					
				}
				
				if(rescueType.equals("Medical Help")){
					
					out.print(" <div class=\"ml-6 py-3\">"+
							"<form action=\"TakeAction\" method = \"post\"> "+
"			                <div class=\"card has-background-white\" style=\"width: 50rem;\">"+
"			                  <img src=\"images/log.png\" class=\"card-img-top\" style=\"padding: 7px;\">"+
"			                  <div class=\"card-body\">"+
"			                    <div class=\"mx-2 my-1\">"+
"			                    <h5 class=\"card-title has-text-danger\">Medical Help</h5>"+
"			                    <p class=\"card-text has-text-danger\">"+ rescueDescription +"</p>"+
"			                  </div>"+
"			                </div>"+
"			                <div class=\" my-1\">"+
"			                  <ul class=\"list-group list-group-flush\">"+
"			                    <li class=\"list-group-item mx-2 has-text-danger\"  style=\"background-color: transparent;\"><b>Rescue ID: </b>&emsp;"+ rescueID +"</li> "+
"			                    <li class=\"list-group-item mx-2 has-text-danger\"  style=\"background-color: transparent;\"><b>Contact No: </b>&emsp;"+ reporterContact +"</li>" +
"			                    <li class=\"list-group-item mx-2 has-text-danger\"  style=\"background-color: transparent;\"><b>Date & Time: </b>&emsp;"+ rescueTimestamp +"</li> "+
"			                  </ul>"+
"			                  </div>"+
"			                  <div class=\"mx-2 my-2\">"+
"			                  <div class=\"card-body\">"+

"			<div class=\"buttons\">"+
"			                 	<div class = \"has-text-black py-1\">Please make sure you press the \"<b>Take Action</b>\" button <b>only if you are able to perform the rescue</b></div>"+
			                    
"			                      <button class=\"button is-success\" type=\"submit\">&emsp;&emsp;Take Action&emsp;&emsp;</button> "+
"			                      <button class=\"button is-dark\">&emsp;&emsp;&emsp;ignore&emsp;&emsp;&emsp;</button> "+
"			                      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;"+
"			                      <button class=\"button is-link is-light\">&emsp;&emsp;Rescue Fund&emsp;&emsp;</button> "+
		" <input type='hidden' id='id3' name = \"rescueID\" value = "+ rescueID +" /> "+
"			                    </div>"+ 

"			                  </div>"+
"			                </div>"+
"			                </div>"+
							"</form>"+
"			              </div>");
					
				}
				
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
     %>

    
   <!--         <div class="ml-6 py-3">
        
                <div class="card has-background-danger" style="width: 50rem;" >
                  <img src="images/log.png" class="card-img-top" style="padding: 7px; max-height : 500px ; max-widht : 700px">
                  <div class="card-body">
                    <div class="has-text-white">
                    <div class="mx-2 my-1">
                    <h5 class="card-title">Emergency</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  </div>
                </div>
              </div>
        
                <div class=" my-1">
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">Rescue Id</li>
                    <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">Contact No</li>
                    <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">location</li>
                  </ul>
                  </div>
                  <div class="mx-2 my-2">
                  <div class="card-body">
                    <div class="buttons">
                 	<div class = "has-text-black py-1">Please make sure you press the "<b>Take Action</b>" button <b>only if you are able to perform the rescue</b></div>
                    
                      <button class="button is-success">&emsp;&emsp;Take Action&emsp;&emsp;</button>
                      <button class="button is-dark">&emsp;&emsp;&emsp;ignore&emsp;&emsp;&emsp;</button>
                      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                      <button class="button is-link is-light">&emsp;&emsp;Rescue Fund&emsp;&emsp;</button>
                      
                    </div> 

                    
                    
                   
                   <!--  <a href="#" class="card-link link-dark">Card link</a>
                    <a href="#" class="card-link link-dark">Another link</a> -->
                  <!-- </div>
                </div>
                </div>
            </div>


            

            <div class="ml-6 py-3">

                <div class="card has-background-warning" style="width: 50rem;">
                  <img src="images/log.png" class="card-img-top" style="padding: 7px;">
                  <div class="card-body">
                    <div class="mx-2 my-1">
                    <h5 class="card-title">Accidental Help</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  </div>
                </div>
                <div class=" my-1">
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item mx-2"  style="background-color: transparent;">Rescue Id</li>
                    <li class="list-group-item mx-2"  style="background-color: transparent;">Contact No</li>
                    <li class="list-group-item mx-2"  style="background-color: transparent;">Location</li>
                  </ul>
                  </div>
                  <div class="mx-2 my-2">
                  <div class="card-body">

<div class="buttons">
                 	<div class = "has-text-black py-1">Please make sure you press the "<b>Take Action</b>" button <b>only if you are able to perform the rescue</b></div>
                    
                      <button class="button is-success">&emsp;&emsp;Take Action&emsp;&emsp;</button>
                      <button class="button is-dark">&emsp;&emsp;&emsp;ignore&emsp;&emsp;&emsp;</button>
                      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                      <button class="button is-link is-light">&emsp;&emsp;Rescue Fund&emsp;&emsp;</button>
                      
                    </div>                     
                  </div>
                </div>
                </div>
              </div>

              <!-- New Post -->

         <!--      <div class="ml-6 py-3">

                <div class="card has-background-white" style="width: 50rem;">
                  <img src="images/log.png" class="card-img-top" style="padding: 7px;">
                  <div class="card-body">
                    <div class="mx-2 my-1">
                    <h5 class="card-title has-text-danger">Medical Help</h5>
                    <p class="card-text has-text-danger">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  </div>
                </div>
                <div class=" my-1">
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item mx-2 has-text-danger"  style="background-color: transparent;">Rescue Id</li>
                    <li class="list-group-item mx-2 has-text-danger"  style="background-color: transparent;">Contact No</li>
                    <li class="list-group-item mx-2 has-text-danger"  style="background-color: transparent;">Location</li>
                  </ul>
                  </div>
                  <div class="mx-2 my-2">
                  <div class="card-body">

<div class="buttons">
                 	<div class = "has-text-black py-1">Please make sure you press the "<b>Take Action</b>" button <b>only if you are able to perform the rescue</b></div>
                    
                      <button class="button is-success">&emsp;&emsp;Take Action&emsp;&emsp;</button>
                      <button class="button is-dark">&emsp;&emsp;&emsp;ignore&emsp;&emsp;&emsp;</button>
                      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                      <button class="button is-link is-light">&emsp;&emsp;Rescue Fund&emsp;&emsp;</button>
                      
                    </div> 

                  </div>
                </div>
                </div>
              </div>




              <div class="ml-6 py-3">

                <div class="card has-background-black" style="width: 50rem;">
                  <img src="images/log.png" class="card-img-top" style="padding: 7px;">
                  <div class="card-body">
                    <div class="mx-2 my-1">
                    <h5 class="card-title has-text-white">Animal Abuse</h5>
                    <p class="card-text has-text-white">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  </div>
                </div>
                <div class=" my-1">
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">Rescue Id</li>
                    <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">Contact No</li>
                    <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">Location</li>
                  </ul>
                  </div>
                  <div class="mx-2 my-2">
                  <div class="card-body">

                   <div class="buttons">
                 	<div class = "has-text-light py-1">Please make sure you press the "<b>Take Action</b>" button <b>only if you are able to perform the rescue</b></div>
                    
                      <button class="button is-success">&emsp;&emsp;Take Action&emsp;&emsp;</button>
                      <button class="button is-dark">&emsp;&emsp;&emsp;ignore&emsp;&emsp;&emsp;</button>
                      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                      <button class="button is-link is-light">&emsp;&emsp;Rescue Fund&emsp;&emsp;</button>
                      
                    </div> 
                  </div>
                </div>
                </div>
                </div>




                <div class="ml-6 py-3">
    

                  <div class="card has-background-info" style="width: 50rem;" >
                    <img src="images/log.png" class="card-img-top" style="padding: 7px;">
                    <div class="card-body">
                      <div class="has-text-white">
                      <div class="mx-2 my-1">
                      <h5 class="card-title">Find the Lost</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                  </div>
                </div>
              
                  <div class=" my-1">
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">Rescue Id</li>
                      <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">Contact No</li>
                      <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">Location</li>
                    </ul>
                    </div>
                    <div class="mx-2 my-2">
                    <div class="card-body">

                    <div class="buttons">
                 	<div class = "has-text-black py-1">Please make sure you press the "<b>Take Action</b>" button <b>only if you are able to perform the rescue</b></div>
                    
                      <button class="button is-success">&emsp;&emsp;Take Action&emsp;&emsp;</button>
                      <button class="button is-dark">&emsp;&emsp;&emsp;ignore&emsp;&emsp;&emsp;</button>
                      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                      <button class="button is-link is-light">&emsp;&emsp;Rescue Fund&emsp;&emsp;</button>
                      
                    </div> 
                    </div>
                  </div>
                  </div>
              </div> -->





    </div>
        <div class="column is-4 has-text-white border-top" style = "background-image: linear-gradient(to right, rgba(255,255,255,0), rgba(255,255,255,1));"> <h2>&emsp;My Rescues</h2><br>
        
        
            
            <!-- New Post -->

<%

Rescue rescue = new Rescue();
rescue.setUsername(username);
String getrescueID = null;
String getrescueTimestamp = null;
	try {
		ResultSet rs = userDao.getActionTaker(rescue);
		while(rs.next()) {
			getrescueID = rs.getString(1);
			getrescueTimestamp = rs.getString(3);


	out.print("<div class=\"px-6 mx-6 mb-6\" style = \"background-color:black ; opacity : 80% ; min-height: 500px\">"+
			"<form action=\"UpdateStatus\" method = \"post\"> "+
"              <div class=\"px-2\">"+
 "               <span class=\"px-3 py-3\">&emsp;&emsp;&emsp;Photo&emsp;&emsp;&emsp;&emsp;</span>"+
  "              <figure class=\"image is-4by3\">"+
 "				 <img src=\"images/rescue/"+ getrescueID +".png\">"+
	"		</figure>"+
     "         </div>"+

 "            <div class=\"px-2 py-1 pt-3\">"+
"              <span><b>Rescue Id:&emsp;</b> "+ getrescueID +"</span>"+
  "          </div>"+


 "            <div class=\"px-2 py-1 pt-3\">"+
"              <span><b>Last Updated on:&emsp;</b> "+ getrescueTimestamp +"</span>"+
  "          </div>"+



    "        <div class=\"field\">"+
   "           <label class=\"has-text-primary px-2\" >Update Current Status*</label >"+
  "            <div class=\"control px-2 py-1\">"+
 "               <div class=\"select\">"+
                  
            "      <select name = 'status' >"+
           "         <option value = 'Pending'>Pending&emsp;&emsp;&emsp;</option>"+
          "          <option value = 'In Progress'>In Progress</option>"+
         "           <option value = 'Completed'>Completed</option>"+
        "            <option value = 'Unsuccessful'>Unsuccessful</option>"+
       "           </select>           "+
      "          </div>"+
     "         </div>"+
    "        </div>"+



  "          <div class=\"field\">"+
 "           <div class=\"px-2 pb-1\">"+
   "             <span class = \"has-text-primary\">Describe the action you have taken*</span>"+
       "       </div>"+
      "        <div class=\"control\">"+
     "           <textarea class=\"textarea\" placeholder=\"Description\"></textarea>"+
    "          </div>"+
   "         </div>"+


  "          <div class=\"buttons\">"+
 "             <button class=\"button is-link is-light\">&emsp;&emsp;Update&emsp;&emsp;</button> "+
"            </div> "+

"			</form>"+
"            </div>");

		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
            %>
            
            <div class="px-6 mx-6 " style = "background-color:black ; opacity : 80% ; min-height: 500px">
              
              <div class="px-2">
                <span class="px-3 py-3">&emsp;&emsp;&emsp;Photo&emsp;&emsp;&emsp;&emsp;</span>
                <figure class="image is-4by3">
  <img src="https://bulma.io/images/placeholders/256x256.png">
</figure>
              </div>

             <div class="px-2 py-1 pt-3">
              <span><b>Rescue Id&emsp;&emsp;&emsp;</b></span>
            </div>
            
            <div class="px-2 my-1 pt-3">
              <span><b>Last Updated on&emsp;&emsp;&emsp;</b></span>
            </div>

            

            <div class="field">
              <label class="has-text-primary px-2" >Update Current Status*</label >
              <div class="control px-2 py-1">
                <div class="select">
                  
                  <select >
                    <option>Pending&emsp;&emsp;&emsp;</option>
                    <option>In Progress</option>
                    <option>Completed</option>
                    <option>Unsuccessful</option>
                  </select>           
                </div>
              </div>
            </div>



            <div class="field">
            <div class="px-2 pb-1">
                <span class = "has-text-primary">Describe the action you have taken*</span>
              </div>
              <div class="control">
                <textarea class="textarea" placeholder="Description"></textarea>
              </div>
            </div>


            <div class="buttons">
              <button class="button is-link is-light">&emsp;&emsp;Update&emsp;&emsp;</button>
            </div> 


      </div>

</div>
</body>
</html>