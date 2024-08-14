<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.min.css" rel="stylesheet" type="text/css" />
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
                        <input type="text" placeholder="Pesquisar" class="input input-bordered w-24 md:w-auto" />
                    </div>
                    <div class="dropdown dropdown-end">
                        <div tabindex="0" role="button" class="btn btn-ghost btn-circle avatar">
                            <div class="w-10 rounded-full">
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
            <c:choose>
                <c:when test="${fn:length(pets) > 0}">
                    <section class="flex flex-row flex-wrap gap-8 justify-center items-center mt-8 md:mt-16">
                        <c:forEach var="pet" items="${pets}" varStatus="index">
                            <div class="card bg-base-100 w-96 shadow-xl overflow-hidden">
                                <figure class="w-full h-64">
                                    <img src="${pet.photo}" alt="${pet.name}" class="w-full h-full object-cover" />
                                </figure>
                                <div class="card-body">
                                    <h2 class="card-title">${pet.name}</h2>
                                    <p>${pet.description}</p>
                                    <div class="card-actions justify-end">
                                        <div class="badge badge-primary">${pet.breed}</div>
                                        <div class="badge badge-accent">${pet.age} anos</div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </section>
                </c:when>
                <c:otherwise>
                    <p class="text-center mt-8">Nenhum pet disponível para adoção no momento.</p>
                </c:otherwise>
            </c:choose>
        </main>
        <script src="https://cdn.tailwindcss.com"></script>
    </body>
</html>