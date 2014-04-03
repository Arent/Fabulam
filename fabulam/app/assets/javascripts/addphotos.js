(function() {
    var i = 1;
    window.addfile = function() {
        var input = document.createElement('input');
         input.id   = 'journey_image' + i ;
         input.name = 'journey[image' + i++ + ']'; 
         input.type = 'file';
       

        document.getElementById('form_name').appendChild(input);
    }
})();
