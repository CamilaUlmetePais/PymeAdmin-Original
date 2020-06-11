
$(window).load(function() {
  $('select').select2({
    allowClear: true,
		theme: 'bootstrap',
		minimumInputLength: 1
  });
});


$(document).ready(function() {
  $('.row').on('cocoon:after-insert', function(e, insertedItem) {
    console.log('PEPE');
    $('select#pepe').select2({
      allowClear: true,
	    theme: 'bootstrap',
	    minimumInputLength: 1
    });
  });
});