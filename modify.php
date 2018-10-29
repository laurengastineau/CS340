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
    xmlhttp.open("GET","modifyUser.php?q="+str,true);
    xmlhttp.send();
  }
}

function modifyEntity(str) {
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
    xmlhttp.open("GET","modifyContent.php?q="+str,true);
    xmlhttp.send();
  }
}

function addRowLoc(str) {
  console.log("str");
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
    xmlhttp.open("POST","AddRow.php?q="+str,true);
    xmlhttp.send();
  }
}


</script>
<!-- END Horizontal Menu  -->

<body>
  <br>
  <br>
  <h3 class="info">
         This page allows the User to modify content of the database. After
         Selecting a table from the dropdown, a new table will appear with the
         current data of the selected entity. From here, the user can modify
         specific entries or add new data.
  </h3>
  <br>
  <br>

  <h3 class = "info">Select A Table to Modify its Contents</h3>
  <form class="tableForm">
    <select name="users" onchange="showEntity(this.value)">
      <option value="">Select an Entity:</option>
      <option value="1">Nodes</option>
      <option value="2">Gateways</option>
      <option value="3">Sets of Data</option>
      <option value="4">Locations</option>
    </select>
  </form>
  <br>
  <div id="txt"><b>Entity table will be listed here...</b></div>

  <!-- <form method="post">
    <label id="first"> First name:</label><br/>
    <input type="text" name="username"><br/>

    <label id="first">Password</label><br/>
    <input type="password" name="password"><br/>

    <label id="first">Email</label><br/>
    <input type="text" name="email"><br/>

    <button type="submit" name="save">save</button>
    <button type="submit" name="get">get</button>
    </form> -->


</body>
</html>
