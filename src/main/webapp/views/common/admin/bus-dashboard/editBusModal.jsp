<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="editBusModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editBusModalLabel">Edit Bus</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editBusForm" action="dashboard?action=edit-bus" method="POST">
                    <div class="form-group" style="display: none">
                        <label for="busid">Bus ID: </label>
                        <input type="text" class="form-control" id="idEditInput" name="busid">
                    </div>
                    <div class="form-group">
                        <label for="name">Bus Name:</label>
                        <input type="text" class="form-control" id="nameEditInput" name="name">
                        <div id="nameEditError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="text" class="form-control" id="priceEditInput" name="price">
                        <div id="priceEditError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone:</label>
                        <input type="text" class="form-control" id="phoneEditInput" name="phone">
                        <div id="phoneEditError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity:</label>
                        <input type="text" class="form-control" id="quantityEditInput" name="quantity">
                        <div id="quantityEditError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="descriptionEditInput">Description:</label>
                        <textarea class="form-control" id="descriptionEditInput" name="description"></textarea>
                        <div id="descriptionEditError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="status">Status: </label>
                        <div class="input-group">
                            <select class="custom-select" id="statusEditInput" name="status" required>
                                <option value="">Status</option>
                                <option value="Working">Working</option>
                                <option value="Not working">Not working</option>
                            </select>
                            <div id="statusEditError" class="error"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="descriptionEditInput">Schedule ID:</label>
                        <textarea class="form-control" id="scheduleidEditInput" name="scheduleid"></textarea>
                        <div id="scheduleEditError" class="error"></div>
                    </div>    
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="editBusForm"
                        onclick="validateForm2()">Update</button>
            </div>
        </div>
    </div>
</div>

<script>
    
    var errore = "${errore}";
    if (errore) {
        alert("Error: " + errore);
    }
    
    var msge = "${msge}";
    if (msge) {
        alert("Success: " + msge);
    }
    
    function validateForm2() {
        let name = $('#nameEditInput').val();
        let price = $('#priceEditInput').val();
        let phone = $('#phoneEditInput').val();
        let quantity = $('#quantityEditInput').val();
        let description = $('#descriptionEditInput').val();
        let status = $('#statusEditInput').val();
        let scheduleid = $('#scheduleidEditInput').val();

        //xoá thông báo lỗi hiện tại
        $('.error').html('');

        if (name === '') {
            $('#nameEditError').html('Bus name cannot blank');
        }else if (name.value.length < 3) {
            $('#nameEditError').html('Name must be at least 3 characters long.');
        }else if (!/^[A-Za-z0-9]+$/.test(name.value)) {
            $('#nameEditError').html('Name must contain only letters.');
        }

        if (price === '') {
            $('#priceEditError').html('Price cannot blank');
        } else if (!$.isNumeric(price) || parseFloat(price) < 0) {
            $('#priceEditError').html('Price must be number and not smaller than zero');
        }

        if (phone === '') {
            $('#phoneEditError').html('Phone cannot blank');
        } else if (!$.isNumeric(phone) || parseFloat(phone) < 0) {
            $('#phoneEditError').html('Phone must be number and not smaller than zero');
        }

        if (quantity === '') {
            $('#quantityEditError').html('Quantity cannot blank');
        } else if (!$.isNumeric(quantity) || parseInt(price) < 0) {
            $('#priceEditError').html('Quantity must be number and not smaller than zero');
        }

        if (description === '') {
            $('#descriptionEditError').html('Description cannot blank');
        }else if (description.value.length < 10) {
            $('#descriptionEditError').html('description must be at least 10 characters long.');
        }

        if (status === '') {
            $('#statusEditError').html('Status cannot blank');
        }

        if (scheduleid === '') {
            $('#scheduleEditError').html('Schedule cannot blank');
        } else if (!$.isNumeric(scheduleid) || parseInt(scheduleid) < 0) {
            $('#scheduleEditError').html('Schedule must be number and not smaller than zero');
        }

        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            $('#editBookForm').submit();
        } else {
            event.preventDefault();
        }
    }

    function editBusModal(id, name, price, phone, quantity, description, status, schedule_id) {
        $('#idEditInput').val(id);
        $('#nameEditInput').val(name);
        $('#priceEditInput').val(price);
        $('#phoneEditInput').val(phone);
        $('#quantityEditInput').val(quantity);
        $('#descriptionEditInput').val(description);
        $('#statusEditInput').val(status);
        $('#scheduleidEditInput').val(schedule_id);
    }

</script>
