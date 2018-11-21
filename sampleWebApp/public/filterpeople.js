function filterPeopleByLineup() {
    console.log("filter button clicked")  
    //get the id of the selected homeworld from the filter dropdown
    var lineup_id = document.getElementById('lineup_filter').value
    //construct the URL and redirect to it
    window.location = '/people/filter/' + parseInt(lineup_id)
}
