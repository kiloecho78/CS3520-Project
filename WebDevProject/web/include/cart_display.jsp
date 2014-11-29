<%-- 
    Document   : cart_display
    Created on : Nov 28, 2014, 5:21:40 PM
    Author     : Darren
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="style/standard.css"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <div class="cartDisplay">
            <table>
                <tr>
                    <td  colspan="2">
                        
                        <h3>Your cart:</h3>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <c:if test="${sessionScope.loggedIn==true}">
                            There are <font color="blue">${sessionScope.cartCount}</font> products in your cart<br>
                        </c:if>
                        <c:if test="${sessionScope.loggedIn==false || sessionScope.loggedIn==null}">
                            Log in to see your cart<br>
                        </c:if>
                        <br>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                        View cart
                    </td>
                    <td>
                        Checkout
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
