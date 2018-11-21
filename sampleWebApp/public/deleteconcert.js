function deleteConcert(id){
    console.log("deleteconcert.js inside deleteConcert() id =  "+id)
    
    $.ajax({
        url: '/people/deleteConcert/'+ id,
        type: 'DELETE',
        success: function(result){
            window.location.reload(true);
        }
    })
    
};