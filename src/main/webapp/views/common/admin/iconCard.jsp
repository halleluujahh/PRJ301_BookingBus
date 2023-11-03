<%-- 
    Document   : iconCard
    Created on : Nov 2, 2023, 9:39:56 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row">
    <div class="col-xl-3 col-sm-6 mb-3">
        <div class="card text-white bg-primary o-hidden h-100">
            <div class="card-body">
                <div class="card-body-icon">
                    <i class="fas fa-fw fa-bus-alt"></i>
                </div>
                <div class="mr-5">Total Bus ${countBus}</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="${pageContext.request.contextPath}/admin/dashboard?page=view-bus">
                <span class="float-left">View Bus</span>
                <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                </span>
            </a>
        </div>
    </div>
    <div class="col-xl-3 col-sm-6 mb-3">
        <div class="card text-white bg-warning o-hidden h-100">
            <div class="card-body">
                <div class="card-body-icon">
                    <i class="fas fa-fw fa-business-time"></i>
                </div>
                <div class="mr-5">Total Booking ${countBooking}</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="${pageContext.request.contextPath}/admin/dashboard?page=view-booking">
                <span class="float-left">View Booking</span>
                <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                </span>
            </a>
        </div>
    </div>
    <div class="col-xl-3 col-sm-6 mb-3">
        <div class="card text-white bg-success o-hidden h-100">
            <div class="card-body">
                <div class="card-body-icon">
                    <i class="fas fa-fw fa-table"></i>
                </div>
                <div class="mr-5">Total Schedules ${countSchedules}</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="${pageContext.request.contextPath}/admin/dashboard?page=view-schedules">
                <span class="float-left">View Schedules</span>
                <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                </span>
            </a>
        </div>
    </div>
    <div class="col-xl-3 col-sm-6 mb-3">
        <div class="card text-white bg-danger o-hidden h-100">
            <div class="card-body">
                <div class="card-body-icon">
                    <i class="fas fa-fw fa-user-alt"></i>
                </div>
                <div class="mr-5">Total Account ${countAccount}</div>
            </div>
                <a class="card-footer text-white clearfix small z-1" href="${pageContext.request.contextPath}/admin/dashboard?page=view-users">
                <span class="float-left">View Account</span>
                <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                </span>
            </a>
        </div>
    </div>
</div>