<?php
	include ('connector.php');
?>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name='author' content='Florian Swinareck'>
		<title>Anime Database</title>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link href="css/index.css" rel="stylesheet">
	</head>

<body>

		<div id="wrapper" >

		<header class="aussehen" >
				Anime Database with filter
		</header>

		<!-- Filteroptionen in NAV -->
		<nav class="aussehen"> <!-- Navigator enthält die Filteroptionen um die Animeserien zu filtern nach x-Option. -->
			<h3>Filter Anime</h3>
			<hr>

				<h5>Select release Year</h5>
				
					<input type="hidden" id="min_year" value="0" />
                    <input type="hidden" id="max_year" value="2020" />
                    <p id="year_show">1980 - 2020</p>
                    <div id="year_range"></div>

                <hr>
                <h5>Choose if -</h5>
                	<!-- 	query variable ist die SQL-Anweisung - x spalte von der Tabelle Anime wird nach x spalte sortiert (num != '0' da es keine 0 Nummerierung gibt und immer alle Anime abefragt werden)
							neue variable Statement in welcher die PDO-Befehle prepare und execute ausgeführt werden (vorbereiten und ausführen von $query)
							in $result werden alle Daten von $query ($statement) entnommen und in result gelistet (fetchAll gibt ein Array der Daten zurück, hier gibt es alle möglichen Animationsstudios zurück)
							diese werden dann hier als $row ausgeben in der foreach Schleife (für jeden $result als $row)
							common_selector x ist für die Funktion der Box
                	 -->
                	<?php

                    $query = "SELECT DISTINCT(status) FROM anime WHERE num != '0' ORDER BY status DESC";
                    $statement = $connector->prepare($query);
                    $statement->execute();
                    $result = $statement->fetchAll();
                    foreach($result as $row)
                    {
                    ?>
                    <div>
                        <label><input type="radio" class="common_selector status" name="status" value="<?php echo $row['status']; ?>"  > <?php echo $row['status']; ?></label>
                    </div>
                    <?php } ?>
                    <br>
                    <!-- Den Reset-Buttons hab ich nur für die Radio-Buttons erstellt er setzt nur die Eingabe der Box zurück (die Auswahl, welche sonst einen kompletten refresh der Seite bräuchte, der Button setzt nicht alle Filteroptionen zurück auch nicht der Radio-Buttons) -->
                    <input type="button" class="reset" value="Reset">
                    <br>

                <hr>
				<h5>Select Studio</h5>
					<!-- Wiederholung für weitere Tabellen (potentiell könnte man jede Tabelle so wiedergeben) -->
					<?php

                    $query = "SELECT DISTINCT(studio) FROM anime WHERE num != '0' ORDER BY studio DESC";
                    $statement = $connector->prepare($query);
                    $statement->execute();
                    $result = $statement->fetchAll();
                    foreach($result as $row)
                    {
                    ?>
                    <div>
                        <label><input type="checkbox" class="common_selector studio" value="<?php echo $row['studio']; ?>"  > <?php echo $row['studio']; ?></label>
                    </div>
                    <?php } ?>

                <hr>
				<h5>Select Season</h5>	
                    <?php

                    $query = "
                    SELECT DISTINCT(season) FROM anime WHERE num != '0' ORDER BY season DESC
                    ";
                    $statement = $connector->prepare($query);
                    $statement->execute();
                    $result = $statement->fetchAll();
                    foreach($result as $row)
                    {
                    ?>
                    <div class="checkbox">
                        <label><input type="checkbox" class="common_selector season" value="<?php echo $row['season']; ?>" > <?php echo $row['season']; ?></label>
                    </div>
                    <?php } ?>
                <hr>
                <h5>Select Type</h5>
                	<?php

                    $query = "
                    SELECT DISTINCT(type) FROM anime WHERE num != '0' ORDER BY type DESC
                    ";
                    $statement = $connector->prepare($query);
                    $statement->execute();
                    $result = $statement->fetchAll();
                    foreach($result as $row)
                    {
                    ?>
                    <div class="checkbox">
                        <label><input type="checkbox" class="common_selector type" value="<?php echo $row['type']; ?>" > <?php echo $row['type']; ?></label>
                    </div>
                    <?php } ?>
                <br>


		</nav>
			<!-- Anime erscheinen hier in der Contentbox -->
			<article class="aussehen" >
				<h2>Anime Database</h2>

 				<div class="filter_data"></div>

			</article>		

			<footer class="aussehen" >Florian Swinareck 2020 - Webprogrammierung - Hochschule Harz</footer> 

		</div>
	<!-- 	Der Scriptcode für das Filtern von Eigenschaften,
			filter_data ist der Code um die Daten (die Animes) zu filtern, enthält die variablen für die spalten welche gefiltert werden und die ajax-Anweisung, in welcher die POST-methode verwendet wird
			bei erfolg wird es in der Klasse "filter_data" ausgegeben, entspricht der Div in der Contentbox

			Filter_data wird daher hier schon einmal ausgeführt = resultiert da noch keine Daten gefiltert wurden, werden alle vorhandenen angezeigt

			get_filter entnimmt den Eintrag der Spalte (Studio, Season,...) '.+class_name(bsp. Studio)+':checked' (ob die Box ausgewählt wurde) und jede dieser Daten werden in dem leeren filter Array gepackt(push) diese Function füllt dadurch die Variable in filter_data (rückgabewert ist die Filter variable)

			common selector macht die Checkboxen als auch die Radio-Buttons funktionsfähig und führt daraufhin filter_data aus

			#year_range.slider baut den Slider auf (für die Jahreszahlen) entsprechend der Werte welche der User "slidet" entspricht die Value für filter_data

			.reset für den Reset-Button der Radio-Buttons

	  -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">

	$(document).ready(function(){

		//alert("testatstart");

    	filter_data();

    	function filter_data()
    	{

        	var action = 'ajax';
        	var min_year = $('#min_year').val();
        	var max_year = $('#max_year').val();
        	var status = get_filter('status');
        	var studio = get_filter('studio');
        	var season = get_filter('season');
        	var type = get_filter('type');
        	$.ajax({
            	url:"ajax.php",
            	method:"POST",
            	data:{action:action, min_year:min_year, max_year:max_year, studio:studio, season:season, status:status, type:type,},
            	success:function(data){
               	 	$('.filter_data').html(data);
            	}
        	});
    	}

    	function get_filter(class_name)
    	{
       		var filter = [];
        	$('.'+class_name+':checked').each(function(){
           		filter.push($(this).val());
        	});
        	return filter;
    	}

    	$('.common_selector').click(function(){
        	filter_data();
    	});

    	$('#year_range').slider({
        	range:true,
        	min:1980,
        	max:2020,
        	values:[1900, 2020],
        	stop:function(event, ui)
        	{
            	$('#year_show').html(ui.values[0] + ' - ' + ui.values[1]);
            	$('#min_year').val(ui.values[0]);
            	$('#max_year').val(ui.values[1]);
            	filter_data();
        	}
    	});
    	$('.reset').click(function(){
    		$('input[name=status]').attr('checked',false);
    	});

	});
	
	</script>
</body>	

</html>