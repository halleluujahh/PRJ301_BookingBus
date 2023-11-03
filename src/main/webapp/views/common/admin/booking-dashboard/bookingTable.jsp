<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-table"></i>
        Booking Table
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Bus Name</th>
                        <th>User Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Departure Location</th>
                        <th>Arrival Location</th>
                        <th>Take Time</th>
                        <th>Pickup Time</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total Price</th>
                        <th>Created On</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listBooking}" var="b">
                        <tr>
                            <td>${b.name}</td>
                            <td>${b.username}</td>
                            <td>${b.phone}</td>
                            <td>${b.email}</td>
                            <td>${b.departure_location}</td>
                            <td>${b.arrival_location}</td>
                            <td>${b.take_time}</td>
                            <td>${b.pickup_time}</td>
                            <td>${b.quantity}</td>
                            <td>${b.price}</td>
                            <td>${b.total_price}</td>
                            <td>${b.created_on}</td>
                            <c:if test="${b.status eq 'Confirmed'}">
                                <td style="color: green; font-weight: bold;">${b.status}</td>
                            </c:if>
                            <c:if test="${b.status eq 'Canceled'}">
                                <td style="color: red; font-weight: bold;">${b.status}</td>
                            </c:if>
                            <c:if test="${b.status eq 'Progress'}">
                                <td style="color: #DAA520; font-weight: bold;">${b.status}</td>
                            </c:if>
                            <td>
                                <i class="fa fa-edit fa-2x px-2 py-2 rounded"
                                   style="color: #007BFF"
                                   data-toggle="modal"
                                   data-target="#editBookingModal"
                                   title="Edit Book"
                                   onclick="editBookingModal('${b.id}')">
                                </i>

                                <i class="fa fa-trash fa-2x px-2 py-2 rounded"
                                   style="color: #FF0000"
                                   data-toggle="modal"
                                   data-target="#delete-modal"
                                   title="Delete Booking"
                                   onclick="deleteBookingModal(${b.id})">
                                </i>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
</div>



