<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.10/dist/full.min.css" rel="stylesheet" type="text/css" />
    <title>Adote.pet - Home</title>
</head>
<body>
<main>
    <div class="navbar bg-base-100">
        <div class="flex-1">
            <a class="btn btn-ghost text-xl">Adote.pet</a>
        </div>
        <div class="flex-none gap-2">
            <div class="form-control">
<%--suppress HtmlFormInputWithoutLabel --%>
                <input type="text" placeholder="Pesquisar" class="input input-bordered w-24 md:w-auto" />
            </div>
            <div class="dropdown dropdown-end">
                <div tabindex="0" role="button" class="btn btn-ghost btn-circle avatar">
                    <div class="w-10 rounded-full">
<%--suppress HtmlRequiredAltAttribute --%>
                        <img src="https://avatars.githubusercontent.com/u/79167486?v=4" />
                    </div>
                </div>
                <ul tabindex="0" class="menu menu-sm dropdown-content bg-base-100 rounded-box z-[1] mt-3 w-52 p-2 shadow">
                    <li>
                        <a class="justify-between">Perfil</a>
                    </li>
                    <li><a>Configurações</a></li>
                    <li><a href="login">Sair</a></li>
                </ul>
            </div>
        </div>
    </div>
    <section class="flex flex-row flex-wrap gap-8 justify-center items-center mt-8 md:mt-16">
        <div class="card bg-base-100 w-96 shadow-xl">
            <figure>
                <img src="https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2020-06/angry_chihuahua.png?itok=TWxYDbOT"
                        alt="Dog" />
            </figure>
            <div class="card-body">
                <h2 class="card-title">
                    Dog 1 Example
                </h2>
                <p>If a dog chews shoes whose shoes does he choose?</p>
                <div class="card-actions justify-end">
                    <div class="badge badge-primary">Pinscher</div>
                    <div class="badge badge-accent">10 anos</div>
                </div>
            </div>
        </div>
        <div class="card bg-base-100 w-96 shadow-xl">
            <figure>
                <img src="https://c02.purpledshub.com/uploads/sites/41/2024/03/Dogs-improve-concentration-creativity.jpg?w=750&webp=1"
                     alt="Dog" />
            </figure>
            <div class="card-body">
                <h2 class="card-title">
                    Dog 2 Example
                </h2>
                <p>If a dog chews shoes whose shoes does he choose?</p>
                <div class="card-actions justify-end">
                    <div class="badge badge-primary">Outro</div>
                    <div class="badge badge-accent">1 ano</div>
                </div>
            </div>
        </div>
    </section>
</main>
</body>
<script src="https://cdn.tailwindcss.com"></script>
</html>