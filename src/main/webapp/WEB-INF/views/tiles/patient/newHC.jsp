<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div class="grid_12">
	
	<spring:url var="newHCUrl" value="/patient" />
	<form name="newHCForm" method="post" action="${newHCUrl}" class="form">
		<fieldset>
			<legend>Aperturar Historia Cl&iacute;nica</legend>
			<div class="wrapper-block first">
				<label for="dni">Dni:
					<span class="small-label"> - 
						<span>(*)</span>
					</span>
					
				</label>  
				<input type=text name="dni" id="dni" class="validate[required]"/>
			</div>
			<!-- /Dni -->
			<div class="wrapper-block first">
				<label for="name">Nombres:
					<span class="small-label"> - 
						<span>(*)</span>
					</span>
					
				</label>  
				<input type=text name="name" id="name" class="validate[required]"/>
			</div>
			<!-- /Name -->
			<div class="wrapper-block first">
				<label for="lastname">Apellidos:
					<span class="small-label"> - 
						<span>(*)</span>
					</span>
					
				</label>  
				<input type=text name="lastname" id="lastname" class="validate[required]"/>
			</div>
			<!-- /Lastname -->
			<div class="action-block">
				<input type="submit" class="btn"/>
			</div>
			<div class="fieldset-messages">
				<ul>
					<li>(*) Campos requeridos</li>
				</ul>
			</div>
		</fieldset>

	</form>
</div>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script type="text/javascript">
	jQuery(function($){
		
		$('form[name="newHCForm"]').on('submit',function(){
			var params = JSON.stringify($(this).serialize());
			console.log('Params - ' + params);
			console.log('${newHCUrl}');
			$.ajax({
				type: "POST",
	            url: "${newHCUrl}",
	            data: params,
	            //contentType: "application/json",
	            dataType: "json",
	            success: function (msg,status) {
	               	console.log('status' + status);
	            },
	            error: function (errormessage) {
					console.log(errormessage);

	            }
	         });

			
			return false;
		});
		
	});
</script>
