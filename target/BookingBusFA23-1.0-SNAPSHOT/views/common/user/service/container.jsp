<%-- 
    Document   : container
    Created on : Oct 20, 2023, 8:25:56 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center mb-5">
            <div class="col-md-7 text-center heading-section ftco-animate">
                <span class="subheading">Bus Status</span>
                <h2 class="mb-3">Working Buses</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="pickup-info">
                    <p class="pickup-title"><i ></i> Our scheduled working daily:</p>
                    <p class="pickup-hours"><i class="far fa-calendar"></i> <strong>Monday To Friday</strong></p>
                    <p class="pickup-hours"><i class="fas fa-clock"></i> <strong>8:00 AM</strong> - <strong>7:30 PM</strong></p>
                </div>
                <div class="table-responsive">
                    <div class="table-filter">
                        <form id="filter-form" action="service" method="GET">
                            <label for="seat-filter">Filter by Seat Quantity:</label>
                            <select id="seat-filter" name="seat-quantity" required>
                                <option value="">All</option>
                                <c:forEach items="${listBus}" var="b">
                                    <option value="${b.quantity}">${b.quantity}</option>
                                </c:forEach>
                            </select>

                            <div class="filter-group">
                                <label for="takeTimeFilter">Take Time:</label>
                                <input type="datetime-local" id="takeTimeFilter" name="take-time" required>
                            </div>

                            <div class="filter-group">
                                <label for="pickupTimeFilter">Pickup Time:</label>
                                <input type="datetime-local" id="pickupTimeFilter" name="pickup-time" required>
                            </div>

                            <input type="hidden" name="action" value="search">
                            <button type="submit">Apply Filters</button>
                        </form>
                    </div>

                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Bus Name</th>
                                <th>Departure Location</th>
                                <th>Arrival Location</th>
                                <th>Take Time</th>
                                <th>Pickup Time</th>
                                <th>Price</th>
                                <th>Phone Number</th>
                                <th>Seat Quantity</th>
                                <th>Description</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listBus}" var="bus">
                                <tr class="clickable-row" data-href="booking?busId=${bus.id}" >
                                    <td>${bus.name}</td>
                                    <td>${bus.departure_location}</td>
                                    <td>${bus.arrival_location}</td>
                                    <td>${bus.take_time}</td>
                                    <td>${bus.pickup_time}</td>
                                    <td>${bus.price}</td>
                                    <td>${bus.phone}</td>
                                    <td>${bus.quantity}</td>
                                    <td>${bus.description}</td>
                                    <c:if test="${bus.getStatus() eq 'Working'}">
                                        <td style="color: green; font-weight: bold;">${bus.status}</td>
                                    </c:if>
                                    <td>
                                        <c:if test="${sessionScope.account == null}">
                                            <a href="${pageContext.request.contextPath}/authen?action=login">
                                                <button class="btn btn-success" type="button"><i class="fas fa-bus"></i> Book</button>
                                            </a>
                                        </c:if>
                                        <c:if test="${sessionScope.account != null}">
                                            <button class="btn btn-success" type="button" data-toggle="modal" data-target="#bookingModal" onclick="showBookingForm('${bus.id}', '${bus.name}', `${bus.price}`, `${bus.quantity}`)">
                                                <i class="fas fa-bus"></i> Book
                                            </button>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<!--pagination-->
<section id="page-navigation" class="d-flex justify-content-center">
    <ul class="pagination">
        <!--Home-->
        <c:if test="${pagination.page > 1}">
            <li class="page-item">
                <a class="page-link" href="${pagination.urlPattern}pagination=1">Start</a>
            </li>
        </c:if>

        <!--Previous-->
        <c:if test="${pagination.page > 1}">
            <li class="page-item">
                <a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page - 1}">Previous</a>
            </li>
        </c:if>

        <!--PAGE - 2 (in case last page )-->
        <c:if test="${pagination.page == pagination.totalPage && pagination.page > 2}">
            <li class="page-item">
                <a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page - 2}">${pagination.page - 2}</a>
            </li>
        </c:if>

        <!--PAGE - 1 (in case last page )-->
        <c:if test="${pagination.page == pagination.totalPage && pagination.page > 1}">
            <li class="page-item">
                <a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page - 1}">${pagination.page - 1}</a>
            </li>
        </c:if>

        <!--PAGE-->
        <c:if test="${pagination.totalPage > 0}">
            <li class="page-item">
                <a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page}">${pagination.page}</a>
            </li>
        </c:if>

        <!--PAGE + 1-->
        <c:if test="${pagination.page < pagination.totalPage}">
            <li class="page-item">
                <a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page + 1}">${pagination.page + 1}</a>
            </li>
        </c:if>

        <!--PAGE + 2-->
        <c:if test="${pagination.page + 1 < pagination.totalPage}">
            <li class="page-item">
                <a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page + 2}">${pagination.page + 2}</a>
            </li>
        </c:if>

        <!--NEXT-->
        <c:if test="${pagination.page != pagination.totalPage && pagination.totalPage > 0}">
            <!--NEXT-->
            <li class="page-item">
                <a class="page-link" href="${pagination.urlPattern}pagination=${pagination.page + 1}">Next</a>
            </li>
        </c:if>

        <!--LAST-->
        <c:if test="${pagination.page != pagination.totalPage && pagination.totalPage > 0}">
            <li class="page-item">
                <a class="page-link" href="${pagination.urlPattern}pagination=${pagination.totalPage}">Last</a>
            </li>
        </c:if>
    </ul>
</section>

<!-- Booking Form Table Cell -->

<div class="modal fade" id="bookingModal" tabindex="-1" role="dialog" aria-labelledby="bookingModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="bookingModalLabel">Booking Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="booking-form-content" class="square-border" action="service?action=booking" method="POST" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="username">Your User Name:</label>
                        <input type="text" id="username" name="username" class="form-control" value="${sessionScope.account.username}" readonly>
                        <div id="usernameError" class="error"></div>
                    </div>
                    <div class="form-group" style="display: none;">
                        <label for="busName">Bus Name:</label>
                        <input type="text" id="busName" name="bus-name" class="form-control" value="" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Your Email:</label>
                        <input type="email" id="email" name="email" class="form-control" value="${sessionScope.account.email}" readonly >
                        <div id="emailError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="phone">Your Phone:</label>
                        <input type="text" id="phone" name="phone" class="form-control" value="${sessionScope.account.phone}" readonly>
                        <div id="phoneError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity:</label>
                        <input type="text" id="quantity" name="quantity" class="form-control" value="">
                        <div id="quantityError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" id="address" name="address" class="form-control" value="${sessionScope.account.address}" readonly>
                        <div id="addressError" class="error"></div>
                    </div>
                    <div class="form-group" style="display: none;">
                        <label for="price">Price:</label>
                        <input type="text" id="price" name="price" class="form-control" value="" required>
                    </div>
                    <div class="form-group" style="display: none;">
                        <label for="BusID:">BusID:</label>
                        <input type="text" id="busId" name="busId" class="form-control" value="" required>
                    </div>
                    <div class="form-group" style="display: none;">
                        <label for="AccountID:">AccountID:</label>
                        <input type="text" id="accountId" name="accountId" class="form-control" value="${sessionScope.account.id}" required>
                    </div>
                    <div class="form-group" style="display: none;">
                        <label for="status">Status:</label>
                        <input type="text" id="status" name="status" class="form-control" value="Progress" required>
                    </div>
                    <div class="form-group" style="display: none;">
                        <label for="busquantity">Bus quantity</label>
                        <input type="text" id="busquantity" name="busquantity" class="form-control" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="booking-form-content" onclick="validateForm()">Submit</button>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center mb-5">
            <div class="col-md-7 text-center heading-section ftco-animate">
                <span class="subheading">Bus Services for Schools</span>
                <h2 class="mb-3">Why Choose Us</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="services services-2 w-100 text-center">
                    <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-car-seat"></span></div>
                    <div class="text w-100">
                        <h3 class="heading mb-2">Convenient Booking</h3>
                        <p>Book your bus tickets online with ease and convenience.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="services services-2 w-100 text-center">
                    <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-transportation"></span></div>
                    <div class="text w-100">
                        <h3 class="heading mb-2">Safe Transportation</h3>
                        <p>Ensure the safety of students with our reliable bus services for schools.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="services services-2 w-100 text-center">
                    <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-route"></span></div>
                    <div class="text w-100">
                        <h3 class="heading mb-2">Customized Routes</h3>
                        <p>Create customized bus routes that suit the needs of your school and students.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="services services-2 w-100 text-center">
                    <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-handshake"></span></div>
                    <div class="text w-100">
                        <h3 class="heading mb-2">Comfortable Travel</h3>
                        <p>Provide a comfortable and convenient travel experience for students and staff.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>



<script>

//    document.getElementById('seat-filter').addEventListener('change', function () {
//        document.getElementById('seat-filter-form').submit();
//    });

    var error = "${error}";
    if (error) {
        alert("Error: " + error);
    }

    var msg = "${msg}";
    if (msg) {
        alert("Success: " + msg);
    }

    function showBookingForm(busID, busName, busPrice, busQuantity) {
        let busNameField = document.querySelector("#booking-form-content input[name='bus-name']");
        let totalPriceField = document.querySelector("#booking-form-content input[name='price']");
        let busIdField = document.querySelector("#booking-form-content input[name='busId']");
        let busQuantityField = document.querySelector("#booking-form-content input[name='busquantity']");

        // Set the selected bus name in the form
        busIdField.value = busID;
        busNameField.value = busName;
        totalPriceField.value = busPrice;
        busQuantityField.value = busQuantity;
    }

    function validateForm() {
        let username = $('#username').val();
        let email = $('#email').val();
        let quantity = $('#quantity').val();
        let phone = $('#phone').val();
        let address = $('#address').val();

        // Clear existing error messages
        $('.error').html('');

        if (username === '') {
            $('#usernameError').html('User Name cannot be blank');
        }

        if (email === '') {
            $('#emailError').html('Email cannot be blank');
        }

        if (quantity === '') {
            $('#quantityError').html('Quantity cannot be blank');
        } else if (!$.isNumeric(quantity) || parseFloat(quantity) < 0) {
            $('#quantityError').html('Quantity must be a number and not smaller than zero');
        }

        if (phone === '') {
            $('#phoneError').html('Phone number cannot be blank');
        } else if (!$.isNumeric(phone) || parseFloat(phone) < 0) {
            $('#phoneError').html('Phone number must be a number and not smaller than zero');
        }

        if (address === '') {
            $('#addressError').html('Address cannot be blank');
        }

        // Check if there are any error messages
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });

        // If there are no errors, allow form submission
        if (error === '') {
            return true;
        } else {
            return false;
        }
    }

</script>



<!-- loader --> 
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
    <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
    <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg>
</div>

