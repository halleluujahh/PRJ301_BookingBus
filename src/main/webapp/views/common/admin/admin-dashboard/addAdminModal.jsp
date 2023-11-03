<%-- 
    Document   : addAdminModal
    Created on : Oct 30, 2023, 8:47:42 AM
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="addAdminModal" tabindex="-1" role="dialog" aria-labelledby="addAdminModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addAdminModalLabel">Add Admin Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addAdminForm" action="dashboard?action=add-admin" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="username">User Name: </label>
                        <input type="text" class="form-control" id="usernameInp" name="username">
                        <div id="usernameErr" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="password">Password: </label>
                        <input type="password" class="form-control" id="passwordInp" name="password" required>
                        <div id="passwordErr" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="firstname">First Name: </label>
                        <input type="text" class="form-control" id="firstnameInp" name="firstname">
                        <div id="firstnameErr" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="lastname">Last Name: </label>
                        <input type="text" class="form-control" id="lastnameInp" name="lastname">
                        <div id="lastnameErr" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="email">Email: </label>
                        <input type="email" class="form-control" id="emailInp" name="email">
                        <div id="emailErr" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone: </label>
                        <input type="text" class="form-control" id="phoneInp" name="phone">
                        <div id="phoneErr" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="address">Address: </label>
                        <input type="text" class="form-control" id="addressInp" name="address">
                        <div id="addressErr" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="image">Avatar: </label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Upload</span>
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="image" name="image" onchange="displayImage3(this)" required>
                                <label class="custom-file-label">Choose file</label>
                            </div>
                        </div>
                        <img id="previewImage" src="#" alt="Preview" style="display: none; max-width: 300px; max-height: 300px;">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addAdminForm" onclick="validateAdminForm()">Add</button>
            </div>
        </div>
    </div>
</div>

<script>

    var error = "${error}";
    if (error) {
        alert("Error: " + error);
    }

    var msg = "${msg}";
    if (msg) {
        alert("Success: " + msg);
    }

    function validateAdminForm() {
        let username = $('#usernameInp').val();
        let password = $('#passwordInp').val();
        let firstname = $('#firstnameInp').val();
        let lastname = $('#lastnameInp').val();
        let email = $('#emailInp').val();
        let phone = $('#phoneInp').val();
        let address = $('#addressInp').val();

        //xoá thông báo lỗi hiện tại
        $('.error').html('');

        if (username === '') {
            $('#usernameErr').html('User Name cannot blank');
        } else if (username.value.length < 3) {
            $('#usernameErr').html('User Name must be at least 3 characters long.');
        } else if (!/^[A-Za-z0-9]+$/.test(username.value)) {
            $('#usernameErr').html('User Name must contain only letters and number');
        }

        if (password.value.length < 5) {
            $('#passwordErr').html('Password must be at least 5 characters long.');
        } else if (!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@#$%^&+=]).*$/.test(password)) {
            $('#passwordErr').html('Password must contain at least one letter, one number, and one special character (@#$%^&+=).');
        }

        if (email.value.length < 5) {
            $('#emailErr').html('Email must be at least 5 characters long.');
        } else if (!/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b/.test(email.value)) {
            $('#emailErr').html('Please enter a valid email address.');
        }

        if (firstname.value.length < 3) {
            $('#firstnameErr').html('First name must be at least 3 characters long.');
        } else if (!/^[A-Za-z]+$/.test(username.value)) {
            $('#firstnameErr').html('First Name must contain only letters.');
        }

        if (lastname.value.length < 3) {
            $('#lastnameErr').html('Last name must be at least 3 characters long.');
        } else if (!/^[A-Za-z]+$/.test(username.value)) {
            $('#lastnameErr').html('Last name must contain only letters.');
        }

        if (phone.value.length < 10) {
            $('#phoneErr').html('Phone number must be at least 10 number.');
        } else if (!$.isNumeric(phone) || parseFloat(phone) < 0) {
            $('#phoneErr').html('Phone number is number and not smaller than zero');
        }

        if (address.value.length < 5) {
            $('#addressErr').html('Subject must be at least 5 characters long.');
        } else if (!/^[A-Za-z0-9]+$/.test(address.value)) {
            $('#addressErr').html('Subject must contain only letters and numbers.');
        }

        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            $('#addAdminForm').submit();
        } else {
            event.preventDefault();
        }
    }

    function displayImage3(input) {
        var previewImage = document.getElementById("previewImage");
        var file = input.files[0];
        var reader = new FileReader();

        reader.onload = function (e) {
            previewImage.src = e.target.result;
            previewImage.style.display = "block";
        };

        reader.readAsDataURL(file);
    }
</script>
