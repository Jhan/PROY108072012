jQuery(function($) {
	
var App ={
	init:function(){
		this.LOGIN_DIALOG_WIDTH = '550';
		this.LOGIN_DIALOG_HEIGTH = '300';
		
		//TODO Put it in a separate file
		this.ONLY_LETTER_REGEX = /^[a-zA-Z]+$/;
		this.ALPHANUMERIC_REGEX = /^[a-zA-Z0-9]+$/;
		
		this.cacheElements();
		this.render();
		this.setOptions();
		this.setInputRegex();
		this.bindEvents();
		
		//TODO Fix it later :P
		this.$loginDialog.dialog('close');
		this.$loginDialog.dialog('open');
	},
	cacheElements:function(){
		this.$loginDialog = $('#divLogin');
		this.$loginForm = $('form', this.$loginDialog);
		this.$username = $('#username');
		this.$password = $('#password');
		//TODO Refactoring
		this.$window = $(window);
	},
	render:function(){
		/* #divLogin */
		this.$loginDialog.dialog({open:this.openLoginForm});
	},
	setOptions:function(){
		/* #divLogin */
		var loginFormOpts = {closeOnEscape:false, 
							 draggable: false, 
							 resizable: false,
							 minWidth: this.LOGIN_DIALOG_WIDTH, 
							 minHeight: this.LOGIN_DIALOG_HEIGTH,
							 autoOpen:false};
		this.$loginDialog.dialog('option',loginFormOpts);
	},
	setInputRegex:function(){
		this.$username.limitkeypress({ rexp: this.ONLY_LETTER_REGEX });
		this.$password.limitkeypress({ rexp: this.ALPHANUMERIC_REGEX });
	},
	bindEvents:function(){
		this.$window.on('resize',this.centerLoginForm);
		this.$loginForm.validationEngine('attach',{binded:true});
	},
	/* == Functions == */
	openLoginForm:function(event, ui) { 
		$('.ui-dialog-titlebar').remove();
	},
	centerLoginForm:function(){
		App.$loginDialog.dialog("option", "position", "center");
		
	}
};

App.init();

});