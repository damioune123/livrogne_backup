	<h1 class="h1">Bienvenue sur le cocktail maker</h1>

		<br>
	<div class="form-group">

		<div class="container">
			<table class="table">
				<tr >
					<td>Pompe 1</td>

				</tr>
				<tr>
					<td><input class="form-control" name="pump1" type="number" step="1"></td>
					<td> <label for="totalCL">Total cl</label>
						<input class="form-control" id="total" name="total" type="number"  step ="1">
					</td>
				</tr>
				<tr>
					<td>Pompe 2</td>

				</tr>
				<tr>
					<td><input class="form-control" name="pump2" type="number" step="1"></td>
					
					<td>
						<label for="code">Code appel script</label>
						<form action="index.php?" method="GET">
							<input class="form-control" id="code" name="code" type="text">
							<td><button id="servir" type="submit" class="btn btn-success btn-lg">Servir</button></td>
						</form>
						
					</td>
				</tr>
				<tr>
					<td>Pompe 3</td>
				</tr>
				<tr>
					<td><input class="form-control" name="pump3" type="number" step="1"></td>
					
				</tr>
				<tr>
					<td>Pompe 4</td>
				</tr>
				<tr>
					<td><input class="form-control" name="pump4" type="number" step="1"></td>
					<td>  
				</tr>

				<tr>
					<td>Pompe 5</td>

				</tr>
				<tr>
					<td><input class="form-control" name="pump5" type="number" step="1"></td>
				</tr>
				<tr>
					<td>Pompe 6</td>

				</tr>
				<tr>
					<td><input class="form-control" name="pump6" type="number" step="1"></td>
				</tr>
				<tr>
					<td>Pompe 7</td>

				</tr>
				<tr>
					<td><input class="form-control" name="pump7" type="number" step="1"></td>
				</tr>
				<?php echo $output;?>
				
			</table>
		</div>
	</div>



