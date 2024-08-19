<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="navbar bg-base-300">
    <div class="flex-1">
        <a href="home" class="btn btn-ghost text-xl">Adote.pet</a>
    </div>
    <div class="flex-none">
        <a href="petRegister" class="btn btn-ghost">Novo Pet</a>
    </div>
    <div class="flex-none gap-2">
        <div class="form-control">
            <input type="text" placeholder="Pesquisar" class="input input-bordered w-24 md:w-auto" />
        </div>
        <div class="dropdown dropdown-end">
            <div tabindex="0" role="button" class="btn btn-ghost btn-circle avatar">
                <div class="w-10 rounded-full">
                    <img src="https://avatars.githubusercontent.com/u/79167486?v=4" />
                </div>
            </div>
            <ul tabindex="0" class="menu menu-sm dropdown-content bg-base-200 rounded-box z-[1] mt-3 w-52 p-2 shadow">
                <li>
                    <a class="justify-between">Perfil</a>
                </li>
                <li><a>Configurações</a></li>
                <li><a href="logout">Sair</a></li>
            </ul>
        </div>
    </div>
</div>
