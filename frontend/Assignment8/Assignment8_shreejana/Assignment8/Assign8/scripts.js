// created by Shreejana Shrestha

// Change Background Color of div with class box on Click 
$(".box").on("click", function() {
    $(this).css("background-color", "#2274A5").text('Clicked');
  });

  // ******Implementing Common Events *****

// click implementation
  $("#clickMe").on("click", function() {
    alert("Button clicked!");
  });

//   hover implementation
  $("#hoverMe").hover(
    function() {
      $(this).css("background-color", "yellow");
    }, function() {
      $(this).css("background-color", "");
    }
  );

//   focus implementation
  $("#focusMe").on("focus", function() {
    $(this).css("background-color", "lightblue");
  });

  // blur implementation
  $("#blurMe").on("blur", function() {
    alert("Input blur.");
  });



  $( "#other" ).on( "click", function() {
    $( "#target" ).trigger( "blur" );
  } );

  // Show and Hide Elements on the <div> element with the id content.

  $("#clickMe").on("click", function() {
    $("#content").toggle();
  });

  // Showing Fading Effects for 5 seconds
  $("#fadeInButton").click(function() {
    $("#fadeBox").fadeIn(5000);
  });

  // fade out functionality
  $("#fadeOutButton").click(function() {
    $("#fadeBox").fadeOut(5000);
  });

  // fade toggle functionality
  $("#fadeToggleButton").click(function() {
    $("#fadeBox").fadeToggle(5000);
  });

  $("#fadeToButton").click(function() {
    $("#fadeBox").fadeTo("slow", 0.5);
  });

  // Showing Sliding Effects
  $("#clickMe").on("click", function() {
    $("#slideBox").slideDown("slow");
  });

  $("#slideUpButton").click(function() {
    $("#slideBox").slideUp(400);
  });

  // Changing Image Source on the image
  $("#changeImageButton").on("click", function() {
    $("#image").attr("src", "images/new-image.png");
  });

  // Change CSS of <p> element with the class text
  $("#changeStyleButton").on("click", function() {
    $(".text").css({
      "color": "red",
      "font-size": "20px",
      "font-weight": "bold"
    });
  });

  $("#fadeInButton").on("click", function() {
    $("#fadeBox").fadeIn(2000);
  });

  $("#slideDownButton").on("click", function() {
    $("#slideBox").slideDown();
  });

  // Show and Hide Elements
  $("#showHideButton").on("click", function() {
    let newText = $(this).text() === 'Hide Content' ? 'Show Content' : 'Hide Content';
    $(this).text(newText);
    $("#content").toggle();
  });


  