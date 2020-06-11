$( document.body )
  .click(function() {
    $('select').select2({
		    allowClear: true,
		    theme: "bootstrap",
		    minimumInputLength: 1
		});
  })
  // Trigger the click to start
  .trigger( "click" );
