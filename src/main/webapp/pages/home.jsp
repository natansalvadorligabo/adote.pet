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
        <link href="favicon-dog-paw-16x16.png" rel="icon" type="image/x-icon">
        <title>Adote.pet - Home</title>
    </head>
    <body>
        <main>
            <jsp:include page="/components/navbar.jsp" />
            <c:choose>
                <c:when test="${result == 'Error in removing pet'}">
                    <div class="flex min-h-full flex-col justify-center px-6 py-4 lg:px-8 items-center">
                        <div role="alert" class="alert alert-error w-fit message-alert">
                            <span>Não foi possível remover o pet.</span>
                            <div>
                                <button class="btn btn-ghost message-alert-button">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="m9.75 9.75 4.5 4.5m0-4.5-4.5 4.5M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:when test="${result == 'Pet sucessfully removed'}">
                    <div class="flex min-h-full flex-col justify-center px-6 py-4 lg:px-8 items-center">
                        <div role="alert" class="alert alert-success w-fit message-alert">
                            <span>Pet removido com sucesso.</span>
                            <div>
                                <button class="btn btn-ghost message-alert-button">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75 11.25 15 15 9.75M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${fn:length(pets) > 0}">
                    <section class="flex flex-row flex-wrap gap-8 justify-center items-center mt-8 md:mt-16">
                        <c:forEach var="pet" items="${pets}" varStatus="index">
                            <div class="card bg-base-100 w-96 shadow-xl overflow-hidden hover:scale-110 transition">
                                <a href="${pageContext.request.contextPath}/petDetails?id=${pet.id}">
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
                                </a>
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