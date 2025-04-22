<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>PHP Info - CTOMMASI</title>
  <style>
    body {
      margin: 0;
      background-color: black;
      color: white;
      font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
    }

    .top-button {
      text-align: left;
      padding: 20px;
      background-color: black;
    }

    .top-button a {
      background-color: white;
      color: black;
      padding: 12px 28px;
      text-decoration: none;
      font-weight: bold;
      text-transform: uppercase;
      font-size: 1em;
      border: none;
    }

    .top-button a:hover {
      background-color: #333;
      color: white;
    }

    .phpinfo-container {
      padding: 20px;
    }

    table, td, th {
      border: 1px solid #555 !important;
    }

    table {
      width: 100%;
      border-collapse: collapse !important;
      background-color: #222 !important;
    }

    td, th {
      color: white !important;
      background-color: #333 !important;
      padding: 5px !important;
    }

    h1, h2 {
      color: white !important;
    }

    a {
      color: #89CFF0;
    }
  </style>
</head>
<body>

  <div class="top-button">
    <a href="/index.html">Back to Home</a>
  </div>

  <div class="phpinfo-container">
    <?php
      ob_start();
      phpinfo();
      $info = ob_get_clean();
      $info = preg_replace('%^.*<body>(.*)</body>.*$%ms', '$1', $info);
      echo $info;
    ?>
  </div>

</body>
</html>
