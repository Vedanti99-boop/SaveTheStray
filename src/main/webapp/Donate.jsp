<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "com.SAS.UserDAO" %>
    <%@ page import = "java.sql.ResultSet" %>
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
    background-image: linear-gradient(rgba(4,9,30,0.7),rgba(4,9,30,0.7)),url(images/log.png);
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
    font-size: 20px;
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
    width: 200px;
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

::placeholder{
  color: aliceblue;
  opacity: 100%;
}

a{
	color: white;
	text-decoration : none;
}

</style>

<section class="header">
  <form action="DonationController" method = "post">

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
                					
                					out.print("<li> Welcome, <a href = \"Profile.jsp\"><i><b> " + donatedBy + "</b></i></a></li>");
                					
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
              <li><a href="">ABOUT</a></li>
              <li><a href="Donate.jsp">DONATION</a></li>
                     
        </ul>
    </div>
    <i class="fa fa-bars" onclick="showMenu()" ></i>
</nav>

<div class="section">

<div class="container">
  
    <div class="columns">

        <div class="column is-half " >
        
           
          

         
            <div class="is-size-6">
              <div class="py-6 px-6 my-6 mx-6">
               
                
                  <p class="title is-1 has-text-white-bis ">As animal lovers,</p>
                  <h2 class="subtitle is-5 has-text-grey-lighter"> many of us are looking for ways to give back and help animals.
                    There are many�ways to help to pets in need.
                   One of the most common ways people choose to assist is by donating money to charities.</h2>
                 
                   <p class="title is-2 has-text-white-bis ">Save The Stray</p>
 
                   <h2 class="subtitle is-5 has-text-grey-lighter"> 
                    always need funds to achieve their missions. 
                    A financial donation, no matter how small, can make a major difference in the lives of animals</h2>

              </p>

             </div>
           </div>
          </div>
      


        <div class="column is-half"><div class="field">
          <h1><br></h1>
          
          <div class="field">
            <label class="has-text-white" >Donation By,</label >
                          <p class="title is-3 has-text-white-bis "><%= donatedBy %></p>
                
          <div class="field">
            <div class="control">
              <label class="has-text-white">
                <input type="checkbox" name = "anonymous" value = "true">
                Donate Anonymously
              </label>
            </div>
          </div>
         
          <div class="field">
            <label class="has-text-white" >Donate To</label >
            <div class="control">
              <div class="select">
                <select name = "donateto">
                  <option>Donate To &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</option>
                  
                  <%
                  ResultSet rs = userDao.getOrganization();
                  while(rs.next()){
                	  String organization = rs.getString(1);
                	  out.println("<option value = ' " + organization +" ' >" + organization + "</option>");
                  }
                  %>
                  
                  <option>With options</option>
                </select>
              </div>
            </div>
          </div>


          <div class="field"> 
            <label class="has-text-white" >Amount </label >
            <input class="input has-icons-left has-text-light" type="number" name = "amount" placeholder="Normal">
          
          <p class="help is-success">* in Rupees</p>
              </div>
         

          <div class="field">
            <label class="has-text-white" >Message:</label >
            <div class="control">
              <textarea class="textarea has-icons-left has-text-light" type = "text" name = "message" placeholder="Textarea"></textarea>
            </div>
          </div>
 
              <button class="button is-white" type = "submit">&emsp;&emsp;Donate&emsp;&emsp;</button>


            </div>
          </div>

</div>
</div>
</form>
</section>
</body>
</html>