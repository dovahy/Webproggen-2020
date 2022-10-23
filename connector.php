<!-- 	mysqli habe ich genutzt bis ich zu PDO gewechselt habe (andere Syntax, etwas besser zu verstehen und besser Dokumentiert, eigene Meinung) 
		$conenctor als allgemeinen Statement für die Befehle welche über SQL ablaufen (prepare, execute, fetchall..)
 -->

<?php

	/*$connector = new mysqli("localhost","root","","webseite"); //Verbindung zur Datenbank
	if($connector->connect_error){
		die("Verbindung mit der Datenbank ist Fehlgeschlagen".$connector->connect_error); //Fehlerausgabe wenn die Verbindung nicht stimmt (bsp: falsche DB, falsches Passwort)
	}*/

	$connector = new PDO("mysql:host=localhost;dbname=webseite", "root", "");

?>	