<!-- 	Implode wird genutzt da die Daten von einem [] Array kommen und wandelt den Array in einen String um, $_POST ist eine "Superglobale" Variable und dient für die Weiterleitung -> im ajax wird die 	POST methode genutzt
		isset prüft ob eine Variable existiert und nicht null ist, wenn es so ist dann wird ein SQL befehl in query ausgefühlt, hier habe ich mit AND gearbeitet um die Möglichkeit zu haben mehrere Optionen zu Filtern (werden sprichwörtlich immer angehängt für jedes if an $query)
		dann wird der Befehl ausgeführt (execute) aufgenommen (fetchall) und in result gepackt, total row ist die Number der gesamten Reihen der Daten im Statement (bei der ausführung)
		wenn nun die Anzahl der Reihen größer als Null ist werden alle Ergebnisse der Daten in $result hier in $row ausgegeben (foreach) Schleife, in der filter_data class als neuen Code
		gibt hier das Bild, die Daten, und für jeden gibt es einen Button welcher auf CSS basiert, es wird eine Modal-Box aufgerufen in welcher die "Summary" also die Zusammenfassung des Anime steht, durch $row[NUM] hab ich es geschaft popup1,2,3.. oder entsprechend des Filters popup6,7,8 zu schaffen und daruch hat jeder einen Button der zu seiner Summary führt: mein PROBLEM am Anfang war das jeder button jedes mal zum ersten gefilterten Anime zugewiesen war, sprich es öffnete sich immer der erste Text
		Wenn die Anzahl der Reihen nicht größer als Null ist (sprich es gibt einfach keine Anime welche es für x Filter optionen gibt) wird $output = '<h3>No Anime fits the filter</h3>'; ausgegeben
-->
<?php

include ('connector.php');

if(isset($_POST["action"]))
{
	$query = "
		SELECT * FROM anime WHERE num != '0'
	";
	if(isset($_POST["min_year"], $_POST["max_year"]) && !empty($_POST["min_year"]) && !empty($_POST["max_year"]))
	{
		$query .= "
		 AND year BETWEEN '".$_POST["min_year"]."' AND '".$_POST["max_year"]."'
		";
	}
	if(isset($_POST["studio"]))
	{
		$studio = implode("','", $_POST["studio"]);
		$query .= "
		 AND studio IN('".$studio."')
		";
	}
	if(isset($_POST["season"]))
	{
		$season = implode("','", $_POST["season"]);
		$query .= "
		 AND season IN('".$season."')
		";
	}
	if(isset($_POST["status"]))
	{
		$status = implode("','", $_POST["status"]);
		$query .= "
		 AND status IN('".$status."')
		";
	}
	if(isset($_POST["type"]))
	{
		$type = implode("','", $_POST["type"]);
		$query .= "
		 AND type IN('".$type."')
		";
	}

	$statement = $connector->prepare($query);
	$statement->execute();
	$result = $statement->fetchAll();
	$total_row = $statement->rowCount();
	$output = '';
	if($total_row > 0)
	{
		foreach($result as $row)
		{
			$output .= '
			<div class="item">
				<img src="'.$row['IMG'].'">
						<h4>'. $row['NAME'] .'</h4>
						<p>
						EPISODES: '. $row['EP'] .'<br>
						STUDIO: '. $row['STUDIO'] .'<br>
						SOURCE: '. $row['SOURCE'] .'<br>
						SEASON: '. $row['SEASON'] .'<br>
						YEAR: '. $row['YEAR'] .'<br>
						TYPE: '.$row['TYPE'] .'<br>
						SUMMARY: 
						
						<a class="button" href="#popup'.$row['NUM'].'">Read</a>
						<div id="popup'.$row['NUM'].'" class="overlay">
							<div class="popup">
								<a class="close" href="#">&times;</a>
								<p class="content"> '. $row['SYN'] .' </p>
							</div>
						</div>
						</p>
			</div>
			';
		}
	}
	else
	{
		$output = '<h3>No Anime fits the filter</h3>';
	}
	echo $output;
}
?>