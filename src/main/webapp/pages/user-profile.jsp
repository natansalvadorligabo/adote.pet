<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <main class="card lg:card-side bg-base-200 shadow-xl mx-auto max-w-4xl my-10">
        <figure class="lg:w-1/2">
            <img src="${user.photo}" alt="${user.username}" />
        </figure>
        <section class="card-body space-y-2">
            <h1 class="card-title mb-4 font-bold">${user.username}</h1>
            <p><strong>Email:</strong> ${user.email}</p>
            <p><strong>Telefone:</strong> ${user.phoneNumber}</p>
        </section>
    </main>
<script src="https://cdn.tailwindcss.com"></script>
</body>
</html>
