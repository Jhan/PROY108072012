var arrayDentSup=[];
var arrayDentInf=[];
var contDiente = 0;
var objDiente = {
		nroDiente : null,
		ausente:"no",
		tipo : null,
		sectores : [
		            {
    	    			nro:1,
    	    			idHallazgo:null,
    	    			estadoCuracion:null,
    	    			estado:null	
		            },
		            {
    	    			nro:2,
    	    			idHallazgo:null,
    	    			estadoCuracion:null,
    	    			estado:null	
		            },
		            {
    	    			nro:3,
    	    			idHallazgo:null,
    	    			estadoCuracion:null,
    	    			estado:null	
		            },
		            {
    	    			nro:4,
    	    			idHallazgo:null,
    	    			estadoCuracion:null,
    	    			estado:null	
		            },
		            {
    	    			nro:5,
    	    			idHallazgo:null,
    	    			estadoCuracion:null,
    	    			estado:null	
		            }
		],
		implantes:[],
		hallazgos : []
	};
$(document).ready(function(){

	var htmlDentSup = createPieza("molar");
	htmlDentSup += createPieza("molar");
	htmlDentSup += createPieza("molar");
	htmlDentSup += createPieza("premolar");
	htmlDentSup += createPieza("premolar");
	htmlDentSup += createPieza("canino");
	htmlDentSup += createPieza("incisivo");
	htmlDentSup += createPieza("incisivo");
	htmlDentSup += createPieza("incisivo");
	htmlDentSup += createPieza("incisivo");
	htmlDentSup += createPieza("canino");
	htmlDentSup += createPieza("premolar");
	htmlDentSup += createPieza("premolar");	
	htmlDentSup += createPieza("molar");
	htmlDentSup += createPieza("molar");
	htmlDentSup += createPieza("molar");
	$('#superior').append(htmlDentSup);
	
	var htmlDentInf = createPiezaInf("molar");
	htmlDentInf += createPiezaInf("molar");
	htmlDentInf += createPiezaInf("molar");
	htmlDentInf += createPiezaInf("premolar");
	htmlDentInf += createPiezaInf("premolar");
	htmlDentInf += createPiezaInf("canino");
	htmlDentInf += createPiezaInf("incisivo");
	htmlDentInf += createPiezaInf("incisivo");
	htmlDentInf += createPiezaInf("incisivo");
	htmlDentInf += createPiezaInf("incisivo");
	htmlDentInf += createPiezaInf("canino");
	htmlDentInf += createPiezaInf("premolar");
	htmlDentInf += createPiezaInf("premolar");	
	htmlDentInf += createPiezaInf("molar");
	htmlDentInf += createPiezaInf("molar");
	htmlDentInf += createPiezaInf("molar");
	$('#inferior').append(htmlDentInf);

	function createPieza(tipo){
		contDiente += 1;
		objDiente.nroDiente = contDiente;
		objDiente.tipo = tipo;
		arrayDentSup.push(objDiente);
		return ''+
		'<div class="pieza" id="pieza'+contDiente+'" nro="'+contDiente+'">'+
			'<input id="ubicacion" type="hidden" value="sup"/>'+
			'<img alt="" src="img/odontograma/'+tipo+'.png" class="imgPieza">'+
			'<div class="contDiastDer"></div>'+
			'<div class="contSector">'+
				'<div class="sectorh" id="1"></div>'+
				'<div class="contSectorv">'+
				'<div class="sectorv" id="2"></div><div class="sectorv" id="3" style="width: 16px;"></div><div class="sectorv" id="4" style="border-right: solid 1px;"></div>'+
				'</div>'+
				'<div class="sectorh" id="5"></div>'+
			'</div>'+
			'<div class="contDiast"></div>'+
			'<div class="nroPieza"><span>'+contDiente+'</span></div>'+
		'</div>';
	}
	function createPiezaInf(tipo){
		contDiente += 1;
		objDiente.nroDiente = contDiente;
		objDiente.tipo = tipo;
		arrayDentSup.push(objDiente);
		return ''+
		'<div class="pieza" id="pieza'+contDiente+'" nro="'+contDiente+'">'+
			'<input id="ubicacion" type="hidden" value="inf"/>'+
			'<div class="nroPieza"><span>'+contDiente+'</span></div>'+
			'<div class="contDiastDer"></div>'+
			'<div class="contSector">'+
				'<div class="sectorh" id="1"></div>'+
				'<div class="contSectorv">'+
				'<div class="sectorv" id="2"></div><div class="sectorv" id="3" style="width: 16px;"></div><div class="sectorv" id="4" style="border-right: solid 1px;"></div>'+
				'</div>'+
				'<div class="sectorh" id="5"></div>'+
			'</div>'+
			'<div class="contDiast"></div>'+
			'<img alt="" src="img/odontograma/inf/'+tipo+'.png" class="imgPieza">'+
		'</div>';
	}	
	
});
$.ajax({
	dataType : 'json',
	success : function(data) {
	    $.each(data.hallazgos, function(i,item){
			var html = '<li><input id="idHallazgo" type="hidden" value="'+item.id+'"/><img src="'+item.src_img+'" title="'+item.nombre+'"/><br><span>'+item.nombre+'</span><input id="modo_uso" type="hidden" value="'+item.modo_uso+'"/></li>';
			$('#listHallazgo').append(html);
		//<img src="'+item.src_img+'"/><span>'+item.nombre+'</span><input id="modo_uso" type="hidden" value="'+item.modo_uso+'"/>
	    });
	    $("ul#listHallazgo li").click(function () {
	    	var titulo = $(this).find('img').attr('title');
	    	
	    	var idHallazgo = $(this).find('#idHallazgo').attr('value');
	    	var srcHallazgo = $(this).find('img').attr('src');
	    	var modo_uso = $(this).find('#modo_uso').attr('value');
	    	var contHtml=
	    		'<form class="block-content form" id="simple_form" method="post" action="#">'+
	    		//'<h1>'+$(this).find('img').attr('title')+'</h1><br>'+
	    				'<input id="tipoHallazgo" type="hidden" value="'+modo_uso+'"/>'+
	    				'<input id="hallazgo" type="hidden" cod="'+idHallazgo+'" src="'+srcHallazgo+'"/>';
	    	if(modo_uso == 'sec' || modo_uso == 'rest'){
	    		contHtml=contHtml+'<p>'+
				'<label for="simple-required">Pieza</label>'+
				'<input type="text" name="simple-required" id="simple-required" value="" >'+
				'<br><br><label for="simple-required">Sector</label><input id="sector" type="text" name="simple-required" >'+
			'</p>';
	    		//contHtml=contHtml+'Pieza <input id="pieza" type="text" name="simple-required"  class="full-width"><br>Sector <input id="sector" type="text" name="simple-required"  class="full-width">';
	    	}
	    	if(modo_uso == 'cor'){
	    		contHtml=contHtml+'Pieza <input id="pieza" type="text" name="simple-required">';
	    	}
	    	if(modo_uso == 'ausente'){
	    		contHtml=contHtml+'Pieza <input id="pieza" type="text" name="simple-required">';
	    	}
	    	if(modo_uso == 'par'){
	    		contHtml=contHtml+'Pieza Der<input id="pieza" type="text" name="simple-required"> <br> Pieza Izq<input id="piezaIzq" type="text" name="simple-required">';
	    	}
	    	contHtml=contHtml+'</form>';
	    	openModal(titulo, contHtml);
		});

	},
	url : 'http://localhost:8080/sermeden/json/hallazgos.json'
});
function verDetalle(){
	$("div.contDetOdontograma").fadeIn("slow");
}
function registrarHallazgo() {
	var arrayElemInputPop = $("div#modal").find('input[type=text]');
	var nroPieza = $(arrayElemInputPop[0]).attr('value');
	
	var hallazgo = $("div#modal").find('#hallazgo');
	var selIdHallazgo = $(hallazgo).attr('value');
	var srcHallazgo = $(hallazgo).attr('src');
	var tipoHallazgo = $("div#modal").find('#tipoHallazgo').attr('value');
	
	var searchPieza = "div#pieza"+nroPieza;
	var elemPieza = $("div#contDentadura").find(searchPieza);
	var piezaSupOrInf = $(elemPieza).find("#ubicacion").attr('value');
	//var dieAusente = arrayDentSup[nroPieza-1].ausente;
	//var your_object = JSON.stringify(arrayDentSup);

	//if(dieAusente == "no"){
	    if(tipoHallazgo=="sec"){
	    	var nroSector = $(arrayElemInputPop[1]).attr('value');
	    	var searchSec = "div#"+nroSector;
	    	$("div#contDentadura").find(searchPieza).find(searchSec).css({"background":"rgb(150,50,50)"});
	    }
	    if(tipoHallazgo=="rest"){
	    	var nroSector = $(arrayElemInputPop[1]).attr('value');
	    	var searchSec = "div#"+nroSector;
	    	$("div#contDentadura").find(searchPieza).find(searchSec).css({"background":"#1179e3"});
	    }
	    if(tipoHallazgo=="cor"){
		    if(piezaSupOrInf=="sup")createImgCorSup(elemPieza,srcHallazgo);
		    if(piezaSupOrInf=="inf")createImgCorInf(elemPieza,srcHallazgo);
	    }
	    if(tipoHallazgo=="par"){
	    	var nroPieza2 = $("div#modal").find('#piezaIzq').attr('value');
	    	var elemPieza1 = $("div#contDentadura").find("div#pieza"+nroPieza);
	    	alert(nroPieza2);
	    	var elemPieza2 = $("div#contDentadura").find("div#pieza"+nroPieza2);
	    	$(elemPieza1).find(".contDiast").css({"background-image":"url(img/odontograma/diastemaIzq.png)"});
	    	$(elemPieza2).find(".contDiastDer").css({"background-image":"url(img/odontograma/diastemaDer.png)"});

		   /* if(piezaSupOrInf=="sup")
		    if(piezaSupOrInf=="inf")*/
	    }
	    if(tipoHallazgo=="ausente"){
	    	$(elemPieza).css({"opacity":"0.2"});
	    	if(piezaSupOrInf=="sup")createImgCorSup(elemPieza,srcHallazgo);
	    	if(piezaSupOrInf=="inf")createImgCorInf(elemPieza,srcHallazgo);
	    }
	    
	/*}else{
		alert("Diente ausente");
	}*/
}
function createImgCorSup(elemPieza,srcHallazgo){
	var html = '<img src="'+srcHallazgo+'" class="imgCorona" style="top: -90px;"/>';
	$(elemPieza).append(html);
}
function createImgCorInf(elemPieza,srcHallazgo){
	var html = '<img src="'+srcHallazgo+'" class="imgCorona" style="top: -162px;"/>';
	$(elemPieza).append(html);	
}
function createModal(color){
	var popup = '<div class="contPopup"></div>';
	var screem = '<div class="screem" style="background:'+color+'"></div>';
	$('body').append(screem);
	$('body').append(popup);
	$('.contPopup').fadeIn("slow");$('.screem').fadeIn("slow");
}
function dropModal(){
	$('.contPopup').fadeOut("slow", function(){
		$('.contPopup').remove();
	});
	$('.screem').fadeOut("slow", function(){
		$('.screem').remove();
	});
}
function openModal(titulo, contenido)
{
	$.modal({
		content: contenido,
		title: titulo,
		maxWidth: 500,
		buttons: {
			'Guardar': function(win) { registrarHallazgo(); win.closeModal();},
			'Cerrar': function(win) { win.closeModal(); }
		}
	});
}