    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
    <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
    <!DOCTYPE html>
    <html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Adote.pet - ${pet.name}</title>
        <link href="favicon-dog-paw-16x16.png" rel="icon" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.min.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
    <jsp:include page="/components/navbar.jsp" />
    <form action="petDetails" enctype="multipart/form-data" method="post">
        <input type="hidden" name="id" id="id" value="${pet.id}">
        <main class="card lg:card-side bg-base-200 shadow-xl mx-auto max-w-4xl my-10">
            <figure id="profileIcon" class="lg:w-1/2">
                <c:choose>
                    <c:when test="${not empty pet.photo}">
                        <img id="image" src="${pet.photo}" alt="${pet.name}" />
                    </c:when>
                    <c:otherwise>
                        <span id="initials" class="text-8xl">${fn:toUpperCase(fn:substring(pet.name, 0, 1))}</span>
                    </c:otherwise>
                </c:choose>
            </figure>
            <section class="card-body space-y-2">
                <input name="name" id="name" class="card-title mb-4 font-bold input flex items-center gap-2 w-full pointer-events-none"
                       value="${pet.name}" readonly />
                <div class="flex justify-center items-center flex-row">
                    <label class="w-1/2" for="age">Idade em anos:</label>
                    <input name="age" id="age" class="input flex items-center w-full pointer-events-none"
                           type="text" value="${pet.age}" readonly />
                </div>
                <div class="flex justify-center items-center gap-2 flex-row">
                    <label for="size">Tamanho:</label>
                    <select id="size" name="size" class="select w-full pointer-events-none" tabindex="-1">
                        <option value="SMALL" ${pet.size.getSize() == 'Pequeno' ? 'selected' : ''}>Pequeno</option>
                        <option value="MEDIUM" ${pet.size.getSize() == 'Médio' ? 'selected' : ''}>Médio</option>
                        <option value="LARGE" ${pet.size.getSize() == 'Grande' ? 'selected' : ''}>Grande</option>
                    </select>
                    <label for="gender">Gênero:</label>
                    <select id="gender" name="gender" class="select w-full pointer-events-none" tabindex="-1">
                        <option value="MALE" ${pet.gender.getDescription() == 'Macho' ? 'selected' : ''}>Macho</option>
                        <option value="FEMALE" ${pet.gender.getDescription() == 'Fêmea' ? 'selected' : ''}>Fêmea</option>
                    </select>
                </div>
                <div class="flex justify-center items-center gap-2 flex-row">
                    <label for="breed">Raça:</label>
                    <input name="breed" id="breed" class="input flex items-center w-full pointer-events-none"
                           type="text" value="${pet.breed}" readonly />
                    <label for="color">Cor:</label>
                    <input name="color" id="color" class="input flex items-center w-full pointer-events-none"
                           type="text" value="${pet.color}" readonly />
                </div>
                <div class="flex justify-center items-center gap-2 flex-row">
                    <label for="description">Descrição:</label>
                    <input name="description" id="description" class="input flex items-center w-full pointer-events-none"
                           type="text" value="${pet.description}" readonly />
                </div>
                <input type="file" name="imageUploader" id="imageUploader" class="file-input file-input-bordered hidden"
                       onchange="previewImage(event)" />
                <div class="card-actions justify-end">
                    <c:if test="${pet.getOwnerId() != user.getId()}">
                        <a href="userProfile?ownerId=${pet.ownerId}" class="btn btn-primary">Entrar em contato com o Dono</a>
                    </c:if>
                    <c:if test="${pet.getOwnerId() == user.getId()}">
                        <button type="submit" id="submitRemove" name="action" value="remove" class="btn btn-outline mt-4 status-reseter-button">Remover</button>
                        <button type="button" id="editBtn" onclick="toggleEdit(this)" class="btn btn-primary mt-4">Editar</button>
                        <button type="submit" id="submitEdit" name="action" value="edit" class="btn btn-success mt-4 status-reseter-button hidden">Salvar</button>
                    </c:if>
                </div>
            </section>
        </main>
    </form>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="./scripts/toggleEdit.js"></script>
    </body>
    </html>