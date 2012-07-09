<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<div class="row content">
	
	
</div>


<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script type="text/javascript">
	
	
	jQuery(function($) {
		var App = {
			init : function() {
				this.cacheElements();
				this.bindEvents();
			},
			cacheElements : function() {
				this.ulNav = $('ul#menu');
				this.firstItemList = $('ul#menu > li');
				this.liTarget = $('li',this.firstItemList);
				this.$content = $('.content');
			},
			render : function() {

			},
			setOptions : function() {

			},
			setInputRegex : function() {

			},
			bindEvents : function() {
				this.liTarget.on('click',this.updateContent);
				
			},
			/* == Functions == */
			updateContent:function(e){
				var href = $(this).find('a').attr('href')
				App.resolveContent(href);
				return false;
			},
			resolveContent:function(href){
				if(href!='#'){
					console.log('href ' + href);
					this.$content.empty();
					this.$content.load(href);
					return;
				}
				console.log('href incorrect (#).');
			}
			
		};

		App.init();
	});
</script>