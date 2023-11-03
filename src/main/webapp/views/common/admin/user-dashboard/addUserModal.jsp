<%-- 
    Document   : addUserModal
    Created on : Oct 29, 2023, 11:39:30 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addUserModalLabel">Add User Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addUserForm" action="dashboard?action=add-user" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="username">User Name: </label>
                        <input type="text" class="form-control" id="usernameInput" name="username">
                        <div id="usernameError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="password">Password: </label>
                        <input type="password" class="form-control" id="passwordInput" name="password" required>
                        <div id="passwordError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="firstname">First Name: </label>
                        <input type="text" class="form-control" id="firstnameInput" name="firstname">
                        <div id="firstnameError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="lastname">Last Name: </label>
                        <input type="text" class="form-control" id="lastnameInput" name="lastname">
                        <div id="lastnameError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="email">Email: </label>
                        <input type="email" class="form-control" id="emailInput" name="email">
                        <div id="emailError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone: </label>
                        <input type="text" class="form-control" id="phoneInput" name="phone">
                        <div id="phoneError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="address">Address: </label>
                        <input type="text" class="form-control" id="addressInput" name="address">
                        <div id="addressError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="image">Avatar: </label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Upload</span>
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="image" name="image" onchange="displayImage2(this)" required>
                                <label class="custom-file-label">Choose file</label>
                            </div>
                        </div>
                        <img id="previewImage" src="#" alt="Preview" style="display: none; max-width: 300px; max-height: 300px;">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addUserForm" onclick="validateForm()">Add</button>
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

    function validateForm() {
        let username = $('#usernameInput').val();
        let password = $('#passwordInput').val();
        let firstname = $('#firstnameInput').val();
        let lastname = $('#lastnameInput').val();
        let email = $('#emailInput').val();
        let phone = $('#phoneInput').val();
        let address = $('#addressInput').val();

        //xoá thông báo lỗi hiện tại
        $('.error').html('');

        if (username === '') {
            $('#usernameError').html('User Name cannot blank');
        } else if (username.value.length < 3) {
            $('#usernameError').html('User Name must be at least 3 characters long.');
        } else if (!/^[A-Za-z0-9]+$/.test(username.value)) {
            $('#usernameError').html('User Name must contain only letters and number');
        }

        if (password.value.length < 5) {
            $('#passwordError').html('Password must be at least 5 characters long.');
        } else if (!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@#$%^&+=]).*$/.test(password)) {
            $('#passwordError').html('Password must contain at least one letter, one number, and one special character (@#$%^&+=).');
        }

        if (email.value.length < 5) {
            $('#emailError').html('Email must be at least 5 characters long.');
        } else if (!/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b/.test(email.value)) {
            $('#emailError').html('Please enter a valid email address.');
        }

        if (firstname.value.length < 3) {
            $('#firstnameError').html('First name must be at least 3 characters long.');
        } else if (!/^[A-Za-z]+$/.test(username.value)) {
            $('#firstnameError').html('First Name must contain only letters.');
        }

        if (lastname.value.length < 3) {
            $('#lastnameError').html('Last name must be at least 3 characters long.');
        } else if (!/^[A-Za-z]+$/.test(username.value)) {
            $('#lastnameError').html('Last name must contain only letters.');
        }

        if (phone.value.length < 10) {
            $('#phoneError').html('Phone number must be at least 10 number.');
        } else if (!$.isNumeric(phone) || parseFloat(phone) < 0) {
            $('#phoneError').html('Phone number is number and not smaller than zero');
        }

        if (address.value.length < 5) {
            $('#addressError').html('Subject must be at least 5 characters long.');
        } else if (!/^[A-Za-z0-9]+$/.test(address.value)) {
            $('#addressError').html('Subject must contain only letters and numbers.');
        }

        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            $('#addUserForm').submit();
        } else {
            event.preventDefault();
        }
    }

    function displayImage2(input) {
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