function deleteLocation(id){
    console.log("deletelocation.js inside deleteLocation() id =  "+id)
    
    $.ajax({
        url: '/people/deleteLocation/'+ id,
        type: 'DELETE',
        success: function(result){
            window.location.reload(true);
        }
    })
    
};

function deleteLocationCert(pid, cid){
    /* //have not implemented yet - martin ;)
  $.ajax({
      url: '/people_certs/pid/' + pid + '/cert/' + cid,
      type: 'DELETE',
      success: function(result){
          if(result.responseText != undefined){
            alert(result.responseText)
          }
          else {
            window.location.reload(true)
          } 
      }
  })
  */
};