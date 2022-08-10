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
</head>



<style>
    body{
        margin: 0;
        padding: 0;
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100vh;
        animation: animate 16s ease-in-out infinite;
        background-size: cover;
        
    
    }

   

    .outer{
        position: absolute;
        left: 0;
        top:0;
        width: 100%;
        height:100vh;
        
    }

    


    @keyframes animate{
        0%,100%{
            background-image: url(images/pexels-pixabay-33550.jpg);
        }
        25%{
            background-image: url(images/pexels-eddie-galaxy-3628100.jpg);
        }
        50%{
            background-image: url(images/pexels-pixabay-208821.jpg);
        }
        75%{
            background-image: url(images/pexels-matthias-zomer-66627.jpg);
        }
      
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


   

</style>







<body>

    <div class="outer">
        

            <section class="header">
                <nav>
                    <a href="index.html"> <img src="images/logo2.png" >   </a>
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
        

                 <div class="columns">
                    <div class="column is-3">yes
                    </div>
            
            
            
            
                    <div class="column is-9  mx-3 my-3 px-6 " >




                  

                        <div class=" mx-6 px-6 py-6 my-6" style="background-color: black; opacity: 50%;">
                            <div class="mx-6 my-6 " style="opacity: 100%;">
                      <h1 class="title is-1 has-text-light py-3">  You Can Save Life In Just 3 Steps:-</h1>
                      <h1 class="subtitle has-text-light">
                        1. Click The Below "Save The Stray" Button.<br><br>
                        2. Take The Picture And Upload It.<br><br>
                        3. Turn On Your GPS.<br><br>
                        </h1> 
                    
                    </div></div>
                    
                     <div class="has-text-centered">
                    <button class="button is-danger is-rounded">&emsp;&emsp;Save The Stray&emsp;&emsp;</button>
                    </div>
                      




                    </div>
               </div>   

            


     
            </section>
    </div>


    
</body>
</html>