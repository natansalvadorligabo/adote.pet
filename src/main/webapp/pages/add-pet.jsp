<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adote.pet - Novo Pet</title>
  </head>
  <body>
    <main>
      <form action="petRegister" method="post" class="flex flex-col gap-3 mt-16 w-82">
        <h1>Novo Pet</h1>

        <div>
          <label for="name">Nome</label>
          <input type="text" name="name" id="name" placeholder="Nome" autofocus required />
        </div>

        <div>
          <label for="breed">Raça</label>
          <input type="text" name="breed" id="breed" placeholder="Raça" required />
        </div>

        <div>
          <label for="gender">Gênero
            <select id=gender name="gender">
              <option value="MALE">Macho</option>
              <option value="FEMALE">Femea</option>
            </select>
          </label>
        </div>

        <div>
          <label for="size">Porte
            <select id=size name="size">
              <option value="SMALL">Pequeno</option>
              <option value="MEDIUM">Médio</option>
              <option value="LARGE">Grande</option>
            </select>
          </label>
        </div>

        <div>
          <label for="age">Idade</label>
          <input type="number" name="age" id="age" placeholder="Idade" required />
        </div>

        <div>
          <label for="color">Cor</label>
          <input type="text" name="color" id="color" placeholder="Cor" required />
        </div>

        <div>
          <label for="description">Descrição</label>
          <textarea name="description" id="description" placeholder="Descrição" required></textarea>
        </div>

        <div>
          <label for="address">Endereço</label>
          <input type="text" name="address" id="address" placeholder="Endereço" required />
        </div>

        <div>
          <label for="photo">Foto</label>
          <input type="file" name="photo" id="photo" required />
        </div>

        <button type="submit" class="btn btn-primary">Colocar para adoção</button>
      </form>
    </main>
  </body>
</html>
