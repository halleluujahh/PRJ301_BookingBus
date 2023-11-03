<%-- 
    Document   : UpdateUserModal
    Created on : Oct 22, 2023, 10:45:19 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="updateUserModal" tabindex="-1" role="dialog" aria-labelledby="updateUserModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateUserModalLabel">Update Information</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updateUserForm" action="dashboard?action=profile" method="POST" enctype="multipart/form-data">
                    <div class="form-group" style="display: none">
                        <label for="username">User Name: </label>
                        <input type="text" class="form-control" id="usernameInput" name="username" value="${sessionScope.account.username}">
                        <div id="usernameError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="firstname">First Name: </label>
                        <input type="text" class="form-control" id="firstnameInput" name="firstname" value="${sessionScope.account.firstname}">
                        <div id="firstnameError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="lastname">Last Name: </label>
                        <input type="text" class="form-control" id="lastnameInput" name="lastname" value="${sessionScope.account.lastname}">
                        <div id="lastnameError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone: </label>
                        <input type="text" class="form-control" id="phoneInput" name="phone" value="${sessionScope.account.phone}">
                        <div id="phoneError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="address">Address: </label>
                        <input type="text" class="form-control" id="addressInput" name="address" value="${sessionScope.account.address}">
                        <div id="addressError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="image">Avatar: </label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Upload</span>
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="image" name="image" onchange="displayImage(this)">
                                <label class="custom-file-label" >Choose file</label>
                            </div>
                        </div>
                        <img id="previewImage" src="#" alt="Preview"
                             style="display: none; max-width: 300px; max-height: 300px;">

                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="updateUserForm" onclick="validateForm()">Add</button>
            </div>
        </div>
    </div>
</div>

<script>
    
    var msg = "${msg}";
    if (msg) {
        alert("Success: " + msg);
    }
    
    function validateForm() {
        let username = $('#usernameInput').val();
        let firstname = $('#firstnameInput').val();
        let lastname = $('#lastnameInput').val();
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
            $('#updateUserForm').submit();
        } else {
            event.preventDefault();
        }
    }

    function displayImage(input) {
        var previewImage = document.getElementById("previewImage");
        var file = input.files[0];
        var reader = new FileReader();

        reader.onload = function (e) {
            previewImage.src = e.target.result;
            previewImage.style.display = "block";
        }

        reader.readAsDataURL(file);
    }


</script>
