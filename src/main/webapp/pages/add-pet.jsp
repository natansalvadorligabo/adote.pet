<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adote.pet - Novo Pet</title>

    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.min.css" rel="stylesheet" type="text/css" />

    <script src="https://cdn.tailwindcss.com"></script>
  </head>
  <body>
    <main class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
      <form action="petRegister" method="post" enctype="multipart/form-data" class="flex flex-col mt-10 sm:mx-auto sm:w-full sm:max-w-sm gap-y-4">
        <h1 class="mt-10 text-center text-2xl font-bold leading-9 tracking-tight">Novo Pet para Adoção</h1>

        <label class="input input-bordered flex items-center" for="name">
          <input class="w-full" type="text" name="name" id="name" placeholder="Nome" required />
        </label>

        <label class="input input-bordered flex items-center" for="breed">
          <input class="w-full"  type="text" name="breed" id="breed" placeholder="Raça" autocomplete="off" required />
        </label>

        <label class="input input-bordered flex items-center" for="password">
          <input class="w-full"  type="password" name="password" id="password" autocomplete="password" placeholder="Senha" required />
        </label>

        <label class="input input-bordered flex items-center" for="phoneNumber">
          <input class="w-full"  type="tel" pattern="[0-9]{2}[0-9]{5}[0-9]{4}" name="phoneNumber" id="phoneNumber" placeholder="(xx)xxxxx-xxxx" required />
        </label>

        <label class="input input-bordered flex items-center" for="age">
          <input class="w-full" type="number" name="age" id="age" placeholder="Idade" required />
        </label>

        <label class="input input-bordered flex items-center" for="color">
          <input class="w-full" type="text" name="color" id="color" placeholder="Cor" required />
        </label>

        <label for="description">
          <textarea class="w-full textarea textarea-bordered" name="description" id="description" placeholder="Descrição" required></textarea>
        </label>


        <label class="input input-bordered flex items-center" for="address">
          <input class="w-full" type="text" name="address" id="address" placeholder="Endereço" required />
        </label>

        <input type="file" name="photo" id="photo" class="file-input file-input-bordered w-full" />

        <select id=gender name="gender" class="select select-bordered w-full">
          <option disabled selected>Sexo</option>
          <option value="MALE">Macho</option>
          <option value="FEMALE">Femea</option>
        </select>

        <select id=size name="size" class="select select-bordered w-full">
          <option disabled selected>Porte</option>
          <option value="SMALL">Pequeno</option>
          <option value="MEDIUM">Médio</option>
          <option value="LARGE">Grande</option>
        </select>


        <div class="mt-6 space-y-2">
          <button type="submit" class="btn btn-success w-full">Colocar para adoção</button>
        </div>
      </form>
    </main>
  </body>
</html>
