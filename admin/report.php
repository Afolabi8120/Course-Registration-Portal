<?php
    include_once('includes/config.php');
    include_once('includes/session.php');
    include_once('includes/redirect.php');

    if(isset($_SESSION['username'])){
        if(isset($_POST['btn_remove_student'])){
            $id = $_POST['s_id'];

            $id = mysqli_real_escape_string($conn, $id);

            $sql = "DELETE FROM tblstudent WHERE matricno='$id' ";
            $query_result = mysqli_query($conn, $sql);

            if($query_result){
                $_SESSION['SuccessMessage'] = "Student Account has been removed successfully";
            }else{
                $_SESSION['ErrorMessage'] = "Failed to remove Student Account";
            }
        }
    }else{
        RedirectTo('index.php');
    }
?>
<!DOCTYPE html>
<html>

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
                <div class="col-md-4 col">
                   <?php include_once('includes/leftside.php') ?>
                </div>

                <!-- Level Record -->
                <div class="col-md-8 col">
                    <?php
                      echo ErrorMessage();
                      echo SuccessMessage();
                    ?>
                    <div class="gist-status">
                        <div class="row" style="margin: 0px;">
                            <h4>All Student List <small><span class="pull-right"><button type="submit" name="download" class="btn btn-primary btn-sm" ><i class="fa fa-eye"></i></button></span></small> </h4>
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
                                                <th>Faculty</th>
                                                <th>Department </th>
                                                <th>Gender</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <?php
                                            $i = 0;
                                            $sql = "SELECT * FROM tblstudent ORDER BY surname, level, program ASC";
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
                                                <td><?php echo $row['faculty']; ?></td>
                                                <td><?php echo $row['department']; ?></td>
                                                <td><?php echo $row['gender']; ?></td>
                                                <td>
                                                    <form method="POST">
                                                        <input type="hidden" name="s_id" value="<?php echo $row['matricno']; ?>">
                                                        <button type="submit" name="btn_remove_student" class="btn btn-sm btn-danger" onclick="return confirm('Remove this Account?');"><i class="fa fa-times"></i></button>
                                                    </form>
                                                </td>
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