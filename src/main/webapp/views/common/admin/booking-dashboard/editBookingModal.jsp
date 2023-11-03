<%-- 
    Document   : editBookingModal
    Created on : Oct 31, 2023, 10:36:03 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="editBookingModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editBookingModalLabel">Edit Booking Modal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editBookingForm" action="dashboard?action=edit-booking" method="POST" enctype="multipart/form-data">
                    <div class="form-group" style="display: none">
                        <label for="bookingid">Booking ID: </label>
                        <input type="text" class="form-control" id="bookingid" name="bookingid">
                    </div>
                    <div class="form-group">
                        <label for="status">Status: </label>
                        <div class="input-group">
                            <select class="custom-select" id="statusEditInput" name="status" required>
                                    <option value="">Status</option>
                                    <option value="Confirmed">Confirmed</option>
                                    <option value="Canceled">Canceled</option>
                                    <option value="Progress">Progress</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="editBookingForm">Update</button>
            </div>
        </div>
    </div>
</div>

<script>
    
    var msg = "${msge}";
    if (msg) {
        alert("Success: " + msg);
    }
    
    function editBookingModal(id) {
        $('#bookingid').val(id);
    }

</script>

