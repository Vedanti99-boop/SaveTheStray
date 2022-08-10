<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
            <li><a href = "Login.jsp">LOGIN</a></li>
            <li><a href = "Register.jsp">REGISTER</a></li>
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
<form action="LoginController" method = "post">
        <div class="container">
          
            <div class="columns">
        
               
              
                <div class="column is-half " >
                
            <div class="is-size-6">
                <div class="py-6 px-6 my-6 mx-6">
                    <div class="py-6 px-6 my-6 mx-6">
                 
                    <p class="title is-2 has-text-white-bis ">Welcome Back!
                  <center>  <h2 class="subtitle is-5 has-text-grey-lighter"> 
                    <p>    To Keep Connected With Us Please Login With Your Personal Info.
                     </h2></center>
        </p>
                 
                  </div>
    
</div>
</div>
</div>


         


        <div class="column is-half">
          <h1><br><br><br></h1>

         <center> <h2 class="title is-2 has-text-white">Login</h2></center>

          <div class="field">
            <p class="control has-icons-left has-icons-right">
                <label class="has-text-white" >Username:</label >
             <input class="input has-text-light" name = "username" type="text" placeholder="Username">
             <span class="icon is-small is-left">
                <i class="fas fa-envelope"></i>
              </span>
              <span class="icon is-small is-right">
                <i class="fas fa-check"></i>
              </span>
            </p>
          </div>
          <div class="field">
            <p class="control has-icons-left">
                <label class="has-text-white" >Password:</label >
                <input class="input has-text-light" name = "password" type="password" placeholder="Password">
              <span class="icon is-small is-left">
                <i class="fas fa-lock"></i>
              </span>
            </p>
          </div>
          <div class="field">
            <p class="control">
              <button class="button is-success" type = "submit">
                &emsp;&emsp; Login&emsp;&emsp;
              </button>
            </p>
          </div>
 
        </div>
</div>
</form>
</div>
</section>
</body>
</html>