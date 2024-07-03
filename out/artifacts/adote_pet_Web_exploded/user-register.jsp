<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>

<html>
  <head>
    <title>Title</title>
  </head>
  <body>
    <main>
      <form action="userRegister" method="post">
        <h1>Register</h1>
        <label for="name">Username</label>
        <input type="text" name="name" id="name" placeholder="Name" autofocus required />


        <label for="email">Email</label>
        <input type="email" name="email" id="email" placeholder="E-mail" required />


        <label for="password">Password</label>
        <input type="password" name="password" id="password" placeholder="Password" required />

        <button type="submit" class="btn btn-primary">Register</button>
        <a href="login.jsp">Login</a>
      </form>
    </main>
  </body>
</html>
