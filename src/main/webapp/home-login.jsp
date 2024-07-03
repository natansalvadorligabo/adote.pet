<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Adote.pet - Login</title>
</head>
<body>
<main>
  <form action="login" method="post">
    <h1>Login</h1>

    <input type="email" name="email" id="email" placeholder="E-mail" autofocus required />
    <input type="password" name="password" id="password" placeholder="Senha" required />

    <button type="submit" class="btn btn-primary">Entrar</button>
    <a href="pages/user-register.jsp">Criar conta</a>
  </form>
</main>
</body>
</html>