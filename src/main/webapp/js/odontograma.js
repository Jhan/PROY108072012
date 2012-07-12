		var listDiente;
		var listIncidencia;
	  $('ul#mnuPaciente li').click(function(){
		  	var page = $(this).attr('page');
		  	 if(page == "fichaEstomatologica"){
		  		 	var dniPaciente = $('section#paciente').find('#PacienteDni').attr('value');
		  		 	
					$('div#tab-'+page).empty();
					$('div#tab-'+page).load('http://localhost:8080/sermeden/pages/fichaEstomatologica.html', function(response, status, xhr){
						if(status=="success"){
							$.getJSON("http://localhost:8080/sermeden/json/hallazgos.json",function(data) {
								listIncidencia=data.hallazgos;
								$.each(data.hallazgos, function(i,item){
									var html = '<li id="'+item.id+'" niveluso="'+item.modo_uso+'" titulo="'+item.nombre+'"><img src="'+item.src_img+'" title="'+item.nombre+'"/><br><span>'+item.nombre+'</span></li>';
									$('#listHallazgo').append(html);
								//<img src="'+item.src_img+'"/><span>'+item.nombre+'</span><input id="modo_uso" type="hidden" value="'+item.modo_uso+'"/>
							    });
							});
							
							$.getJSON("http://localhost:8080/sermeden/odontograma/find?dniPaciente="+dniPaciente,function(data) {
								listDiente = data;
								$.each(data, function(i,item){
									
									var html = 
										'<div id="pieza'+item.nro+'" cod="'+item.id+'" class="pieza" pieza="'+item.nro+'" estado="'+item.estado+'">'+
											'<input id="ubicacion" type="hidden" value="sup"/>'+
											'<img alt="" src="img/odontograma/'+item.tipo+'.png" class="imgPieza">'+
											'<div class="ld"></div>'+
											'<div class="contSector">'+
												'<div class="s1"/>'+
												'<div class="contSectorv">'+
													'<div class="s2"/>'+
													'<div class="s3" style="width: 16px;"/>'+
													'<div class="s4" style="border-right: solid 1px;"/>'+
												'</div>'+
												'<div class="s5"/>'+
											'</div>'+
											'<div class="li"></div>'+
											'<div class="nroPieza"><span>'+item.nro+'</span></div>'+
										'</div>';
									if(item.nro <= 16){$('#superior').append(html);}else{$('#inferior').append(html);}
										
										if(item.estado != 2){
												$('div#pieza'+item.id).css({"opacity":"1"});
												$('div#pieza'+item.id).append('<img id="corona" src="img/odontograma/incidencias/'+item.c_inc+'.png" class="imgCorona" style="top: -90px;"/>');
												$('div#pieza'+item.id).find('div.s1').addClass('inc'+item.s1_inc);
												$('div#pieza'+item.id).find('div.s2').addClass('inc'+item.s2_inc);
												$('div#pieza'+item.id).find('div.s3').addClass('inc'+item.s3_inc);
												$('div#pieza'+item.id).find('div.s4').addClass('inc'+item.s4_inc);
												$('div#pieza'+item.id).find('div.s5').addClass('inc'+item.s5_inc);
												$('div#pieza'+item.id).find(".ld").css({"background-image":"url(img/odontograma/incidencias/"+item.ld_inc+".png)"});
												$('div#pieza'+item.id).find(".li").css({"background-image":"url(img/odontograma/incidencias/"+item.li_inc+".png)"});
										
										}else{
											$('div#pieza'+item.id).append('<img src="img/odontograma/incidencias/4.png" class="imgCorona" style="top: -90px;"/>');
											$('div#pieza'+item.id).css({"opacity":"0.2"});
										}								
								});
								$("ul#listHallazgo li").click(function () {
									var idHallazgo = $(this).attr('id');
									var niveluso = $(this).attr('niveluso');
									var titulo = $(this).attr('titulo');
									openModal(titulo, "", niveluso, idHallazgo);
									$('div.modal-content').append('<form class="block-content form" id="simple_form" method="post" action="#"></form>');
									//0: Nivel Corona 1:PAR 2:SECTOR');
									if(niveluso == 0){
										$('div.modal-content').find('#simple_form')
										.append('Pieza <input id="pieza" type="text" name="simple-required">');
									}
									if(niveluso == 1){
										$('div.modal-content').find('#simple_form')
										.append('Pieza Derecha <input id="ld" type="text" name="simple-required">')
										.append('<br>')
										.append('Pieza Izquierda <input id="li" type="text" name="simple-required">');
									}
									if(niveluso == 2){
										$('div.modal-content').find('#simple_form')
										.append('Pieza <input id="pieza" type="text" name="simple-required">')
										.append('<br>')
										.append('Sector <input id="sector" type="text" name="simple-required">');
									}
								});
								  $('div.pieza').click(function(){
									  alert("openModalDiente()");
									  var pieza = $(this).attr("pieza");
									  var titulo = "Pieza "+ pieza;
									  var objDiente = listDiente[(pieza-1)];
									  var contenido='<ul id="popListInc" class="simple-list with-icon"></ul>';
									  /*'    <li><a href="javascript:void(0)">Remove title</a></li>'+
									  '    <li><a href="javascript:void(0)">Change title</a></li>'+
									  '    <li><a href="javascript:void(0)">Load Ajax content</a></li>'+
									  */
									  openModalDiente(titulo,contenido);
									  if(objDiente.c_inc != 0)$('ul#popListInc').append('<li><div style="float:left"><a>'+listIncidencia[(objDiente.c_inc-1)].nombre+'</a></div><div style="margin-left: 400px;"><a><img src="img/icons/fugue/cross-circle.png" width="16" height="16"></a></div></li>');
									  if(objDiente.s1_inc != 0)$('ul#popListInc').append('<li><div style="float:left"><a>'+listIncidencia[(objDiente.s1_inc-1)].nombre+'</a></div><div style="margin-left: 400px;"><a><img src="img/icons/fugue/cross-circle.png" width="16" height="16"></a></div></li>');
									  if(objDiente.s2_inc != 0)$('ul#popListInc').append('<li><div style="float:left"><a>'+listIncidencia[(objDiente.s2_inc-1)].nombre+'</a></div><div style="margin-left: 400px;"><a><img src="img/icons/fugue/cross-circle.png" width="16" height="16"></a></div></li>');
									  if(objDiente.s3_inc != 0)$('ul#popListInc').append('<li><div style="float:left"><a>'+listIncidencia[(objDiente.s3_inc-1)].nombre+'</a></div><div style="margin-left: 400px;"><a><img src="img/icons/fugue/cross-circle.png" width="16" height="16"></a></div></li>');
									  if(objDiente.s4_inc != 0)$('ul#popListInc').append('<li><div style="float:left"><a>'+listIncidencia[(objDiente.s4_inc-1)].nombre+'</a></div><div style="margin-left: 400px;"><a><img src="img/icons/fugue/cross-circle.png" width="16" height="16"></a></div></li>');
									  if(objDiente.s5_inc != 0)$('ul#popListInc').append('<li><div style="float:left"><a>'+listIncidencia[(objDiente.s5_inc-1)].nombre+'</a></div><div style="margin-left: 400px;"><a><img src="img/icons/fugue/cross-circle.png" width="16" height="16"></a></div></li>');
									  
									  
								  });				
							});			
						}
					});
		  	 }

	  });

	  function openModalDiente(titulo, contenido)
	  {
	  	$.modal({
	  		content: contenido,
	  		title: titulo,
	  		maxWidth: 500,
	  		buttons: {
	  			'Guardar': function(win) {  },
	  			'Cerrar': function(win) { win.closeModal(); }
	  		}
	  	});
	  }	  
	  function openModal(titulo, contenido, niveluso, idHallazgo)
	  {
	  	$.modal({
	  		content: contenido,
	  		title: titulo,
	  		maxWidth: 500,
	  		buttons: {
	  			'Guardar': function(win) { registrarHallazgo(niveluso,idHallazgo, win); },
	  			'Cerrar': function(win) { win.closeModal(); }
	  		}
	  	});
	  }
	  function registrarHallazgo(niveluso, idHallazgo, win) {
		  	var img = $('div#contHallazgo').find('li#'+idHallazgo).find('img').attr('src');
		  	if(idHallazgo != 4){

			if(niveluso == 0){	//CORONA
				var pieza = $('div.modal-content').find('#simple_form').find('#pieza').attr('value');
				if(validaCorona(pieza)=="exito"){
						var ePieza = $("div#contDentadura").find('div#pieza'+pieza);
						listDiente[(pieza-1)].estado = 1;$(ePieza).css({"opacity":"1"});
						listDiente[(pieza-1)].c_inc=idHallazgo;
						listDiente[(pieza-1)].c_est=1;
						$.ajax({
					          url: "http://localhost:8080/sermeden/odontograma/save",
					          type: "POST",
					          data: listDiente[(pieza-1)],
					          success:function(response)
					          {
								ePieza.find('img.imgCorona').attr({"src":img});
								win.closeModal();
					          },
					          error: function(jqXHR, textStatus, errorThrown){
					              alert("error:" + textStatus + " exception:" + errorThrown);
					          }
						});
				}
			}
			if(niveluso == 1){ //PAR
				var ld = $('div.modal-content').find('#simple_form').find('#ld').attr('value');
				var li = $('div.modal-content').find('#simple_form').find('#li').attr('value');
				if(listDiente[(ld-1)].li_inc == 0) {
					var ePiezaLD = $("div#contDentadura").find('div#pieza'+ld);
					if(listDiente[(ld-1)].estado==2){
						var imgnull = "img/odontograma/incidencias/0.png";
						$(ePiezaLD).css({"opacity":"1"});$(ePiezaLD).find('img.imgCorona').attr({"src":imgnull});
						listDiente[(ld-1)].estado = 1;
					}
					listDiente[(ld-1)].li_inc = idHallazgo;
					listDiente[(ld-1)].li_est=1;
					$.ajax({
				          url: "http://localhost:8080/sermeden/odontograma/save",
				          type: "POST",
				          data: listDiente[(ld-1)],
				          success:function(response){
				          $(ePiezaLD).find('div.li').css({"background-image":"url("+img+")"});
				          },error: function(jqXHR, textStatus, errorThrown){alert("error:" + textStatus + " exception:" + errorThrown);}
				          
					});
				}
				if(listDiente[(li-1)].ld_inc == 0) {
					var ePiezaLI = $("div#contDentadura").find('div#pieza'+li); 
					if(listDiente[(li-1)].estado==2){
						var imgnull = "img/odontograma/incidencias/0.png";
						$(ePiezaLI).css({"opacity":"1"});$(ePiezaLI).find('img.imgCorona').attr({"src":imgnull});
						listDiente[(li-1)].estado = 1;
					}
					listDiente[(li-1)].ld_inc = idHallazgo;
					listDiente[(li-1)].ld_est=1;
					$.ajax({
				          url: "http://localhost:8080/sermeden/odontograma/save",
				          type: "POST",
				          data: listDiente[(li-1)],
				          success:function(response){
				          $(ePiezaLI).find('div.ld').css({"background-image":"url("+img+")"});
				          },error: function(jqXHR, textStatus, errorThrown){alert("error:" + textStatus + " exception:" + errorThrown);}
				          
					});
				}
				win.closeModal();
			}
			if(niveluso == 2){//SECTOR
				var pieza = $('div.modal-content').find('#simple_form').find('#pieza').attr('value');
				var ePieza = $("div#contDentadura").find('div#pieza'+pieza); 
				var sector = $('div.modal-content').find('#simple_form').find('#sector').attr('value');
				if(listDiente[(pieza-1)].estado==2){
					var imgnull = "img/odontograma/incidencias/0.png";
					$(ePieza).css({"opacity":"1"});$(ePieza).find('img.imgCorona').attr({"src":imgnull});
					listDiente[(pieza-1)].estado = 1;
				}
				if(sector == 1){listDiente[(pieza-1)].s1_inc = idHallazgo;listDiente[(pieza-1)].s1_est = 1;}
				if(sector == 2){listDiente[(pieza-1)].s2_inc = idHallazgo;listDiente[(pieza-1)].s2_est = 1;}
				if(sector == 3){listDiente[(pieza-1)].s3_inc = idHallazgo;listDiente[(pieza-1)].s3_est = 1;}
				if(sector == 4){listDiente[(pieza-1)].s4_inc = idHallazgo;listDiente[(pieza-1)].s4_est = 1;}
				if(sector == 5){listDiente[(pieza-1)].s5_inc = idHallazgo;listDiente[(pieza-1)].s5_est = 1;}
				$.ajax({
			          url: "http://localhost:8080/sermeden/odontograma/save",
			          type: "POST",
			          data: listDiente[(pieza-1)],
			          success:function(response)
			          {
			        	var color;
						if(idHallazgo==1){color="rgb(150,50,50)";}if(idHallazgo==6){color="#1179e3";}
						$("div#contDentadura").find('div#pieza'+pieza).find('div.s'+sector).css({"background":color});
						win.closeModal();
			          },
			          error: function(jqXHR, textStatus, errorThrown){
			              alert("error:" + textStatus + " exception:" + errorThrown);
			          }
				});
			}
			}else{
				var pieza = $('div.modal-content').find('#simple_form').find('#pieza').attr('value');
				listDiente[(pieza-1)].estado = 2;
				listDiente[(pieza-1)].c_inc = 0;listDiente[(pieza-1)].c_est = 0;
				listDiente[(pieza-1)].s1_inc = 0;listDiente[(pieza-1)].s1_est = 0;
				listDiente[(pieza-1)].s2_inc = 0;listDiente[(pieza-1)].s2_est = 0;
				listDiente[(pieza-1)].s3_inc = 0;listDiente[(pieza-1)].s3_est = 0;
				listDiente[(pieza-1)].s4_inc = 0;listDiente[(pieza-1)].s4_est = 0;
				listDiente[(pieza-1)].s5_inc = 0;listDiente[(pieza-1)].s5_est = 0;
				listDiente[(pieza-1)].ld_inc = 0;listDiente[(pieza-1)].ld_est = 0;
				listDiente[(pieza-1)].li_inc = 0;listDiente[(pieza-1)].li_est = 0;
				$.ajax({
			          url: "http://localhost:8080/sermeden/odontograma/save",
			          type: "POST",
			          data: listDiente[(pieza-1)],
			          success:function(response)
			          {
						var ePieza = $("div#contDentadura").find('div#pieza'+pieza);
						$(ePieza).find('img.imgCorona').attr({"src":img});
						$(ePieza).find('div.s1').removeClass().addClass('s1');
						$(ePieza).find('div.s2').removeClass().addClass('s2');
						$(ePieza).find('div.s3').removeClass().addClass('s3');
						$(ePieza).find('div.s4').removeClass().addClass('s4');
						$(ePieza).find('div.s5').removeClass().addClass('s5');
						$(ePieza).find(".ld").css({"background-image":"url(img/odontograma/incidencias/0.png)"});
						$(ePieza).find(".li").css({"background-image":"url(img/odontograma/incidencias/0.png)"});
						$(ePieza).css({"opacity":"0.2"});
						win.closeModal();
			          },
			          error: function(jqXHR, textStatus, errorThrown){
			              alert("error:" + textStatus + " exception:" + errorThrown);
			          }
				});
			}
	  }
	  function validaCorona(pieza){
		  if(pieza > 0 && pieza <= listDiente.length ){
			  if(listDiente[(pieza-1)].c_inc!=0){
				  alert("Ya contiene una incidencia");
				  return "error";
			  }else{
				  return "exito";
			  }
		  }else{
			  alert("La pieza debe dentro de [1 - "+listDiente.length+"]");
			  return "error";  
		  }

	  }
	  function JsonSubmitAjax(url, data){
			jQuery.ajax({
		          url: url,
		          type: "POST",
		          data: data,
		          dataType: "json",
		          beforeSend: function(x) {
		        	  
		          },
		          success: function(result) {
		 	      		return result;
		          }
			});
	  }