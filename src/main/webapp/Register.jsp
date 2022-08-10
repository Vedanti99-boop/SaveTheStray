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
.placeholder-light{

        color: white;
  
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

<form action="RegisterController" method = "post">
<div class="container">
  
    <div class="columns">

        <div class="column is-half px-5 py-3" >
            <div class="field">
                <label class="label has-text-light	">Name</label>
                <div class="control control has-icons-left">
                  <input class="input has-text-light is-primary" name = "name" type="text" placeholder="Text input" required>
                </div>
              </div>
              <div class="field">
                <label class="label has-text-light	">Email</label>
                <div class="control control has-icons-left">
                  <input class="input has-text-light is-primary" name = "email" type="email" placeholder="Email@email.xyz" required>
                </div>
              </div><div class="field">
                <label class="label has-text-light	">Username</label>
                <div class="control control has-icons-left">
                  <input class="input has-text-light is-primary" name = "username" type="text" placeholder="Username" required>
                </div>
              </div>
              <div class="field">
                <label class="label has-text-light	">Password</label>
                <div class="control control has-icons-left">
                  <input class="input has-text-light is-primary" name = "password" type="password" placeholder="Password" required>
                </div>
              </div>
              <div class="field">
                <label class="label has-text-light	">Re-type Password</label>
                <div class="control control has-icons-left">
                  <input class="input has-text-light is-primary " type="password" placeholder="Password" required>
                </div>
              </div>
              
              <div class="field">
                <label class="label has-text-white ">Please select your user type</label>
                <div class="control">
                  <div class="select is-primary">
                    <select name = "userType">
                      <option value = "None">None &emsp;</option>
                      <option value = "Volunteer">Volunteer</option>
                      <option value = "Organization">Organization</option>
                      <option value = "Service Provider">Service Provider</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="field">
                <label class="label has-text-light	">State</label>
                <div class="control control has-icons-left">
                  <input class="input has-text-light is-primary " name = "state" type="text" placeholder="eg: Maharashtra" required>
                </div>
              </div>
                <div class="field">
                  <label class="label has-text-light	">City</label>
                  <div class="control control has-icons-left">
                    <input class="input has-text-light is-primary " name = "city" type="text" placeholder="eg: Pune" required>
                  </div>
                </div>
                <div class="field">
                    <label class="label has-text-light	">Phone Number</label>
                    <div class="control control has-icons-left">
                      <input class="input has-text-light is-primary " name = "phone" type="number" placeholder="XXXXXXXXXX" required>
                    </div>
                  </div>
                <div class="field">
                    <label class="label has-text-light	">ZipCode</label>
                    <div class="control control has-icons-left">
                      <input class="input has-text-light is-primary " name = "zipcode" type="number" placeholder="XXXXXX" required>
                    </div>
                  </div>
                  
              

              <div class="field">
                <div class="control has-text-light py-2">
                  <label class="checkbox">
                    <input type="checkbox">
                    I agree to the <a href="#">terms and conditions</a>
                  </label>
                </div>
              </div>
              
             
              
                <div class="buttons ">
                  <button class="button is-medium is-primary px-5 py-2 " type = "submit">Submit</button>
                </div>
                
              </div>


        <div class="column is-half has-text-light"><div class="field">
            <h1><br></h1>
            <div class=" mx-3 px-6 py-6 my-6" style="background-color: black; opacity: 50%;">
                <div class="mx-3 my-6" style="opacity: 100%;">
          <h1 class="title is-1 has-text-light py-3">  REGISTER Yourself</h1>
          <h1 class="subtitle has-text-light">
            The information you fill is kept highly confidential. We assure you none of your given information will be used for any purose without your permission.
            <br>
            By clicking the SUBMIT button you agree to have filled all the information true to its value with your own consent.
            </h1> <h1 class="subtitle has-text-light">
                The information you fill is kept highly confidential. We assure you none of your given information will be used for any purose without your permission.
                <br>
                By clicking the SUBMIT button you agree to have filled all the information true to its value with your own consent.
                </h1> </div></div></div>
</div></div>

</div>
</form>
</section>
</body>
</html>