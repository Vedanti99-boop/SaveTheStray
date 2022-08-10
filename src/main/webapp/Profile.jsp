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
</style>

<section class="header">
    <nav>
        <a href="index.html"> <img src="src/log.png" >   </a>
        <div>
         <div class="nav-links1 " id="navLinks1">
             <ul>
                 <li>LOGIN</li>
                 <li>REGISTER</li>
             </ul>
      
          </div>
        </div>
         <div class="nav-links" id="navLinks">
             <i class="fa fa-times" onclick="hideMenu()"></i>
     
             <ul>
                   <li><a href=""></a>HOME</li>   
                   <li><a href=""></a>SERVICES</li>
                   <li><a href=""></a>ABOUT</li>
                   <li><a href=""></a>DONATION</li>
                          
             </ul>
         </div>
         <i class="fa fa-bars" onclick="showMenu()" ></i>
     </nav>

<div class="section">

  <div class="columns is-multiline ml-4">

   <!-- New column -->
    <div class="is-one-quarter ml-3">

      <div class="px-3 py-3">
        
        <div class="card has-background-danger" style="width: 20rem;" >
          <img src="images/log.png" class="card-img-top" style="padding: 7px;">
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
            <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">An item</li>
            <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">A second item</li>
            <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">A third item</li>
          </ul>
          </div>
          <div class="mx-2 my-2">
          <div class="card-body">
            <a href="#" class="card-link link-dark">Card link</a>
            <a href="#" class="card-link link-dark">Another link</a>
          </div>
        </div>
        </div>
    </div>
    </div>
    
    <!-- New column -->
    <div class="is-one-quarter ml-3">

  <div class="px-3 py-3">

    <div class="card has-background-warning" style="width: 20rem;">
      <img src="images/log.png" class="card-img-top" style="padding: 7px;">
      <div class="card-body">
        <div class="mx-2 my-1">
        <h5 class="card-title">Accidental Help</h5>
        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
      </div>
    </div>
    <div class=" my-1">
      <ul class="list-group list-group-flush">
        <li class="list-group-item mx-2"  style="background-color: transparent;">An item</li>
        <li class="list-group-item mx-2"  style="background-color: transparent;">A second item</li>
        <li class="list-group-item mx-2"  style="background-color: transparent;">A third item</li>
      </ul>
      </div>
      <div class="mx-2 my-2">
      <div class="card-body">
        <a href="#" class="card-link">Card link</a>
        <a href="#" class="card-link">Another link</a>
      </div>
    </div>
    </div>
  </div>

</div>

<!-- New column -->
<div class="is-one-quarter ml-3">

<div class="px-3 py-3">

<div class="card has-background-black" style="width: 20rem;">
  <img src="images/log.png" class="card-img-top" style="padding: 7px;">
  <div class="card-body">
    <div class="mx-2 my-1">
    <h5 class="card-title has-text-white">Animal Abuse</h5>
    <p class="card-text has-text-white">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
</div>
<div class=" my-1">
  <ul class="list-group list-group-flush">
    <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">An item</li>
    <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">A second item</li>
    <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">A third item</li>
  </ul>
  </div>
  <div class="mx-2 my-2">
  <div class="card-body">
    <a href="#" class="card-link">Card link</a>
    <a href="#" class="card-link">Another link</a>
  </div>
</div>
</div>
</div>

</div>

    <!-- New column -->  
<div class="is-one-quarter ml-3">

  <div class="px-3 py-3">

    <div class="card has-background-white" style="width: 20rem;">
      <img src="images/log.png" class="card-img-top" style="padding: 7px;">
      <div class="card-body">
        <div class="mx-2 my-1">
        <h5 class="card-title has-text-danger">Medical Help</h5>
        <p class="card-text has-text-danger">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
      </div>
    </div>
    <div class=" my-1">
      <ul class="list-group list-group-flush">
        <li class="list-group-item mx-2 has-text-danger"  style="background-color: transparent;">An item</li>
        <li class="list-group-item mx-2 has-text-danger"  style="background-color: transparent;">A second item</li>
        <li class="list-group-item mx-2 has-text-danger"  style="background-color: transparent;">A third item</li>
      </ul>
      </div>
      <div class="mx-2 my-2">
      <div class="card-body">
        <a href="#" class="card-link">Card link</a>
        <a href="#" class="card-link">Another link</a>
      </div>
    </div>
    </div>
  </div>
    </div>
 
    <!-- New column -->
 <div class="is-one-quarter ml-3">

  <div class="px-3 py-3">
    

    <div class="card has-background-info" style="width: 20rem;" >
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
        <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">An item</li>
        <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">A second item</li>
        <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">A third item</li>
      </ul>
      </div>
      <div class="mx-2 my-2">
      <div class="card-body">
        <a href="#" class="card-link link-dark">Card link</a>
        <a href="#" class="card-link link-dark">Another link</a>
      </div>
    </div>
    </div>
</div>
</div>


    <!-- New column -->
<div class="is-one-quarter ml-3">

  <div class="px-3 py-3">
    

    <div class="card has-background-info" style="width: 20rem;" >
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
        <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">An item</li>
        <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">A second item</li>
        <li class="list-group-item mx-2 has-text-white"  style="background-color: transparent;">A third item</li>
      </ul>
      </div>
      <div class="mx-2 my-2">
      <div class="card-body">
        <a href="#" class="card-link link-dark">Card link</a>
        <a href="#" class="card-link link-dark">Another link</a>
      </div>
    </div>
    </div>
</div>
</div>

  </div>
</div>


</section>
</body>
</html>