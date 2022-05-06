<?php
    include_once('includes/config.php');
    include_once('includes/session.php');
    include_once('includes/redirect.php');

    if(isset($_SESSION['username'])){
        if(isset($_POST['btn_fetch_student'])){
            $_SESSION['department'] = $_POST['department'];
            $_SESSION['course_code'] = $_POST['course_code'];
            $_SESSION['program'] = $_POST['program'];
            $_SESSION['level'] = $_POST['level'];
            header('location: print_reg_student.php');
        }else if(isset($_POST['btn_promote_student'])){
            $_SESSION['department'] = $_POST['department'];
            $_SESSION['program'] = $_POST['program'];
            $_SESSION['promote_from'] = $_POST['promote_from'];
            $_SESSION['promote_to'] = $_POST['promote_to'];

            if($_SESSION['promote_from'] == $_SESSION['promote_to']){
                $_SESSION['ErrorMessage'] = "Unable to Promote Student";
            }else{
                $sql = "UPDATE tblstudent SET level = '{$_SESSION['promote_to']}' WHERE department = '{$_SESSION['department']}' AND program = '{$_SESSION['program']}' AND level = '{$_SESSION['promote_from']}'";
                $query_result = mysqli_query($conn, $sql);
                if($query_result){
                    $_SESSION['SuccessMessage'] = "All Student Have Been Promoted Successfully";
                }else{
                    $_SESSION['ErrorMessage'] = "Failed to Promote Student";
                }
            }        
        }elseif (isset($_POST['btn_disable_student'])) {
            $department = $_POST['department'];
            $level = $_POST['level'];
            $program = $_POST['program'];
            $status = $_POST['status'];

            $department = mysqli_real_escape_string($conn, $department);
            $level = mysqli_real_escape_string($conn, $level);
            $level = mysqli_real_escape_string($conn, $level);

            $sql = "UPDATE tblstudent SET status = '$status' WHERE department = '$department' AND level = '$level' AND program = '$program' ";
            $query_result = mysqli_query($conn, $sql);

            if($query_result){
                $_SESSION['SuccessMessage'] = "Student's Account has been set to ".$status;
            }else{
                $_SESSION['ErrorMessage'] = "Failed to set student account to".$status;
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
                            <h4>Fetch All Registered Courses <small><a href="dashboard.php"><span class="pull-right"><i class="fa fa-arrow-left"></i>   Back</span></a></small></h4>
                            <hr>
                            <form action="registered_courses.php" method="post">
                                <div class="panel-body">
                                    <div class="col-sm-3">
                                        <div class="form-body">
                                            <label for="department">Department</label>
                                            <select name="department" class="form-control" id="department">
                                            <?php
                                                $sql = "SELECT * FROM tbldepartment ORDER BY department ASC";
                                                $query_result = mysqli_query($conn, $sql);
                                                $result = mysqli_num_rows($query_result);
                                                if($result > 0){
                                                  while($row = mysqli_fetch_array($query_result)){
                                            ?>
                                                  <option value="<?php echo $row['department']; ?>"><?php echo $row['department']; ?></option>
                                            <?php
                                                }
                                              }
                                            ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-body">
                                            <label for="department">Course Code</label>
                                            <select name="course_code" class="form-control" id="course_code">
                                            <?php
                                                $sql = "SELECT * FROM tbl_added_courses ORDER BY course_code ASC";
                                                $query_result = mysqli_query($conn, $sql);
                                                $result = mysqli_num_rows($query_result);
                                                if($result > 0){
                                                  while($row = mysqli_fetch_array($query_result)){
                                            ?>
                                                  <option value="<?php echo $row['course_code']; ?>"><?php echo $row['course_code']; ?></option>
                                            <?php
                                                }
                                              }
                                            ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-body">
                                            <label for="department">Level</label>
                                            <select name="level" class="form-control" id="level">
                                            <?php
                                                $sql = "SELECT * FROM tbllevel ORDER BY name ASC";
                                                $query_result = mysqli_query($conn, $sql);
                                                $result = mysqli_num_rows($query_result);
                                                if($result > 0){
                                                  while($row = mysqli_fetch_array($query_result)){
                                            ?>
                                                  <option value="<?php echo $row['name']; ?>"><?php echo $row['name']; ?></option>
                                            <?php
                                                }
                                              }
                                            ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-body">
                                            <label for="">Program</label>
                                            <select name="program" class="form-control" id="program">
                                                <option value="FT">FT</option>
                                                <option value="DPP">DPP</option>
                                                <option value="PT">PT</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-body">
                                            <input style="margin-top: 5px;" class="btn btn-primary" type="submit" name="btn_fetch_student" value="Search">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-8 col">
                    <div class="gist-status">
                        <div class="row" style="margin: 0px;">
                            <h4>Promote Student <small><a href="dashboard.php"><span class="pull-right"><i class="fa fa-arrow-left"></i>   Back</span></a></small></h4>
                            <hr>
                            <form action="registered_courses.php" method="post">
                                <div class="panel-body">
                                    <div class="col-sm-3">
                                        <div class="form-body">
                                            <label for="department">Department</label>
                                            <select name="department" class="form-control" id="department">
                                            <?php
                                                $sql = "SELECT * FROM tbldepartment ORDER BY department ASC";
                                                $query_result = mysqli_query($conn, $sql);
                                                $result = mysqli_num_rows($query_result);
                                                if($result > 0){
                                                  while($row = mysqli_fetch_array($query_result)){
                                            ?>
                                                  <option value="<?php echo $row['department']; ?>"><?php echo $row['department']; ?></option>
                                            <?php
                                                }
                                              }
                                            ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-body">
                                            <label for="department">Promote From</label>
                                            <select name="promote_from" class="form-control" id="level">
                                            <?php
                                                $sql = "SELECT * FROM tbllevel ORDER BY name ASC";
                                                $query_result = mysqli_query($conn, $sql);
                                                $result = mysqli_num_rows($query_result);
                                                if($result > 0){
                                                  while($row = mysqli_fetch_array($query_result)){
                                            ?>
                                                  <option value="<?php echo $row['name']; ?>"><?php echo $row['name']; ?></option>
                                            <?php
                                                }
                                              }
                                            ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-body">
                                            <label for="department">Promote To</label>
                                            <select name="promote_to" class="form-control" id="level">
                                            <?php
                                                $sql = "SELECT * FROM tbllevel ORDER BY name ASC";
                                                $query_result = mysqli_query($conn, $sql);
                                                $result = mysqli_num_rows($query_result);
                                                if($result > 0){
                                                  while($row = mysqli_fetch_array($query_result)){
                                            ?>
                                                  <option value="<?php echo $row['name']; ?>"><?php echo $row['name']; ?></option>
                                            <?php
                                                }
                                              }
                                            ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-body">
                                            <label for="">Program</label>
                                            <select name="program" class="form-control" id="program">
                                                <option value="FT">FT</option>
                                                <option value="DPP">DPP</option>
                                                <option value="PT">PT</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-body">
                                            <input style="margin-top: 5px;" class="btn btn-primary" type="submit" name="btn_promote_student" value="Promote">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-8 col">
                    <div class="gist-status">
                        <div class="row" style="margin: 0px;">
                            <h4>Disable/Enable Student's Account <small><a href="dashboard.php"><span class="pull-right"><i class="fa fa-arrow-left"></i>   Back</span></a></small></h4>
                            <hr>
                            <form action="registered_courses.php" method="post">
                                <div class="panel-body">
                                    <div class="col-sm-3">
                                        <div class="form-body">
                                            <label for="department">Department</label>
                                            <select name="department" class="form-control" id="department">
                                            <?php
                                                $sql = "SELECT * FROM tbldepartment ORDER BY department ASC";
                                                $query_result = mysqli_query($conn, $sql);
                                                $result = mysqli_num_rows($query_result);
                                                if($result > 0){
                                                  while($row = mysqli_fetch_array($query_result)){
                                            ?>
                                                  <option value="<?php echo $row['department']; ?>"><?php echo $row['department']; ?></option>
                                            <?php
                                                }
                                              }
                                            ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-body">
                                            <label for="department">Level</label>
                                            <select name="level" class="form-control" id="level">
                                            <?php
                                                $sql = "SELECT * FROM tbllevel ORDER BY name ASC";
                                                $query_result = mysqli_query($conn, $sql);
                                                $result = mysqli_num_rows($query_result);
                                                if($result > 0){
                                                  while($row = mysqli_fetch_array($query_result)){
                                            ?>
                                                  <option value="<?php echo $row['name']; ?>"><?php echo $row['name']; ?></option>
                                            <?php
                                                }
                                              }
                                            ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-body">
                                            <label for="">Program</label>
                                            <select name="program" class="form-control" id="program">
                                                <option value="FT">FT</option>
                                                <option value="DPP">DPP</option>
                                                <option value="PT">PT</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-body">
                                            <label for="">Status</label>
                                            <select name="status" class="form-control" id="program">
                                                <option value="Active">Enable</option>
                                                <option value="In-active">Disable</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-body">
                                            <input style="margin-top: 5px;" class="btn btn-primary" type="submit" name="btn_disable_student" value="Submit">
                                        </div>
                                    </div>
                                </div>
                            </form>
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