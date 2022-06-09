<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">

    <title>Log'étu</title>

    <link rel="stylesheet" href="style.css">   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">

    </head>
    <body>
      <header>
        <nav>
          <ul>
          <li id="logo"><a href="index.html">Log'étu</a></li>
            <li><a href="#contact">Contact</a></li>
            <li><a href="reserver.php">Réserver</a></li>
            <li><a href="index.html#logement">Nos logements</a></li>
            <li>
              <input type="search" value="" id="search" onchange="openPage()"placeholder="Saisir une ville">
              <script>
                  function openPage() {
                  var x = document.getElementById("search").value;
              
                  if (x.toLowerCase() == "paris") {
                      open("paris.html", "_self");
                  }
                   else if (x.toLowerCase() == "marseille") {
                      open("marseille.html", "_self");
                  }
                  else if (x.toLowerCase() == "lyon") {
                      open("lyon.html", "_self");
                  }
                  else if (x.toLowerCase() == "nantes") {
                      open("nantes.html", "_self");
                  } else if (x.toLowerCase() == "orleans") {
                      open("orleans.html", "_self");
                  }else {
                      open("lille.html", "_self");
                  }
              }
              </script>
       </li>
          </ul>
        </nav>
<!------------------------------en-tête--------------------------->
        <div id="imgreserver">
          <h5>Réservation</h5>
         </div>
<p> Vous pouvez dès à présent préréserver votre résidence étudiante. Nous vous recontacterons par mail. </p>

<!----------------------------RESERVATION---------------------->
<section style=" background-color: #FFFAE1; padding: 10px 0px 0px 0;">
  <form method="POST">
  <p>
     Adresse mail :
    <input type="text" id ="email" name="email"/>
</p>
<p>
   Résidence : 
   <select name="residence" id="residence">
                <option value="">--Please choose an option--</option>
        <option value=" STUDEA "> STUDEA </option>
        <option value=" STUDELITES "> STUDELITES </option>
        <option value=" fac-habitat"> fac-habitat </option>
        <option value=" Odalys Campus "> Odalys Campus </option>
        <option value=" TWENTY CAMPUS "> TWENTY CAMPUS </option> 
        <option value=" LOGIFAC "> LOGIFAC </option>
        <option value=" LES ESTUDINES"> LES ESTUDINES </option>

    </select>
</p>
<p>
   Ville résidence:
    <input type="text" name="ville" id="ville"/>
</p>

<br/>
<p><blockquote><blockquote><blockquote>
<input type="submit" name="ok" id="ok" value = "Valider la saisie">
</blockquote></blockquote></blockquote>
</p>
</form>
</section>


<?php
  //connexion à la BDD
  $db = new PDO('mysql:host=localhost;dbname=logetu', "root", "");
  //si l'utilisateur clique sur le bouton
  if (isset($_POST['ok'])){
   
  extract($_POST);  //permet de ne pas toujours écrire le $_POST
  if(!empty($residence) && !empty($ville)){
    //insertion des informations dans la table reservation
    $db -> exec("INSERT INTO reservation(residence, ville) VALUES ('$residence', '$ville')"); 
    $id_reservation=$db-> lastInsertId();

    //récupérer l'id de la table users en fonction de l'email
    $stmt= $db -> query("SELECT id FROM users WHERE email= '$email'");
    $row=$stmt-> fetch();
    $id = $row[0];  

    //insertion id et id_reservation dans la table possede
    $db -> exec("INSERT INTO possede(id, id_reservation) VALUES ('$id', '$id_reservation')"); 
   
  } else{echo "certains champs ne sont pas remplies"; }
  }
 
 ?>

    <!-----------------------FOOTER---------------------------->  
      <footer>
        <div id="deuxiemeTrait"></div>
        <div id="copyrightEtIcons">
          <div id="copyright">
            <span>© fromScratch(); 2022</span>
          </div>
          <div id="icons">
            <a href="http://www.twitter.fr"><i class="fa fa-twitter"></i></a>
            <a href="http://www.facebook.fr"><i class="fa fa-facebook"></i></a>
            <a href="http://www.instagram.com"><i class="fa fa-instagram"></i></a>
  
          </div>
        </div>
      </footer>
    </body>
  </html>
