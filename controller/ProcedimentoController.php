<?php

session_start();

include_once "../config/conexao.php";
include_once "../model/procedimento.php";
include_once "../dao/ProcedimentoDao.php";

if(isset($_GET["id"]))
{
    $procedimentoDao = new ProcedimentoDao();

    $procedimentoDao->delete($_GET["id"]);

    header("location:../procedimento.php");
}

if(isset($_POST["btGravar"]))
{
    $procedimento = new Procedimento(

        $_POST["txtIdProcedimento"],
        $_POST["txtNomeProcedimento"],
        $_POST["txtDescricao"],
        $_POST["txtValorProcedimento"]

    );

    $procedimentoDao = new ProcedimentoDao();

    $procedimentoDao->create($procedimento);

    header("location:../procedimento.php");
}