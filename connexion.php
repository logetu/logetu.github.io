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
            <li><a href="connexion.php">Réserver</a></li>
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
                  }else if (x.toLowerCase == "lille") {
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
<p> Veuillez vous connecter à votre compte.</p>
<!-------------------------------Base de données --------------------------->
<?php
$db = new PDO('mysql:host=localhost;dbname=logetu', "root", "");
?>
<!----------------------------------Connexion------------------------>
<section style=" background-color: #FFFAE1; padding: 10px 0px 0px 0;">
<h6>Connexion </h6>
<form method= "post">
<input type="email" name="lemail" id="lemail" placeholder="Votre email" required><br/>
<input type="password" name="lpassword" id="lpassword" placeholder="Votre mot de passe" required><br/>
<input type="submit" name="ok" id="ok" placeholder="Connexion" required><br/>
</form>

<!---------VERIFICATION DU COMPTE---------------->
<?php
    if(isset($_POST['ok']))
    {
      extract($_POST);
      if(!empty($lemail) && !empty($lpassword))
      {
        //verification de l'email : on recupere les informations de la table users lorsque l'email est 
        //celui que l'utilisateur a rentré
        $q = $db->prepare("SELECT * FROM users WHERE email = :email");
        $q->execute(['email' => $lemail]);
        $result = $q->fetch();

        if($result == true)
        {
          //l'email existe donc le compte existe bien
          if (password_verify($lpassword, $result['password']))
          {
            //le mot de passe est correct
            header('Location: http://localhost/projet%20info/support-projet-1-projet_termin-/reserver.php');
            Exit();
          }
          else
          {
            echo "Le mot de passe n'est pas correct";
          }

        }else{echo "Le compte portant l'email " . $lemail . "n'existe pas. Veuillez vous inscrire ci-dessous.";}
      }else{
        echo "Veuillez completer l'ensemble des champs";
      }
    }
?>


<!------------------------------------Inscription---------------------->
<h6>Inscription </h6>
<form method= "post">
<input type="email" name="semail" id="semail" placeholder="Votre email" required><br/>
<input type="password" name="password" id="password" placeholder="Votre mot de passe" required><br/>
<input type="password" name="cpassword" id="cpassword" placeholder="Confirmer votre mot de passe" required><br/>
<input type="submit" name="ok" id="ok" placeholder="OK" required><br/>
</form>

<?php
if (isset($_POST['ok'])){
  extract($_POST); //permet de ne pas toujours écrire le $_POST
  if(!empty($password) && !empty($cpassword) && !empty($semail)){

    if ($password == $cpassword){
      $options = [
        'cost' => 12,
      ];
      //mot de passe sécurisé grace au hachage
      $hashpass= password_hash($password, PASSWORD_BCRYPT, $options);

      //verification que l'email n'a pas déjà été utilisé
      $c=$db->prepare("SELECT email FROM users WHERE email = :email");
      $c-> execute(['email' => $semail]);
      
      $result = $c->rowCount();

      if($result == 0){
        //on insert les informations dans la BDD
        $q=$db->prepare("INSERT INTO users (email, password) VALUES(:email, :password)");
        $q-> execute([
          'email' => $semail,
          'password'=> $hashpass
        ]);
            header('Location: http://localhost/projet%20info/support-projet-1-projet_termin-/reserver.php');
            Exit();
      } else{ echo "Un email existe déjà";}
     } else{echo "certains champs ne sont pas remplies";}
  }
}
?>
</section>
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
