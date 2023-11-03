<%-- 
    Document   : UpdateUserModal
    Created on : Oct 22, 2023, 10:45:19 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="editUserModal" tabindex="-1" role="dialog" aria-labelledby="editUserModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editUserModalLabel">Edit User Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editUserForm" action="dashboard?action=edit-user" method="POST" enctype="multipart/form-data">
                    <div class="form-group" style="display: none">
                        <label for="username">User Name: </label>
                        <input type="text" class="form-control" id="oldusername" name="oldusername">
                    </div>
                    <div class="form-group">
                        <label for="username">User Name: </label>
                        <input type="text" class="form-control" id="newusername" name="newusername">
                        <div id="usernameE" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="firstname">First Name: </label>
                        <input type="text" class="form-control" id="firstname" name="firstname">
                        <div id="firstnameE" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="lastname">Last Name: </label>
                        <input type text class="form-control" id="lastname" name="lastname">
                        <div id="lastnameE" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="email">Email: </label>
                        <input type="email" class="form-control" id="email" name="email">
                        <div id="emailE" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone: </label>
                        <input type="text" class="form-control" id="phone" name="phone">
                        <div id="phoneE" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="address">Address: </label>
                        <input type="text" class="form-control" id="address" name="address">
                        <div id="addressE" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="role">Role </label>
                        <div class="input-group">
                            <select class="custom-select" id="role" name="role">
                                <option value="2">Role</option>
                                <c:forEach items="${listR}" var="r">
                                    <option value="${r.id}">${r.name}</option>
                                </c:forEach>
                            </select>
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button">Role</button>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="image">Avatar: </label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Upload</span>
                            </div>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="image2" name="image" onchange="displayImage(this)">
                                <label class="custom-file-label">Choose file</label>
                            </div>
                        </div>
                        <img id="previewImage2" src="#" alt="Preview"
                             style="display: none; max-width: 300px; max-height: 300px;">
                        <input type="hidden" id="currentImage" name="currentImage" value="">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="editUserForm" onclick="validateUserForm()">Submit</button>
            </div>
        </div>
    </div>
</div>


<script>
    
    var msg = "${msge}";
    if (msg) {
        alert("Success: " + msg);
    }
    
    function validateUserForm() {
        let username = $('#newusername').val();
        let email = $('#email').val();
        let firstname = $('#firstname').val();
        let lastname = $('#lastname').val();
        let phone = $('#phone').val();
        let address = $('#address').val();

        //xoá thông báo lỗi hiện tại
        $('.error').html('');

        if (username === '') {
            $('#usernameE').html('User Name cannot blank');
        } else if (username.value.length < 3) {
            $('#usernameE').html('User Name must be at least 3 characters long.');
        } else if (!/^[A-Za-z0-9]+$/.test(username.value)) {
            $('#usernameE').html('User Name must contain only letters and number');
        }

        if (email.value.length < 5) {
            $('#emailE').html('Email must be at least 5 characters long.');
        } else if (!/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b/.test(email.value)) {
            $('#emailE').html('Please enter a valid email address.');
        }

        if (firstname.value.length < 3) {
            $('#firstnameE').html('First name must be at least 3 characters long.');
        } else if (!/^[A-Za-z]+$/.test(username.value)) {
            $('#firstnameE').html('First Name must contain only letters.');
        }

        if (lastname.value.length < 3) {
            $('#lastnameE').html('Last name must be at least 3 characters long.');
        } else if (!/^[A-Za-z]+$/.test(username.value)) {
            $('#lastnameE').html('Last name must contain only letters.');
        }

        if (phone.value.length < 10) {
            $('#phoneE').html('Phone number must be at least 10 number.');
        } else if (!$.isNumeric(phone) || parseFloat(phone) < 0) {
            $('#phoneE').html('Phone number is number and not smaller than zero');
        }

        if (address.value.length < 5) {
            $('#addressE').html('Subject must be at least 5 characters long.');
        } else if (!/^[A-Za-z0-9]+$/.test(address.value)) {
            $('#addressE').html('Subject must contain only letters and numbers.');
        }

        // Check if there are any error messages
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });

        if (error === '') {
            $('#editUserForm').submit();
        } else {
            event.preventDefault();
        }
    }

    function displayImage(input) {
        var previewImage = document.getElementById("previewImage2");
        var file = input.files[0];
        var reader = new FileReader();

        reader.onload = function (e) {
            previewImage.src = e.target.result;
            previewImage.style.display = "block";
        }

        reader.readAsDataURL(file);
    }

    function editUserModal(username, firstname, lastname, email, phone, address, image) {
        $('#oldusername').val(username);
        $('#newusername').val(username);
        $('#firstname').val(firstname);
        $('#lastname').val(lastname);
        $('#email').val(email);
        $('#phone').val(phone);
        $('#address').val(address);
        $('#currentImage').val(image);
    }
</script>
