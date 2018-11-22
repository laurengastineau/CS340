// function filterPeopleByLineup() {
//     console.log("filter button clicked")  
//     //get the id of the selected homeworld from the filter dropdown
//     var lineup_id = document.getElementById('lineup_filter').value
//     //construct the URL and redirect to it
//     window.location = '/people/filter/' + parseInt(lineup_id)
// }

function searchConcerts() {
    // Declare variables 
    var input, filter, table, tr, td, i;
    input = document.getElementById("filterConcert");
    filter = input.value.toUpperCase();
    table = document.getElementById("viewConcert");
    tr = table.getElementsByTagName("tr");
  
    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
      td = tr[i].getElementsByTagName("td")[0];
      if (td) {
        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      } 
    }
  }