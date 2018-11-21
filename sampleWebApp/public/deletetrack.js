function deleteTrack(id){
    console.log("deletetrack.js inside deleteTrack() id =  "+id)
    
    $.ajax({
        url: '/people/deleteTrack/'+ id,
        type: 'DELETE',
        success: function(result){
            window.location.reload(true);
        }
    })
    
};