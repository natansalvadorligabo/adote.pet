<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script defer src="../scripts/MessagesButtonListener.js"></script>
    <title>Adote.pet - Cadastro</title>
  </head>
  <body>
    <main class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8 items-center">

      <c:if test="${result == 'Email already registered'}">
        <div role="alert" class="alert alert-error w-fit message-alert">
          <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="h-6 w-6 shrink-0 stroke-current"
                  fill="none"
                  viewBox="0 0 24 24">
            <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z">
            </path>
          </svg>
          <span>Este email já está cadastrado! Tente novamente.</span>
          <div>
            <button class="btn btn-sm message-alert-button">Accept</button>
          </div>
        </div>
      </c:if>

      <form action="userRegister" method="post" class="flex flex-col mt-10 sm:mx-auto sm:w-full sm:max-w-sm gap-y-4">
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
