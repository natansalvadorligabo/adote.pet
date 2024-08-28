<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="favicon-dog-paw-16x16.png" rel="icon" type="image/x-icon">
  <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.min.css" rel="stylesheet" type="text/css" />
  <script defer src="scripts/MessagesButtonListener.js"></script>
  <title>Adote.pet - Login</title>
</head>
<body>
<main class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8 items-center">
  <c:choose>
    <c:when test="${result == 'User not found'}">
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
        <span>Não foi possível efetuar login! Verifique os dados e tente novamente.</span>
        <div>
          <button class="btn btn-ghost message-alert-button">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
              <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" />
            </svg>
          </button>
        </div>
      </div>
    </c:when>
    <c:when test="${result == 'User registered'}">

      <div role="alert" class="alert alert-success w-fit message-alert">
        <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-6 w-6 shrink-0 stroke-current"
                fill="none"
                viewBox="0 0 24 24">
          <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z">
          </path>
        </svg>
        <span>Usuário cadastrado com sucesso! Efetue login para acessar ao site.</span>
        <div>
          <button class="btn btn-ghost message-alert-button">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
              <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" />
            </svg>
          </button>
        </div>
      </div>

    </c:when>
  </c:choose>
  <form action="login" method="post" class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm space-y-6">
    <h1 class="mt-10 text-center text-2xl font-bold leading-9 tracking-tight">Login</h1>

    <label class="input input-bordered flex items-center gap-2" for="email">
      <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 16 16"
              fill="currentColor"
              class="h-4 w-4 opacity-70">
        <path
                d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z"></path>
      </svg>
      <input type="email" name="email" id="email" placeholder="E-mail" class="grow" autofocus required />
    </label>

    <label class="input input-bordered flex items-center gap-2" for="password">
      <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 16 16"
              fill="currentColor"
              class="h-4 w-4 opacity-70">
        <path
                fill-rule="evenodd"
                d="M14 6a4 4 0 0 1-4.899 3.899l-1.955 1.955a.5.5 0 0 1-.353.146H5v1.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-2.293a.5.5 0 0 1 .146-.353l3.955-3.955A4 4 0 1 1 14 6Zm-4-2a.75.75 0 0 0 0 1.5.5.5 0 0 1 .5.5.75.75 0 0 0 1.5 0 2 2 0 0 0-2-2Z"
                clip-rule="evenodd"></path>
      </svg>
      <input type="password" name="password" id="password" placeholder="Senha" class="grow" required />
    </label>

    <button type="submit" class="btn btn-primary flex w-full justify-center status-reseter-button">Entrar</button>
  </form>

  <p class="mt-10 text-center text-sm text-gray-500">
    Não é um membro?
    <a href="userRegister" class="font-semibold leading-6 text-indigo-600 hover:text-primary status-reseter-button">Cadastre-se</a>
  </p>
</main>
<script src="https://cdn.tailwindcss.com"></script>
</body>
</html>