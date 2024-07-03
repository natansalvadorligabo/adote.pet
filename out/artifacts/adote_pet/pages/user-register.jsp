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
      <form action="userRegister" method="post">
        <h1>Cadastro</h1>

        <label for="name">Nome de Usuário</label>
        <input type="text" name="name" id="name" autocomplete="username" placeholder="Name" autofocus required />


        <label for="email">Email</label>
        <input type="email" name="email" id="email" autocomplete="email" placeholder="E-mail" required />


        <label for="password">Senha</label>
        <input type="password" name="password" id="password" autocomplete="password" placeholder="Password" required />

        <button type="submit" class="btn btn-primary">Cadastrar</button>

        <a href="../home-login.jsp">Entrar</a>
      </form>
    </main>
  </body>
</html>
