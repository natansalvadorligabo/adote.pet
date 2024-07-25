<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.min.css" rel="stylesheet" type="text/css" />

    <title>Adote.pet - Cadastro</title>
  </head>
  <body>
    <main class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
      <form action="userRegister" method="post" class="flex flex-col mt-10 sm:mx-auto sm:w-full sm:max-w-sm gap-y-4">
        <h1 class="mt-10 text-center text-2xl font-bold leading-9 tracking-tight">Cadastro</h1>

        <label class="input input-bordered flex items-center" for="name">
          <input class="w-full" type="text" name="name" id="name" autocomplete="username" placeholder="Nome de usuário" autofocus required />
        </label>

        <label class="input input-bordered flex items-center" for="email">
          <input class="w-full"  type="email" name="email" id="email" autocomplete="email" placeholder="E-mail" required />
        </label>

        <label class="input input-bordered flex items-center" for="password">
          <input class="w-full"  type="password" name="password" id="password" autocomplete="password" placeholder="Senha" required />
        </label>

        <label class="input input-bordered flex items-center" for="phoneNumber">
          <input class="w-full"  type="tel" pattern="[0-9]{2}[0-9]{5}[0-9]{4}" name="phoneNumber" id="phoneNumber" placeholder="(xx)xxxxx-xxxx" required />
        </label>

        <label class="input input-bordered flex items-center" for="cpf">
          <input class="w-full"  type="text" name="cpf" id="cpf" placeholder="CPF" required minlength="11" maxlength="11" />
        </label>

        <label class="input input-bordered flex items-center" for="dateOfBirth">
          <input class="w-full"  type="date" name="dateOfBirth" id="dateOfBirth" placeholder="Data de Nascimento" required />
        </label>

        <select id="gender" name="gender" class="select select-bordered w-full">
          <option disabled selected>Gênero</option>
          <option value="MASCULINO">Masculino</option>
          <option value="FEMININO">Feminino</option>
          <option value="OUTRO">Outro</option>
          <option value="PREFIRO_NAO_DIZER">Prefiro não dizer</option>
        </select>

        <div class="mt-6 space-y-2">
          <button type="submit" class="btn btn-success w-full">Cadastrar</button>
          <a href="login" class="btn btn-outline w-full">Ir para o Login</a>
        </div>
      </form>
    </main>

    <script src="https://cdn.tailwindcss.com"></script>
  </body>
</html>
