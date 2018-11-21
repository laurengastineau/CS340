function deleteTracklist(id){
    console.log("deletetracklist.js inside deleteTracklist() id =  "+id)
    
    $.ajax({
        url: '/people/deleteTracklist/'+ id,
        type: 'DELETE',
        success: function(result){
            window.location.reload(true);
        }
    })
    
};