<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-table"></i>
        Bus Table
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Schedule ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Phone</th>
                        <th>Seat Quantity</th>
                        <th>Description</th>
                        <th>Created On</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listB}" var= "b">
                        <tr>
                            <td>${b.id}</td>
                            <td>${b.schedule_id}</td>
                            <td>${b.name}</td>
                            <td>${b.price}</td>
                            <td>${b.phone}</td>
                            <td>${b.quantity}</td>
                            <td>${b.description}</td>
                            <td>${b.created_on}</td>
                            <c:if test="${b.getStatus() eq 'Working'}">
                                <td style="color: green; font-weight: bold;">${b.status}</td>
                            </c:if>
                            <c:if test="${b.getStatus() eq 'Not working'}">
                                <td style="color: red; font-weight: bold;">${b.status}</td>
                            </c:if>
                            <td>
                                <i class="fa fa-edit fa-2x px-2 py-2 rounded"
                                   style="color: #007BFF"
                                   data-toggle="modal"
                                   data-target="#editBusModal"
                                   title="Edit Bus"
                                   onclick="editBusModal('${b.id}', '${b.name}', '${b.price}', '${b.phone}', '${b.quantity}', '${b.description}', '${b.status}', '${b.schedule_id}')">
                                </i>

                                <i class="fa fa-trash fa-2x px-2 py-2 rounded"
                                   style="color: #FF0000"
                                   data-toggle="modal"
                                   data-target="#delete-modal"
                                   title="Delete Bus"
                                   onclick="deleteBusModal(${b.id})">
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



