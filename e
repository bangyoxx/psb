
Warning: Undefined array key "user_id" in C:\xampp\htdocs\psb\proses_form.php on line 14
Error:
Cannot add or update a child row: a foreign key constraint fails (`psb_db`.`form`, CONSTRAINT `form_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`))


<?php
session_start();

if (!isset($_SESSION['username'])) {
    header('Location: login.html');
    exit();
}

require 'database.php';

$username = $_SESSION['username'];
$role = $_SESSION['role'];

$user_id = $_SESSION['user_id'];
$name = $_POST['nama_lengkap'];
$school_origin = $_POST['asal_sekolah'];
$place_of_birth = $_POST['tempat_lahir'];
$date_of_birth = $_POST['tanggal_lahir'];
$gender = $_POST['jk'];
$address = $_POST['alamat'];
$phone_number = $_POST['nomor_telepon'];
$religion = $_POST['agama'];
$email = $_POST['email'];
$chosen_program = $_POST['program_studi'];

$result = mysqli_query($conn, "INSERT INTO form (user_id, nama_lengkap, asal_sekolah, tempat_lahir, tanggal_lahir, jk, alamat, nomor_telepon, agama, program_studi) VALUES ('$user_id' '$name', '$school_origin', '$place_of_birth', '$date_of_birth', '$gender', '$address', '$phone_number', '$religion', '$email', '$chosen_program')");
if ($result) {
    header('Location: data.php');
    exit();
} else {
    echo "Error: " . $result . "<br>" . mysqli_error($conn);
}
?>
