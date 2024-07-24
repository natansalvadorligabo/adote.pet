<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.min.css" rel="stylesheet" type="text/css" />

  <title>Adote.pet - Login</title>
</head>
<body>
<main class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
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

    <button type="submit" class="btn btn-primary flex w-full justify-center">Entrar</button>
  </form>

  <p class="mt-10 text-center text-sm text-gray-500">
    Não é um membro?
    <a href="userRegister" class="font-semibold leading-6 text-indigo-600 hover:text-primary">Cadastre-se</a>
  </p>
</main>
<script src="https://cdn.tailwindcss.com"></script>
</body>
</html>