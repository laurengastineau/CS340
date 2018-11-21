function deleteLineup(id){
    console.log("deletelineup.js inside deleteLineup() id =  "+id)
    
    $.ajax({
        url: '/people/deleteLineup/'+ id,
        type: 'DELETE',
        success: function(result){
            window.location.reload(true);
        }
    })
    
};