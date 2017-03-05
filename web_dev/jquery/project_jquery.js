$ (document).ready( function(){

  $ ("img").hide();
  $ ("#rude").hide();

  $ ("span").click(function(event) {

    $ ("img").show("slow");
    $ (this).hide("slow");

    $ ("img").hover(function(event) {
      $ ("img").hide();
      $ ("#rude").show();
    });



  });




});
