<?php

function podeEditar()
{
    return isset($_SESSION["tipoUsuario"]) &&
    (
        $_SESSION["tipoUsuario"] == "Administrador" ||
        $_SESSION["tipoUsuario"] == "Secretaria" ||
        $_SESSION["tipoUsuario"] == "Secretária"
    );
}

function podeEditarUsuario()
{
    return isset($_SESSION["tipoUsuario"]) &&
    $_SESSION["tipoUsuario"] == "Administrador";
}