<article class="container_12">

</article>

	
<script src="js/minie721.php"></script>
	<script src="js/libs/jquery.dataTables.min.js"></script>
	<script src="js/libs/jquery.datepick/jquery.datepick.min.js"></script>

	<!-- <script src="http://www.google.com/jsapi"></script> -->
	<script>
		
		// Add listener for tab
		$('#tab-stats').onTabShow(function() { drawVisitorsChart(); }, true);
		
		// Handle viewport resizing
		var previousWidth = $(window).width();
		$(window).resize(function()
		{
			if (previousWidth != $(window).width())
			{
				drawVisitorsChart();
				previousWidth = $(window).width();
			}
		});
		
		// Demo chart
		function drawVisitorsChart() {

			// Create our data table.
			var data = new google.visualization.DataTable();
			var raw_data = [['Website', 50, 73, 104, 129, 146, 176, 139, 149, 218, 194, 96, 53],
							['Shop', 82, 77, 98, 94, 105, 81, 104, 104, 92, 83, 107, 91],
							['Forum', 50, 39, 39, 41, 47, 49, 59, 59, 52, 64, 59, 51],
							['Others', 45, 35, 35, 39, 53, 76, 56, 59, 48, 40, 48, 21]];
			
			var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
			
			data.addColumn('string', 'Month');
			for (var i = 0; i < raw_data.length; ++i)
			{
				data.addColumn('number', raw_data[i][0]);
			}
			
			data.addRows(months.length);
			
			for (var j = 0; j < months.length; ++j)
			{
				data.setValue(j, 0, months[j]);
			}
			for (var i = 0; i < raw_data.length; ++i)
			{
				for (var j = 1; j < raw_data[i].length; ++j)
				{
					data.setValue(j-1, i+1, raw_data[i][j]);
				}
			}
			
			// Create and draw the visualization.
			var div = $('#chart_div');
			new google.visualization.ColumnChart(div.get(0)).draw(data, {
				title: 'Monthly unique visitors count',
				width: div.width(),
				height: 330,
				legend: 'right',
				yAxis: {title: '(thousands)'}
			});
			
			// Message
			notify('Chart updated');
		};
		
	</script>
	
	<script>
		
		/*
		 * This script shows how to setup the various template plugins and functions
		 */
		
		$(document).ready(function()
		{
			/*
			 * Example context menu
			 */
			 $('article.container_12').load('http://localhost:8080/sermeden/pages/inicio.html');
			// Context menu for all favorites
			$('.favorites li').bind('contextMenu', function(event, list)
			{
				var li = $(this);
				
				// Add links to the menu
				if (li.prev().length > 0)
				{
					list.push({ text: 'Move up', link:'#', icon:'up' });
				}
				if (li.next().length > 0)
				{
					list.push({ text: 'Move down', link:'#', icon:'down' });
				}
				list.push(false);	// Separator
				list.push({ text: 'Delete', link:'#', icon:'delete' });
				list.push({ text: 'Edit', link:'#', icon:'edit' });
			});
			
			// Extra options for the first one
			$('.favorites li:first').bind('contextMenu', function(event, list)
			{
				list.push(false);	// Separator
				list.push({ text: 'Settings', icon:'terminal', link:'#', subs:[
					{ text: 'General settings', link: '#', icon: 'blog' },
					{ text: 'System settings', link: '#', icon: 'server' },
					{ text: 'Website settings', link: '#', icon: 'network' }
				] });
			});
			
			/*
			 * Dynamic tab content loading
			 */
			
			$('#tab-comments').onTabShow(function()
			{
				$(this).loadWithEffect('ajax-tab.html', function()
				{
					notify('Content loaded via ajax');
				});
			}, true);
			
			/*
			 * Table sorting
			 */
			
			// A small classes setup...
			$.fn.dataTableExt.oStdClasses.sWrapper = 'no-margin last-child';
			$.fn.dataTableExt.oStdClasses.sInfo = 'message no-margin';
			$.fn.dataTableExt.oStdClasses.sLength = 'float-left';
			$.fn.dataTableExt.oStdClasses.sFilter = 'float-right';
			$.fn.dataTableExt.oStdClasses.sPaging = 'sub-hover paging_';
			$.fn.dataTableExt.oStdClasses.sPagePrevEnabled = 'control-prev';
			$.fn.dataTableExt.oStdClasses.sPagePrevDisabled = 'control-prev disabled';
			$.fn.dataTableExt.oStdClasses.sPageNextEnabled = 'control-next';
			$.fn.dataTableExt.oStdClasses.sPageNextDisabled = 'control-next disabled';
			$.fn.dataTableExt.oStdClasses.sPageFirst = 'control-first';
			$.fn.dataTableExt.oStdClasses.sPagePrevious = 'control-prev';
			$.fn.dataTableExt.oStdClasses.sPageNext = 'control-next';
			$.fn.dataTableExt.oStdClasses.sPageLast = 'control-last';
			
			// Apply to table
			$('.sortable').each(function(i)
			{
				// DataTable config
				var table = $(this),
					oTable = table.dataTable({
						/*
						 * We set specific options for each columns here. Some columns contain raw data to enable correct sorting, so we convert it for display
						 * @url http://www.datatables.net/usage/columns
						 */
						aoColumns: [
							{ bSortable: false },	// No sorting for this columns, as it only contains checkboxes
							{ sType: 'string' },
							{ bSortable: false },
							{ sType: 'numeric', bUseRendered: false, fnRender: function(obj) // Append unit and add icon
								{
									return '<small><img src="img/icons/fugue/image.png" width="16" height="16" class="picto"> '+obj.aData[obj.iDataColumn]+' Ko</small>';
								}
							},
							{ sType: 'date' },
							{ sType: 'numeric', bUseRendered: false, fnRender: function(obj) // Size is given as float for sorting, convert to format 000 x 000
								{
									return obj.aData[obj.iDataColumn].split('.').join(' x ');
								}
							},
							{ bSortable: false }	// No sorting for actions column
						],
						
						/*
						 * Set DOM structure for table controls
						 * @url http://www.datatables.net/examples/basic_init/dom.html
						 */
						sDom: '<"block-controls"<"controls-buttons"p>>rti<"block-footer clearfix"lf>',
						
						/*
						 * Callback to apply template setup
						 */
						fnDrawCallback: function()
						{
							this.parent().applyTemplateSetup();
						},
						fnInitComplete: function()
						{
							this.parent().applyTemplateSetup();
						}
					});
				
				// Sorting arrows behaviour
				table.find('thead .sort-up').click(function(event)
				{
					// Stop link behaviour
					event.preventDefault();
					
					// Find column index
					var column = $(this).closest('th'),
						columnIndex = column.parent().children().index(column.get(0));
					
					// Send command
					oTable.fnSort([[columnIndex, 'asc']]);
					
					// Prevent bubbling
					return false;
				});
				table.find('thead .sort-down').click(function(event)
				{
					// Stop link behaviour
					event.preventDefault();
					
					// Find column index
					var column = $(this).closest('th'),
						columnIndex = column.parent().children().index(column.get(0));
					
					// Send command
					oTable.fnSort([[columnIndex, 'desc']]);
					
					// Prevent bubbling
					return false;
				});
			});

			$('ul.container_12 li').click(function(){
				var page = $(this).attr('page')+'.html';
				
				$('article.container_12').fadeOut("slow",function(){
					$('article.container_12').empty(); 
					$('article.container_12').load('http://localhost:8080/sermeden/pages/'+page, function(response, status, xhr){
						if(status=="success"){
	
							if(page == "pacientesAsignados.html"){
								var container = $('#pacientesAsignados').find('div.block-content');
								var ulCont = container.append('<ul id="listCliente"></ul>').find('ul#listCliente').addClass("icon-list icon-user");
								$.getJSON("http://localhost:8080/sermeden/patient/find?idmedico=1", function(data) {
								  		
								  	$.each(data.rows, function(i,item){
								  		var liCont = ulCont.append('<li></li>').find('li:eq('+(i)+')');
								  		liCont.append('<input type="hidden" id="dniPaciente" value="'+item.dni+'">');
								  		liCont.append('<a href="javascript:void(0)"></a>').find('a').append('<span class="icon"></span>'+item.name+'<br> <small>'+item.lastname+'</small>');
								  	});
								  	$('ul#listCliente li').click(function() {
								  		var dniPaciente = $(this).find('#dniPaciente').attr('value');
								  		$('article.container_12').fadeOut("slow",function(){
								  			$('article.container_12').empty(); 
								  			$('article.container_12').load('http://localhost:8080/sermeden/pages/paciente.html', function(response, status, xhr){
								  				if(status=="success"){
													$.getJSON("http://localhost:8080/sermeden/patient/find?dni="+dniPaciente,function(data) {
												  		$('section#paciente').find('h1#nomPaciente').append(data.rows[0].name+" "+data.rows[0].lastname);
												  	});
								  				}
								  			});
								  		});
								  		$('article.container_12').fadeIn("5000");
								  	});
								  	container.append('<ul class="message no-margin"><li>'+data.rows.length+' Paciente asignados</li></ul>');
								  });
								
							}
						}
					});
				});$('article.container_12').fadeIn("5000");
				//var page = $(this).attr('page')+'.html';	
				/*$('article.container_12').fadeOut("slow",function(){
					$('article.container_12').empty();
						$('article.container_12').load('http://localhost:8080/sermeden/pages/'+page);
	
				});
				$('article.container_12').fadeIn("5000");*/

			});
		});

	</script>