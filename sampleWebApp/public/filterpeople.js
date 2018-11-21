function filterPeopleByConcert() {
    console.log("filter button clicked")  
    //get the id of the selected homeworld from the filter dropdown
    var concert_id = document.getElementById('concert_filter').value
    //construct the URL and redirect to it
    window.location = '/people/filter/' + parseInt(concert_id)
}
