<%-- 
    Document   : addSchedulesModal
    Created on : Nov 1, 2023, 9:28:13 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="addSchedulesModal" tabindex="-1" role="dialog" aria-labelledby="addBookModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addBookModalLabel">Add Schedules</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addSchedulesForm" action="dashboard?action=add-schedules" method="POST">
                    <div class="form-group">
                        <label for="name">Departure Location</label>
                        <input type="text" class="form-control" id="departureLocationInput" name="departureLocation">
                        <div id="departureLocationError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="author">Arrival Location:</label>
                        <input type="text" class="form-control" id="arrivalLocationInput" name="arrivalLocation">
                        <div id="arrivalLocationError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="price">Take Time:</label>
                        <input type="datetime-local" class="form-control" id="takeTimeInput" name="takeTime">
                        <div id="takeTimeError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="quantity">Pickup Time:</label>
                        <input type="datetime-local" class="form-control" id="pickupTimeInput" name="pickupTime">
                        <div id="pickupTimeError" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="addSchedulesForm" onclick="validateForm()">Add</button>
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
        let departureLocation = $('#departureLocationInput').val();
        let arrivalLocation = $('#arrivalLocationInput').val();
        let takeTime = $('#takeTimeInput').val();
        let pickupTime = $('#pickupTimeInput').val();

        //xoá thông báo lỗi hiện tại
        $('.error').html('');

        if (departureLocation.value.length < 3) {
            $('#departureLocationError').html('Departure location must be at least 3 characters long.');
        } else if (!/^[A-Za-z0-9]+$/.test(departureLocation.value)) {
            $('#departureLocationError').html('Departure location must contain only letters and numbers.');
        }

        if (arrivalLocation.value.length < 3) {
            $('#arrivalLocationError').html('Arrival location must be at least 3 characters long.');
        } else if (!/^[A-Za-z0-9]+$/.test(arrivalLocation.value)) {
            $('#arrivalLocationError').html('Arrival location must contain only letters and numbers.');
        }
        
        if (takeTime === '') {
            $('#takeTimeError').html('Take Time cannot blank');
        }
        
        if (pickupTime === '') {
            $('#pickupTimeError').html('Pickup Time cannot blank');
        }

        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            $('#addSchedulesForm').submit();
        } else {
            event.preventDefault();
        }
    }
</script>



