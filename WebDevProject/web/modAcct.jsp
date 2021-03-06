<%-- 
    Document   : modifyAccount
    Created on : Nov 21, 2014, 6:10:17 PM
    Author     : Keith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Modification</title>
        <script>
            function confirmCompleted(form) {
                error = false;
                errorField = document.getElementById("loginPasswordError");
                if (form.password.value === "") {
                    error = true;
                    errorField.innerHTML = "* Field cannot be blank";
                }
                else {
                    errorField.innerHTML = "";
                }

                errorField = document.getElementById("confirmPasswordError");
                if (form.passwordCheck.value === "") {
                    error = true;
                    errorField.innerHTML = "* Field cannot be blank";
                }
                else if (form.passwordCheck.value !== form.password.value) {
                    error = true;
                    errorField.innerHTML = "Passwords are not the same";
                }
                else {
                    errorField.innerHTML = "";
                }

                errorField = document.getElementById("firstNameError");
                if (form.firstName.value === "") {
                    error = true;
                    errorField.innerHTML = "* Field cannot be blank";
                }
                else {
                    errorField.innerHTML = "";
                }

                errorField = document.getElementById("lastNameError");
                if (form.lastName.value === "") {
                    error = true;
                    errorField.innerHTML = "* Field cannot be blank";
                }
                else {
                    errorField.innerHTML = "";
                }
                errorField = document.getElementById("emailError");
                if (form.email.value === "") {
                    error = true;
                    errorField.innerHTML = "* Field cannot be blank";
                }
                else {
                    errorField.innerHTML = "";
                }
                errorField = document.getElementById("billingError");
                if (form.billingAddress.value === "") {
                    error = true;
                    errorField.innerHTML = "* Field cannot be blank";
                }
                else {
                    errorField.innerHTML = "";
                }
                if (error === false) {
                    form.submit();
                }
            }
        </script>

        <link rel="stylesheet" href="style/standard.css"/>
    </head>
    <body class="background">
        <jsp:include page="/include/header.jsp"/>
        <jsp:include page="/include/product_menu.jsp"/>  
        <jsp:include page="/include/cart_display.jsp"/>
        <div class="pageContent">
            <h3>Update account information:</h3>
            <form action="ModifyAccount" method="post">
                <table align="center">
                    <tr>
                        <td colspan="2">
                            <span class="error">
                                <c:if test="${requestScope.errMsg != null}">
                                    ${requestScope.errMsg}
                                </c:if>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="userName" value="${sessionScope.user.userName}" disabled="disabled"></td>
                        <td class="error" id="loginNameError"></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="${sessionScope.user.password}"></td>
                        <td class="error" id="loginPasswordError"></td>

                        <td>Confirm Password</td>
                        <td><input type="password" name="passwordCheck" value="${sessionScope.user.password}"></td>
                        <td class="error" id="confirmPasswordError"></td>
                    </tr>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="firstName" value="${sessionScope.user.firstName}"></td>
                        <td class="error" id="firstNameError"></td>
                        <td>Last Name</td>
                        <td><input type="text" name="lastName" value="${sessionScope.user.lastName}"></td>
                        <td class="error" id="lastNameError"></td>
                    </tr>
                    <tr>
                        <td>Email Address</td>
                        <td><input type="text" name="email" value="${sessionScope.user.email}"></td>
                        <td class="error" id="emailError"></td>
                    </tr>
                    <tr>
                        <td>Billing Address</td>
                        <td><input type="text" name="billingAddress" value="${sessionScope.user.billingAddress}"></td>
                        <td class="error" id="billingError"></td>

                        <td>Mailing Address</td>
                        <td><input type="text" name="mailingAddress" value="${sessionScope.user.mailingAddress}"></td>
                        <td class="error" id="mailingError"></td>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <td><input type="text" name="phone" value="${sessionScope.user.phone}"></td>
                        <td class="error" id="phoneError"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td align="right">
                            <input type="button" value="Update" onclick="confirmCompleted(this.form)" class="btn">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <jsp:include page="/include/footer.jsp"/>
    </body>
</html>

