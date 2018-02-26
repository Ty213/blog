$( document ).ready(function() {
   var commentsButton = document.querySelector('.commentsButton');
   var commentsList = document.querySelector('.commentsList');
   console.log(commentsButton);

   commentsButton.addEventListener("click", function() {

    if (commentsList.style.display === "none") {
        commentsList.style.display = "block";
    } else {
        commentsList.style.display = "none";
    }
    
   })

});




