<?php

    if(isset($_POST['search']))
    {
        
    }
    else
    {
        $query = "SELECT * FROM `Association`";
        $search_result = filterTable($query);
    }
    
    function filterTable($query)
    {
        $filter_result = mysqli_query($link, $query);
        return $filter_result;
    }
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
        <title>Search</title>
    </head>

    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">WebSiteName</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/index.php">Home</a></li>
                    <li><a href="/database/reporting">Reporting</a></li>
                    <li><a href="/database/search">Search</a></li>
                    <li><a href="/database/maintenance.html">Database Maintenance</a></li>
                </ul>
            </div>
        </nav>
        <h1 style="margin-left:1%">Search</h1>
        
        <form>
            <input type="text" name="associationSearch" placeholder="Enter association name to search for"><br><br>
            <input type="submit" name="search" value="Filter"><br><br>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Description</th>
                </tr>
                <?php while($row = mysqli_fetch_array($search_result)):?>
                <tr>
                    <td><?php echo $row['name'] ?></td>
                    <td><?php echo $row['address'] ?></td>
                    <td><?php echo $row['description'] ?></td>
                </tr>
                <?php endwhile; ?>
            </table>
            
        </form>
    </body>
</html>