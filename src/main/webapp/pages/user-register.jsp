<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="favicon-dog-paw-16x16.png" rel="icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script defer src="./scripts/MessagesButtonListener.js"></script>
    <title>Adote.pet - Cadastro</title>
  </head>
  <body>
    <main class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8 items-center">
      <c:if test="${result == 'Email already registered'}">
        <div role="alert" class="alert alert-error w-fit message-alert">
          <span>Este email já está cadastrado! Tente novamente.</span>
          <div>
            <button class="btn btn-ghost message-alert-button">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                <path stroke-linecap="round" stroke-linejoin="round" d="m9.75 9.75 4.5 4.5m0-4.5-4.5 4.5M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
              </svg>
            </button>
          </div>
        </div>
      </c:if>
      <form action="userRegister" enctype="multipart/form-data" method="post" class="flex flex-col mt-10 sm:mx-auto sm:w-full sm:max-w-sm gap-y-4">
        <h1 class="mt-10 text-center text-2xl font-bold leading-9 tracking-tight">Cadastro</h1>

        <label class="input input-bordered flex items-center" for="name">
          <input class="w-full" type="text" name="name" id="name" autocomplete="username" placeholder="Nome de usuário" autofocus required />
        </label>
        <span id="error-name" class="text-error hidden"></span>

        <label class="input input-bordered flex items-center" for="email">
          <input class="w-full"  type="email" name="email" id="email" autocomplete="email" placeholder="E-mail" required />
        </label>
        <span id="error-email" class="text-error hidden"></span>

        <label class="input input-bordered flex items-center" for="password">
          <input class="w-full"  type="password" name="password" id="password" autocomplete="password" placeholder="Senha" required />
        </label>
        <span id="error-password" class="text-error hidden"></span>

        <label class="input input-bordered flex items-center" for="password">
          <input class="w-full"  type="password" name="password" id="confirmPassword" autocomplete="password" placeholder="Confirmação de senha" required />
        </label>
        <span id="error-confirmPassword" class="text-error hidden"></span>

        <label class="input input-bordered flex items-center" for="phoneNumber">
          <input class="w-full"  type="tel" pattern="[0-9]{2}[0-9]{5}[0-9]{4}" name="phoneNumber" id="phoneNumber" placeholder="(xx)xxxxx-xxxx" required />
        </label>
        <span id="error-phoneNumber" class="text-error hidden"></span>

        <label class="input input-bordered flex items-center" for="cpf">
          <input class="w-full"  type="text" name="cpf" id="cpf" placeholder="CPF" required minlength="11" maxlength="11" />
        </label>
        <span id="error-cpf" class="text-error hidden"></span>

        <label class="input input-bordered flex items-center" for="dateOfBirth">
          <input class="w-full"  type="date" name="dateOfBirth" id="dateOfBirth" placeholder="Data de Nascimento" required />
        </label>
        <span id="error-dateOfBirth" class="text-error hidden"></span>

        <select id="gender" name="gender" class="select select-bordered w-full" required>
          <option value="" disabled selected>Gênero</option>
          <option value="MASCULINO">Masculino</option>
          <option value="FEMININO">Feminino</option>
          <option value="OUTRO">Outro</option>
          <option value="PREFIRO_NAO_DIZER">Prefiro não dizer</option>
        </select>
        <span id="error-gender" class="text-error hidden"></span>

        <label class="flex items-center" for="photo"> Selecione uma imagem de perfil (opcional)
        </label>
        <input type="file" name="photo" id="photo" class="file-input file-input-bordered w-full" />

        <div class="mt-6 space-y-2">
          <button type="submit" class="btn btn-success w-full status-reseter-button">Cadastrar</button>
          <a href="login" class="btn btn-outline w-full status-reseter-button">Ir para o Login</a>
        </div>
      </form>
    </main>

    <script src="https://cdn.tailwindcss.com"></script>
    <script src="./scripts/validateUserRegister.js" defer></script>
  </body>
</html>
