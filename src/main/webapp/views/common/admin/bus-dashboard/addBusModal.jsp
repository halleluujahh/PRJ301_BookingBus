<%-- 
    Document   : addBookModal
    Created on : Oct 11, 2023, 7:46:06 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="addBusModal" tabindex="-1" role="dialog" aria-labelledby="addBusModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addBusModalLabel">Add Bus Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addBusForm" action="dashboard?action=add-bus" method="POST">
                    <div class="form-group">
                        <label for="name">Bus Name:</label>
                        <input type="text" class="form-control" id="nameInput" name="name">
                        <div id="nameError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="text" class="form-control" id="priceInput" name="price">
                        <div id="priceError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone:</label>
                        <input type="text" class="form-control" id="phoneInput" name="phone">
                        <div id="phoneError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity:</label>
                        <input type="text" class="form-control" id="quantityInput" name="quantity">
                        <div id="quantityError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea class="form-control" id="descriptionInput" name="description"></textarea>
                        <div id="descriptionError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="status">Status: </label>
                        <div class="input-group">
                            <select class="custom-select" id="statusInput" name="status" required>
                                <option value="">Status</option>
                                <option value="Working">Working</option>
                                <option value="Not working">Not working</option>
                            </select>
                        </div>
                        <div id="statusError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="scheduleid">Schedule ID:</label>
                        <input type="text" class="form-control" id="scheduleidInput" name="scheduleid">
                        <div id="scheduleidError" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addBusForm" onclick="validateForm()">Add</button>
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
        let name = $('#nameInput').val();
        let price = $('#priceInput').val();
        let phone = $('#phoneInput').val();
        let quantity = $('#quantityInput').val();
        let description = $('#descriptionInput').val();
        let status = $('#statusInput').val();
        let scheduleid = $('#scheduleidInput').val();

        //xoá thông báo lỗi hiện tại
        $('.error').html('');

        if (name === '') {
            $('#nameError').html('Bus name cannot blank');
        }else if (!/^[A-Za-z0-9]+$/.test(name.value)) {
            $('#nameError').html('Name cannot contain special character');
        }else if (name.value.length < 3) {
            $('#nameError').html('Name must be at least 3 characters long.');
        }

        if (price === '') {
            $('#priceError').html('Price cannot blank');
        } else if (!$.isNumeric(price) || parseFloat(price) < 0) {
            $('#priceError').html('Price must be number and not smaller than zero');
        }

        if (phone === '') {
            $('#phoneError').html('Phone cannot blank');
        } else if (!$.isNumeric(price) || parseFloat(price) < 0) {
            $('#phoneError').html('Phone must be number and not smaller than zero');
        }

        if (quantity === '') {
            $('#quantityError').html('Quantity cannot blank');
        } else if (!$.isNumeric(quantity) || parseInt(price) < 0) {
            $('#quantityError').html('Quantity must be number and not smaller than zero');
        }

        if (description === '') {
            $('#descriptionError').html('Description cannot blank');
        }else if (description.value.length < 10) {
            $('#messageError').html('Description must be at least 10 characters long.');
        } 

        if (status === '') {
            $('#statusError').html('Status cannot blank');
        }

        if (scheduleid === '') {
            $('#scheduleidError').html('Schedule ID cannot blank');
        } else if (!$.isNumeric(scheduleid) || parseInt(scheduleid) < 0) {
            $('#scheduleidError').html('Schedule ID must be number and not smaller than zero');
        }
        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            $('#addBusForm').submit();
        } else {
            event.preventDefault();
        }
    }
</script>


