<%-- 
    Document   : editSchedulesModal
    Created on : Nov 1, 2023, 10:46:57 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="editSchedulesModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editSchedulesModalLabel">Edit Schedules Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editSchedulesForm" action="dashboard?action=edit-schedules" method="POST">
                    <div class="form-group">
                        <label for="name">Schedules ID</label>
                        <input type="text" class="form-control" id="schedulesid" name="schedulesid">
                    </div>
                    <div class="form-group">
                        <label for="name">Departure Location</label>
                        <input type="text" class="form-control" id="departureLocation" name="departureLocation">
                        <div id="departureLocationErr" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="author">Arrival Location:</label>
                        <input type="text" class="form-control" id="arrivalLocation" name="arrivalLocation">
                        <div id="arrivalLocationErr" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="price">Take Time:</label>
                        <input type="datetime-local" class="form-control" id="takeTime" name="takeTime">
                        <div id="takeTimeErr" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="quantity">Pickup Time:</label>
                        <input type="datetime-local" class="form-control" id="pickupTime" name="pickupTime">
                        <div id="pickupTimeErr" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="editSchedulesForm"
                        onclick="validateForm2()">Update</button>
            </div>
        </div>
    </div>
</div>

<script>
    
    var msg = "${msge}";
    if (msg) {
        alert("Success: " + msg);
    }
    
    function validateForm2() {
        let departureLocation = $('#departureLocation').val();
        let arrivalLocation = $('#arrivalLocation').val();
        let takeTime = $('#takeTime').val();
        let pickupTime = $('#pickupTime').val();

        //xoá thông báo lỗi hiện tại
        $('.error').html('');

        if (departureLocation.value.length < 3) {
            $('#departureLocationErr').html('Departure location must be at least 3 characters long.');
        } else if (!/^[A-Za-z0-9]+$/.test(departureLocation.value)) {
            $('#departureLocationErr').html('Departure location must contain only letters and numbers.');
        }

        if (arrivalLocation.value.length < 3) {
            $('#arrivalLocationErr').html('Arrival location must be at least 3 characters long.');
        } else if (!/^[A-Za-z0-9]+$/.test(arrivalLocation.value)) {
            $('#arrivalLocationErr').html('Arrival location must contain only letters and numbers.');
        }
        
        if (takeTime === '') {
            $('#takeTimeErr').html('Take Time cannot blank');
        }
        
        
        if (pickupTime === '') {
            $('#pickupTimeErr').html('Pickup Time cannot blank');
        }

        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            $('#editSchedulesForm').submit();
        } else {
            event.preventDefault();
        }
    }

    function editSchedulesModal(id, departure_location, arrival_location, take_time, pickup_time) {
        $('#schedulesid').val(id);
        $('#departureLocation').val(departure_location);
        $('#arrivalLocation').val(arrival_location);
        $('#takeTime').val(take_time);
        $('#pickupTime').val(pickup_time);
    }

</script>

