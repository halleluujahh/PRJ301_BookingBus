<%-- 
    Document   : container
    Created on : Oct 20, 2023, 9:54:27 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="ftco-section contact-section">
    <div class="container">
        <div class="row d-flex mb-5 contact-info">
            <div class="col-md-4">
                <div class="row mb-5">
                    <div class="col-md-12">
                        <div class="border w-100 p-4 rounded mb-2 d-flex">
                            <div class="icon mr-3">
                                <span class="icon-map-o"></span>
                            </div>
                            <p><span>Address:</span> Education and Training Area Hoa Lac Hi-Tech Park Km29, Thang Long Avenue, Thach Hoa, Thach That, Hanoi 13100</p>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="border w-100 p-4 rounded mb-2 d-flex">
                            <div class="icon mr-3">
                                <span class="icon-mobile-phone"></span>
                            </div>
                            <p><span>Phone:</span> <a href="tel://1234567920">+98 1235 235</a></p>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="border w-100 p-4 rounded mb-2 d-flex">
                            <div class="icon mr-3">
                                <span class="icon-envelope-o"></span>
                            </div>
                            <p><span>Email:</span> <a href="mailto:info@yoursite.com">hanvhe171012@fpt.edu.vn</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8 block-9 mb-md-5">
                <form id="messageform" action="contact" method="POST" class="bg-light p-5 contact-form">
                    <div class="form-group">
                        <input type="text" class="form-control" name="name" placeholder="Your Name" value="${sessionScope.account.username}" required>
                        <div id="nameError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="email" placeholder="Your Email" value="${sessionScope.account.email}" required>
                        <div id="emailError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="subject" placeholder="Subject" required>
                        <div id="subjectError" class="error"></div>
                    </div>
                    <div class="form-group">
                        <textarea name="message" id="message" cols="30" rows="7" class="form-control" placeholder="Message" required></textarea>
                        <div id="messageError" class="error"></div>
                    </div>
                    <c:if test="${sessionScope.account != null}">
                        <div class="form-group"  style="display: none;">
                            <input type="text" name="accountID" value="${sessionScope.account.getId()}">
                        </div>
                    </c:if>
                    <div class="form-group">
                        <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5" onclick="validateForm()">
                    </div>
                </form>

            </div>
        </div>
    </div>
</section>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
    <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
    <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg>
</div>

<script>
    var msg = "${msg}";
    if (msg) {
        alert("Success: " + msg);
    }

    var error = "${error}";
    if (error) {
        alert("Error: " + error);
    }

    function validateForm() {
        var nameInput = document.querySelector('input[name="name"]');
        var emailInput = document.querySelector('input[name="email"]');
        var subjectInput = document.querySelector('input[name="subject"]');
        var messageInput = document.querySelector('textarea[name="message"]');

        //xoá thông báo lỗi hiện tại
        $('.error').html('');

        if (nameInput.value.length < 3) {
            $('#nameError').html('Name must be at least 3 characters long.');
        } else if (!/^[A-Za-z]+$/.test(nameInput.value)) {
            $('#nameError').html('Name must contain only letters.');
        }

        if (emailInput.value.length < 5) {
            $('#emailError').html('Email must be at least 5 characters long.');
        } else if (!/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b/.test(emailInput.value)) {
            $('#emailError').html('Please enter a valid email address.');
        }

        if (subjectInput.value.length < 5) {
            $('#subjectError').html('Subject must be at least 5 characters long.');
        } else if (!/^[A-Za-z0-9.,?!:;]+$/.test(subjectInput.value)) {
            $('#subjectError').html('Subject must contain only letters and numbers.');
        }

        if (messageInput.value.length < 10) {
            $('#messageError').html('Message must be at least 10 characters long.');
        } else if (!/^[A-Za-z0-9.,?!:;]+$/.test(messageInput.value)) {
            $('#messageError').html('Message must contain only letters and numbers.');
        }

        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            $('#messageform').submit();
        } else {
            event.preventDefault();
        }
    }
</script>