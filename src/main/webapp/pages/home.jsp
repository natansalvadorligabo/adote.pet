<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script defer src="../scripts/ImageLoadErrorHandler.js"></script>
    <title>Adote.pet - Home</title>
</head>
<body>
<main>
    <div class="navbar bg-base-100">
        <div class="flex-1">
            <a class="btn btn-ghost text-xl">Adote.pet</a>
        </div>
        <div class="flex-none">
            <a href="petRegister" class="btn btn-ghost">Novo Pet</a>
        </div>
        <div class="flex-none gap-2">
            <div class="form-control">
<%--suppress HtmlFormInputWithoutLabel --%>
                <input type="text" placeholder="Pesquisar" class="input input-bordered w-24 md:w-auto" />
            </div>
            <div class="dropdown dropdown-end">
                <div tabindex="0" role="button" class="btn btn-ghost btn-circle avatar">
                    <div class="w-10 rounded-full">
<%--suppress HtmlRequiredAltAttribute --%>
                        <img src="https://avatars.githubusercontent.com/u/79167486?v=4" />
                    </div>
                </div>
                <ul tabindex="0" class="menu menu-sm dropdown-content bg-base-100 rounded-box z-[1] mt-3 w-52 p-2 shadow">
                    <li>
                        <a class="justify-between">Perfil</a>
                    </li>
                    <li><a>Configurações</a></li>
                    <li><a href="logout">Sair</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="center col-lg-10 col-sm-12">
        <h1 class="text-center text-xl">Dog hub</h1>

        <c:choose>
            <c:when test="${fn:length(petDataset) > 0}">
                <section class="flex flex-column flex-wrap gap-8 justify-center items-center mt-8 md:mt-16">
                    <c:forEach var="pet" items="${petDataset}" varStatus="index">
                            <div class="card bg-base-100 w-96 shadow-xl">
                                <figure>
                                    <img id="img" src="${pet.getPhoto()}"
                                            alt="${pet.getDescription()}" />
                                </figure>
                                <div class="card-body">
                                    <h2 class="card-title">${pet.getName()}</h2>
                                    <p>
                                            ${pet.getAdopted() ? "Adopted!" : "For adoption!"}
                                    </p>
                                    <div class="card-actions justify-end">
                                        <div class="badge badge-primary">${pet.getBreed()}</div>
                                        <div class="badge badge-accent">${pet.getAge()} years</div>
                                        <div class="badge badge-accent">${pet.getColor()}</div>
                                        <div class="badge badge-accent">${pet.getSize()}</div>
                                    </div>
                                </div>
                            </div>
                    </c:forEach>
                </section>
            </c:when>
            <c:otherwise>
                <c:out value="There hasn't any pet"></c:out>
            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
<script src="https://cdn.tailwindcss.com"></script>
</html>