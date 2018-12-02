function updatePerson(id){
    console.log('updateperson.js id\n');
    $.ajax({
        url: '/people/' + id,
        type: 'PUT',
        data: $('#update-person').serialize(),
        success: function(result){
            window.location.replace("./");
        }
    })
};
