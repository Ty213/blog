
//runs when app changes to a different page.
$(document).on('turbolinks:load', function() {
    //checks if the page has a comment button then runs.
    if(document.querySelector('.commentsButton')) {
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
}

});




