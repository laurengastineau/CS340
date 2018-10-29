
<html>
<head>
  <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
  <title>Sensor Node DBMS</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <link rel="stylesheet" href="./style.css" type="text/css">

  <!-- Horizontal Menu  -->
  <br>
  <br>
  <ul class = "horizontal_Menu">
    <li class = "menu_Item"><a class = "menu_Link" href="/~ehrichsk/index.php">View Content</a></li>
    <li class = "menu_Item"><a class = "menu_Link" href="/~ehrichsk/modify.php">Modify Content</a></li>
    <li class = "menu_Item"><a class = "menu_Link" href="/~ehrichsk/relational.php">Search Content</a></li>
    <br>
    <li class = "menu_Info">EhrichsK@oregonstate.edu</li>
    <br>
    <div style="margin: 0; position:relative; height:5px; padding:0px; background-color:white;"></div>
  </ul>
</head>
<!-- END Horizontal Menu  -->

<script>

function showEntity(str) {
  if (str == "") {
    document.getElementById("txt").innerHTML = "";
    return;
  } else {
    if (window.XMLHttpRequest) {
      // code for IE7+, Firefox, Chrome, Opera, Safari
      xmlhttp = new XMLHttpRequest();
    } else {
      // code for IE6, IE5
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("txt").innerHTML = this.responseText;
      }
    };
    xmlhttp.open("GET","getTable.php?q="+str,true);
    xmlhttp.send();
  }
}

</script>
<!-- END Horizontal Menu  -->

<body>
  <br>
  <br>

  <h3 class="info">
    Background:
  </h3>
  <br>
  <h3 class="info">
    This Database Design Project is a part of a larger project
    I have been working on for about a year. The larger project is a “Mesh-Like”
    network of Bluetooth Sensor Nodes. At each Node there exists sensors that
    record data in terms of Temperature, Humidity, Pressure, and Battery life of
    a given node.
  </h3>

  <br>

  <h3 class="info">
         Each node housing the above sensors, records data from the sensors
         and sends the data wirelessly to the next node. As each set of data
         is passed from one node to the next, all data sets will be directed
         towards the gateway where data is collected and stored.
  </h3>


  <br>
  <br>

  <h3 class="info">Select A Table to View its Contents</h3>
  <form class="tableForm">
    <select name="users" onchange="showEntity(this.value)">
      <option value="">Select an Entity:</option>
      <option value="1">Nodes</option>
      <option value="2">Gateways</option>
      <option value="3">Sets of Data</option>
      <option value="4">Locations</option>
    </select>
  </form>
  <div id="txt"><b>Entity table will be listed here...</b></div>


  <br>
</body>
</html>
