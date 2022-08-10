<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Save The Strays</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">

</head>
<body>

 <style>
 
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

.text-box{
    width: 90%;
    color: #fff;
    position: absolute;
    top:50%;
    left :50%;
    transform:translate(-50% ,-50%);
    text-align: center;
    
}
.text-box h1{
    font-size: 62px;

} 
.text-box p{
    margin: 10px 0 40px;
    font-size: 16px;
    color: #fff;
}

.hero-btn{
    display:inline-block;
    text-decoration: none;
    color:#fff;
    border:1px solid #fff;
    padding:22px 44px;
    font-size: 19px;
    background: transparent;
    position: relative;
    cursor: pointer;

}
.hero-btn:hover{
    border:1px solid#f44336;
    background: #f44336;
    transition: 0.5s;

}
nav .fa{
    display: none;
}
@media(max-width:700px){
    .text-box h1{
        font-size: 20 px;
    }
    .nav-links ul li{
        display: block;
    }
    .nav-links{
        position: absolute;
        background: #f44336;
        height: 100vh;
        width: 200px;
        top:0;
        right:-200px;
        text-align: left;
        z-index: 2;
        transition: 1s;
    }
    nav .fa{
        display: block;
        color: #fff;
        margin: 10px;
        font-size: 22px;
        cursor: pointer;
    }
    .nav-links ul{
        padding: 30px;
    }
}

/* home  */

a{
    color: white;
}

.input{

background-color: transparent;
background-image: none;

}
.textarea {

background-color: transparent;
background-image: none;

}
 </style>   


    <div class="header">
<!-- <img src="images/dog.jpg" alt="img"> -->
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

</section>

<!-- home -->



<!-- javascript for togglemenu -->

<script>
    var navLinks=document.getElementById("navLinks");
function showMenu(){
    navLinks.style.right="0";
}
function hideMenu(){
    navLinks.style.right="-200px";
}

</script>



</div>



</body>
</html>