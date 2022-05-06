<?php
    include_once('includes/config.php');
    include_once('includes/session.php');
    include_once('includes/redirect.php');

    if(isset($_SESSION['username'])){
        
    }else{
        RedirectTo('index.php');
    }
?>
<!DOCTYPE html>
<html>
<style type="text/css">
    @media print {
        .btn-print {
            display: none !important;
        }
    }
</style>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report</title>
    <?php include_once('includes/styles.html') ?>
    <link href="../SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
    <script src="../SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
</head>

<body>
    <?php include_once('includes/nav.php') ?>
    <section class="container-wrap">
        <div class="container wrap">
            <div class="row">

                <div class="col-md-12 col">
                    <div class="gist-status">
                        <div class="row" style="margin: 0px;">
                            <h5 class="text-center">Department: <strong><?php echo $_SESSION['department'] ?> DEPARTMENT </strong></h5>
                            <h6 class="text-center">Course Code: <strong><?php echo $_SESSION['course_code']; ?></strong></h6>
                            <h6 class="text-center">Level: <strong><?php echo $_SESSION['level']; ?></strong></h6>
                            <h6 class="text-center">Program: <strong><?php echo $_SESSION['program']; ?></strong></h6>
                            <br>
                            <input style="margin-top: 5px;" class="btn btn-primary btn-print" type="submit" onclick="window.print();" value="Print">
                            <a href="registered_courses.php" style="margin-top: 5px;" class="btn btn-danger btn-print" type="submit">Back</a>
                            <hr>
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table" style="color: #999">
                                        <thead>
                                            <tr>
                                                <th># </th>
                                                <th>Matric No </th>
                                                <th>Full Name </th>
                                                <th>Level </th>
                                                <th>Program </th>
                                                <th>Department </th>
                                                <th>Gender</th>
                                            </tr>
                                        </thead>
                                        <?php
                                            $i = 0;
                                            $sql = "SELECT c.matricno,s.surname,s.othername,s.level,s.program,s.gender,s.department FROM tbl_submitted_courses AS c INNER JOIN tblstudent AS s ON c.matricno = s.matricno WHERE c.department = '{$_SESSION['department']}' AND c.course_code = '{$_SESSION['course_code']}' AND c.level = '{$_SESSION['level']}' AND c.program = '{$_SESSION['program']}'";
                                            $query_result = mysqli_query($conn, $sql);
                                            $result = mysqli_num_rows($query_result);
                                            if($result > 0){
                                                while($row = mysqli_fetch_array($query_result)){
                                                    $i++;
                                        ?>
                                        <tbody>
                                            <tr>
                                                <td><?php echo $i; ?></td>
                                                <td><?php echo $row['matricno']; ?></td>
                                                <td><?php echo $row['surname']." ".$row['othername']; ?></td>
                                                <td><?php echo $row['level']; ?></td>
                                                <td><?php echo $row['program']; ?></td>
                                                <td><?php echo $row['department']; ?></td>
                                                <td><?php echo $row['gender']; ?></td>
                                            </tr>
                                        <?php
                                            }
                                        }
                                        ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
    </section>
    <?php include_once('includes/footer.php') ?>
    <?php include_once('includes/script.html') ?>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../assets/js/user.js"></script>
    <script type="text/javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "none", {validateOn:["blur", "change"]});
var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "none", {validateOn:["blur", "change"]});
var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "none", {validateOn:["blur", "change"]});
</script>
</body>

</html>