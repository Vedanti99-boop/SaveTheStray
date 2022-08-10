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
    <link rel="stylesheet" href="https://openlayers.org/en/v5.3.0/css/ol.css" type="text/css">
    <!-- The line below is only needed for old environments like Internet Explorer and Android 4.x -->
    <script src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script>
 
</head>
<body onload="getLocation()">
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
    background-image: radial-gradient(rgba(4,9,30,0.1),rgba(4,9,30,0.4)),url(images/log.png);
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
<form action="http://localhost/sam/demo.php" method = "post" enctype="multipart/form-data">
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

<div class = "mx-1 py-1" style = "background-color:black ; opacity : 80%">
    <div id="map" class="map px-3" style="height:250px"></div>
    <div id="info" style="display: none;"></div>
   </div> <label for="track" class = "px-6 pt-4 checkbox has-text-white">
      <input id="track" type="checkbox" required/>
      I have verified the location in the above map and pledge to give the location true to its value.
      
    </label>
    
    <div class="columns">
    <h1><br><br></h1>
        <div class="column is-half">
                  
             <div class="px-6 pt-6">
                <div class="px-6">
                    <div class="px-6">
                        <div class="px-6">
                            <div class="px-6">
          
                <p><input type="file"  accept="image/*" name="file" id="file"  onchange="loadFile(event)" style="display: none;"></p>
               <div class="button">
                <p><label  class="button is-danger px-6 py-4" for="file" class="has-text-white" style="cursor: pointer;" >Upload Image</label></p>
            </div>
                <script>
                    var loadFile = function(event) {
                        var image = document.getElementById('output');
                        image.src = URL.createObjectURL(event.target.files[0]);
                    };

                    
                    </script>
                
               </div> 
          </div>
                </div>
             </div>
               </div>


                <div class="py-4 px-6"> 
                    
                        
                <div class="field">
                    <label class="has-text-white">Rescue Type:</label>
                    <div class="control">
                      <div class="select">
                        <select name = "type" required>
                          
                          <option value = "Find The Lost">Find The Lost &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</option>
                          <option value = "Animal Abuse">Animal Abuse</option>
                          <option value = "Medical Help">Medical Help</option>
                          <option value = "Accidental Help">Accidental Help</option>
                          <option value = "Emergency">Emergency</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  </div>
                 
               



               <div class="px-6">
        
                <div class="field">
                    <label class="has-text-white">Contact No:</label>
                    <div class="control">
                      <input class="input has-text-white" type="number" name = "contact" required>
                    </div>
                  </div>
                </div>



  
          <div class="py-4 px-6">   
             
          <div class="field">
            <label class="has-text-white" >Description:</label >
            <div class="control">
              <textarea class="textarea has-text-white"  name = "description" required></textarea>
            </div>
          </div>
            </div>
            <p class="has-text-black mx-6 px-1 py-1" style = "background-color: white ; opacity : 80% ;"> <b>Before clicking</b> on<b> 'submit'</b> please do verify these coordinates. If any changes required kindly mention in the description.</p>
           <b> <p id="demo" class="has-text-black mx-6 px-1 py-1" style = "background-color: white ; opacity : 80% ;"></p></b>

            <div class="px-6 my-3 mb-6"> 
                <div class="button">
               <button class="button is-white" type="submit" name="submit">&emsp;&emsp;Submit&emsp;&emsp;</button>
            </div>
        </div>


        </div>





        <div class="column is-half">
          <!--   <h1><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></h1> -->
            
            

            <div class="px-6 mx-6" style = "background-color:black ; opacity : 90% ; min-height: 500px">
            
            <h2 class="subtitle "><br>Your image goes here: </h2>

            
                <p><img id="output"/> </p>
                <h2><br></h2>
            </div>

            <p id="demo" class="has-text-white"></p>
            <!-- <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d830.2020618959929!2d73.821823882334!3d18.587621607773578!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTjCsDM1JzE1LjMiTiA3M8KwNDknMTcuNiJF!5e0!3m2!1sen!2sin!4v1634541832902!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe> -->
<input type='hidden' id='id1' name = "location" />



<input type='hidden' id='id3' name = "username" value = <%= username %>/>

            <div id="mapholder"></div>

            




</div>
     
</section>
<script src='https://api.tomtom.com/maps-sdk-for-web/cdn/6.x/6.15.0/maps/maps-web.min.js'></script>
<script type='text/javascript' src='../assets/js/mobile-or-tablet.js'></script>
<script>
      /*import Feature from 'ol/Feature.js';
      import Geolocation from 'ol/Geolocation.js';
      import Map from 'ol/Map.js';
      import View from 'ol/View.js';
      import Point from 'ol/geom/Point.js';
      import {Tile as TileLayer, Vector as VectorLayer} from 'ol/layer.js';
      import {OSM, Vector as VectorSource} from 'ol/source.js';
      import {Circle as CircleStyle, Fill, Stroke, Style} from 'ol/style.js';*/

      var view = new ol.View({
        center: ol.proj.fromLonLat([75, 20]),
          zoom: 3
      });

      var map = new ol.Map({
        layers: [
          new ol.layer.Tile({
            source: new ol.source.OSM()
          })
        ],
        target: 'map',
        view: view
      });

      var geolocation = new ol.Geolocation({
        // enableHighAccuracy must be set to true to have the heading value.
        trackingOptions: {
          enableHighAccuracy: true
        },
        projection: view.getProjection()
      });

      function el(id) {
        return document.getElementById(id);
      }

      el('track').addEventListener('change', function() {
        geolocation.setTracking(this.checked);
      });

      // update the HTML page when the position changes.
      geolocation.on('change', function() {
	    el('positionshowingtouser1').innerText = geolocation.getPosition();
        el('accuracy').innerText = geolocation.getAccuracy() + ' [m]';
        el('altitude').innerText = geolocation.getAltitude() + ' [m]';
        el('altitudeAccuracy').innerText = geolocation.getAltitudeAccuracy() + ' [m]';
        el('heading').innerText = geolocation.getHeading() + ' [rad]';
        el('speed').innerText = geolocation.getSpeed() + ' [m/s]';
      });

      // handle geolocation error.
      geolocation.on('error', function(error) {
        var info = document.getElementById('info');
        info.innerHTML = error.message;
        info.style.display = '';
      });

      var accuracyFeature = new ol.Feature();
      geolocation.on('change:accuracyGeometry', function() {
        accuracyFeature.setGeometry(geolocation.getAccuracyGeometry());
      });

      var positionFeature = new ol.Feature();
      positionFeature.setStyle(new ol.style.Style({
        image: new ol.style.Circle({
          radius: 6,
          fill: new ol.style.Fill({
            color: '#3399CC'
          }),
          stroke: new ol.style.Stroke({
            color: 'red',
            width: 2
          })
        })
      }));

      geolocation.on('change:position', function() {
        var coordinates = geolocation.getPosition();
        positionFeature.setGeometry(coordinates ?
          new ol.geom.Point(coordinates) : null);
      });

      new ol.layer.Vector({
        map: map,
        source: new ol.source.Vector({
          features: [accuracyFeature, positionFeature]
        })
      });
	 
    </script>

<script>
    const x = document.getElementById("demo");

    function getLocation() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
      } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
      }
    }

    function showPosition(position) {
    	
        var inputF = document.getElementById("id1");
       
        inputF.value = position.coords.latitude + " , " + position.coords.longitude;

    	
      x.innerHTML = "Latitude: " + position.coords.latitude + 
      "<br>Longitude: " + position.coords.longitude;
      
      
    }
        </script>
        </form>
</body>
</html>

