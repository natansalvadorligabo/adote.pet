<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="navbar bg-base-300">
    <div class="navbar-start">
        <div class="dropdown lg:hidden">
            <div tabindex="0" role="button" class="btn btn-ghost btn-circle">
                <svg
                        xmlns="http://www.w3.org/2000/svg"
                        class="h-5 w-5"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke="currentColor">
                    <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M4 6h16M4 12h16M4 18h7" />
                </svg>
            </div>
            <ul
                    tabindex="0"
                    class="menu menu-sm dropdown-content bg-base-300 rounded-box z-[1] mt-3 w-52 p-2 shadow">
                <li><a href="home">Home</a></li>
                <li><a href="petRegister">Novo Pet</a></li>
            </ul>
        </div>
        <a href="home" class="btn btn-ghost text-xl hidden lg:flex">Adote.pet</a>
    </div>
    <c:if test="${!fn:contains(pageContext.request.requestURI, '/pages/add-pet.jsp')}">
        <div class="navbar-center hidden lg:flex">
            <a href="petRegister" class="btn btn-ghost">Novo Pet</a>
        </div>
    </c:if>
    <div class="navbar-end flex items-center gap-2">
        <c:if test="${fn:contains(pageContext.request.requestURI, '/pages/home.jsp')}">
            <form action="home" method="get" class="input input-bordered flex items-center gap-2 max-w-80	">
                <input type="text" name="search" placeholder="Pesquisar" class="grow max-w-32" value="${search}"/>
                <svg
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 16 16"
                        fill="currentColor"
                        class="h-4 w-4 opacity-70">
                    <path
                            fill-rule="evenodd"
                            d="M9.965 11.026a5 5 0 1 1 1.06-1.06l2.755 2.754a.75.75 0 1 1-1.06 1.06l-2.755-2.754ZM10.5 7a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Z"
                            clip-rule="evenodd" />
                </svg>
            </form>
        </c:if>
        <div class="dropdown dropdown-end">
            <div tabindex="0" role="button" class="btn btn-ghost btn-circle avatar placeholder">
                <div class="bg-neutral text-neutral-content w-12 rounded-full">
                    <c:choose>
                        <c:when test="${not empty user.photo}">
                            <img src="${user.photo}" alt="Perfil"/>
                        </c:when>
                        <c:otherwise>
                            <span class="text-xl">${fn:toUpperCase(fn:substring(user.username, 0, 1))}</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <ul tabindex="0" class="menu menu-sm dropdown-content bg-base-200 rounded-box z-[1] mt-3 w-52 p-2 shadow">
                <li><a href="${pageContext.request.contextPath}/userProfile?userId=${user.id}" class="justify-between">Perfil</a></li>
                <li><a href="logout">Sair</a></li>
            </ul>
        </div>
    </div>
</div>
