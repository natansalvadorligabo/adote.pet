<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>

<html lang="pt-br">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Adote.pet - Cadastro</title>
  </head>
  <body>
    <main>
      <form action="userRegister" method="post" class="flex flex-col gap-3 mt-16 w-82">
        <h1>Cadastro</h1>

        <div>
          <label for="name">Nome de Usuário</label>
          <input type="text" name="name" id="name" autocomplete="username" placeholder="Name" autofocus required />
        </div>

        <div>
          <label for="email">Email</label>
          <input type="email" name="email" id="email" autocomplete="email" placeholder="E-mail" required />
        </div>

        <div>
          <label for="password">Senha</label>
          <input type="password" name="password" id="password" autocomplete="password" placeholder="Password" required />
        </div>

        <div>
          <label for="phoneNumber">Telefone</label>
          <input type="tel" name="phoneNumber" id="phoneNumber" placeholder="Telefone" required />
        </div>

        <div>
          <label for="cpf">CPF</label>
          <input type="text" name="cpf" id="cpf" placeholder="CPF" required minlength="11" maxlength="11" />
        </div>

        <div>
          <label for="dateOfBirth">Data de Nascimento</label>
          <input type="date" name="dateOfBirth" id="dateOfBirth" placeholder="Data de Nascimento" required />
        </div>

        <div>
          <label for="gender">
            <select id="gender" name="gender">
              <option>Masculino</option>
              <option>Feminino</option>
              <option>Outro</option>
            </select>
          </label>
        </div>

        <button type="submit" class="btn btn-success">Cadastrar</button>
        <a href="../home-login.jsp" class="btn btn-primary">Entrar</a>
      </form>
    </main>
  </body>
</html>
