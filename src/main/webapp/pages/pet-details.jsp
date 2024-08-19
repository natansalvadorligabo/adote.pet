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
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <jsp:include page="/components/navbar.jsp" />

    <main class="card lg:card-side bg-base-200 shadow-xl mx-auto max-w-4xl my-10">
        <figure>
            <img src="${pet.photo}" alt="${pet.name}" class="object-cover" />
        </figure>
        <section class="card-body space-y-2">
            <h1 class="card-title mb-4 font-bold">${pet.name}</h1>
            <p><strong>Idade:</strong> ${pet.age} anos</p>
            <p><strong>Raça:</strong> ${pet.breed}</p>
            <p><strong>Gênero:</strong> ${pet.gender}</p>
            <p><strong>Cor:</strong> ${pet.color}</p>
            <p><strong>Descrição:</strong> ${pet.description}</p>
            <p><strong>Endereço:</strong> ${pet.address}</p>
            <div class="card-actions justify-end">
                <button class="btn btn-primary">Adotar</button>
            </div>
        </section>
    </main>
    <script src="https://cdn.tailwindcss.com"></script>
</body>
</html>