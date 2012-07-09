/*
composed by Brian Jaeger
home page: brianjaeger.com
*/
(function ($) {
  $.fn.limitkeypress = function (options) {
    var defaults = {
		rexp: /^[-+]?\d*\.?\d*$/ //only positive or negitive decimal numbers are allowed 
	};
	var options = $.extend(defaults, options);
	
	return this.each(function() {
		var regExpression = options.rexp; //get the regular expression
		
		$(this).blur(function() { 
			//this fixes the problem of paste of invalid data then loss of focus ie clicked submit button or tab 
			sanitize(this);
		});
		
		$(this).keypress(function(e) {
			//alow backspace(8), enter(13), and other non character keypress events
			if (e.which == "0" || e.which == "8" || e.which == "13" || e.ctrlKey || e.altKey){ 
				return;
			}
			
			//this fixes the problem of blur not triggering on enter keypress and it alows valid keypress events after an invalid paste/auto complete
			sanitizeWithSelection(this); 
			
			var pressedChar = String.fromCharCode(e.which),  //get string value for pressed char
				//insert the pressed char at the caret/cursor location for testing
				updatedInput = this.value.substring(0, getSelectionStart(this))
				+ pressedChar
				+ this.value.substring(getSelectionEnd(this), this.value.length);
			if (!regExpression.test(updatedInput)) {
				e.preventDefault(); //stop the keypress event
				return;
			}
			return;
		});
		
		//steps throu each char  of a text input value validating each char + the next if the add is valid... 
		function sanitizeWithSelection(o) {
			var startCaretPos = getSelectionStart(o),
				endCaretPos = getSelectionEnd(o),
				temp = "",
				testPlusChar = "",
				selectionCharInfo = [];
			
			//records selection information for each char
			for (var i=0;i<o.value.length;i++) {
				if (startCaretPos > i){
					selectionCharInfo[i] = 'beforeSelection';
				} else if ((startCaretPos <= i) && (endCaretPos > i)) {
					selectionCharInfo[i] = 'inSelection';
				} //note: if a char after the selection is invalid the selection would not change if that char is removed...
			}
			
			for (var i=0;i<o.value.length;i++) {
				var iPlusOne = i + 1;
				testPlusChar += o.value.substring(i,iPlusOne);
				if ((!regExpression.test(testPlusChar))) {
					var lastChar = testPlusChar.length-1;
					temp = testPlusChar.substring(0,lastChar);
					testPlusChar = temp;
					if (selectionCharInfo[i] == 'beforeSelection'){
						startCaretPos = startCaretPos - 1;
						endCaretPos = endCaretPos - 1;
					} else if (selectionCharInfo[i] == 'inSelection'){
						endCaretPos = endCaretPos - 1;
					}
				}
			}
			o.value = testPlusChar;
			setSelectionRange (o,startCaretPos,endCaretPos);
		}
		
		//steps throu each char  of a text input value validating each char + the next if the add is valid... 
		function sanitize(o) {
			var temp = "",
				testPlusChar = "";
				
			for (var i=0;i<o.value.length;i++) {
				var iPlusOne = i+1;
				testPlusChar += o.value.substring(i,iPlusOne);
				if ((!regExpression.test(testPlusChar))) {
					var lastChar = testPlusChar.length-1;
					temp = testPlusChar.substring(0,lastChar);
					testPlusChar = temp;
				}
			}
			o.value = testPlusChar;
		}
		
		//from: http://javascript.nwbox.com/cursor_position/
		function getSelectionStart(o) {
			if (o.createTextRange) {
				var r = document.selection.createRange().duplicate();
				r.moveEnd('character', o.value.length);
				if (r.text == '') return o.value.length;
				return o.value.lastIndexOf(r.text);
			} else return o.selectionStart;
		}
		
		//from: http://javascript.nwbox.com/cursor_position/
		function getSelectionEnd(o) {
			if (o.createTextRange) {
				var r = document.selection.createRange().duplicate();
				r.moveStart('character', -o.value.length);
				return r.text.length;
			} else return o.selectionEnd;
		}
		
		//from http://www.codingforums.com/archive/index.php/t-90176.html
		function setSelectionRange(input, selectionStart, selectionEnd){
			if (input.setSelectionRange) {
				input.focus();
				input.setSelectionRange(selectionStart, selectionEnd);
			}
			else if (input.createTextRange) {
				var range = input.createTextRange();
				range.collapse(true);
				range.moveEnd('character', selectionEnd);
				range.moveStart('character', selectionStart);
				range.select();
			}
		}
    });
  };
})(jQuery);