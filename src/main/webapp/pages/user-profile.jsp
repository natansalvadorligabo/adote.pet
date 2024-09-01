<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil - ${user.username}</title>
    <link href="favicon-dog-paw-16x16.png" rel="icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <jsp:include page="/components/navbar.jsp" />
    <c:choose>
        <c:when test="${result == 'Error in editing user'}">
            <div class="flex min-h-full flex-col justify-center px-6 py-4 lg:px-8 items-center">
                <div role="alert" class="alert alert-error w-fit message-alert">
                    <span>Não foi possível editar o usuário.</span>
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
        <c:when test="${result == 'User sucessfully edited'}">
            <div class="flex min-h-full flex-col justify-center px-6 py-4 lg:px-8 items-center">
                <div role="alert" class="alert alert-success w-fit message-alert">
                    <span>Usuário editado com sucesso.</span>
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
        <c:when test="${owner.getId() != null}">
            <main class="card lg:card-side bg-base-200 shadow-xl mx-auto max-w-4xl my-10">
                <figure class="lg:w-1/2">
                    <c:choose>
                        <c:when test="${not empty user.photo}">
                            <img src="${owner.photo}" alt="${owner.username}" />
                        </c:when>
                        <c:otherwise>
                            <span id="initials" class="text-8xl">${fn:toUpperCase(fn:substring(owner.username, 0, 1))}</span>
                        </c:otherwise>
                    </c:choose>
                </figure>
                <section class="card-body space-y-2">
                    <h1 class="card-title mb-4 font-bold">${owner.username}</h1>
                    <p><strong>Email:</strong> ${owner.email}</p>
                    <p><strong>Telefone:</strong> ${owner.phoneNumber}</p>
                </section>
            </main>
        </c:when>
        <c:otherwise>
        <form action="userProfile" enctype="multipart/form-data" method="post">
            <main class="card lg:card-side bg-base-200 shadow-xl mx-auto max-w-4xl my-10">
                <figure id="profileIcon" class="lg:w-1/2">
                    <c:choose>
                        <c:when test="${not empty user.photo}">
                            <img id="image" src="${user.photo}" alt="${user.username}"/>
                        </c:when>
                        <c:otherwise>
                            <span id="initials" class="text-8xl px-14 py-7 w-fit h-fit bg-neutral rounded-full">${fn:toUpperCase(fn:substring(user.username, 0, 1))}</span>
                        </c:otherwise>
                    </c:choose>
                </figure>
                <section class="card-body space-y-2">
                    <input name="name" id="name" class="card-title mb-4 font-bold input flex items-center gap-2 w-full pointer-events-none"
                            value="${user.username}" readonly />
                    <div class="flex justify-center items-start gap-2 flex-col">
                        <label for="email">Email:</label>
                        <input name="email" id="email" class="input flex items-center w-full pointer-events-none"
                                   type="email" value="${user.email}" readonly />
                    </div>
                    <div class="flex justify-center items-start gap-2 flex-col">
                        <label for="phone">Telefone:</label>
                        <input name="phone" id="phone" class="input flex items-center w-full pointer-events-none"
                                   type="text" value="${user.phoneNumber}" readonly />
                    </div>
                    <input type="file" name="imageUploader" id="imageUploader" class="file-input file-input-bordered hidden"
                           onchange="previewImage(event)" />
                    <div class="card-actions justify-end">
                        <button type="button" id="editBtn" class="btn btn-primary mt-4"
                                onclick="toggleEdit(this)">Editar Perfil</button>
                        <button type="submit" id="submitEdit" class="btn btn-success mt-4 status-reseter-button hidden">Salvar</button>
                    </div>
                </section>
            </main>
        </form>
        </c:otherwise>
    </c:choose>
<script src="https://cdn.tailwindcss.com"></script>
<script src="./scripts/toggleEdit.js"></script>
<script src="./scripts/MessagesButtonListener.js"></script>
</body>
</html>