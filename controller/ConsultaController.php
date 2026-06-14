<?php

session_start();

include_once "../config/conexao.php";
include_once "../model/consulta.php";
include_once "../dao/ConsultaDao.php";

if (isset($_GET["id"])) {

    $consultaDao = new ConsultaDao();

    $consultaDao->delete($_GET["id"]);

    header("location:../consulta.php");
}

if (isset($_POST["btGravar"])) {

    $consulta = new Consulta(

        $_POST["txtIdConsulta"],
        $_POST["txtDataConsulta"],
        $_POST["txtHorarioConsulta"],
        $_POST["txtStatusConsulta"],
        $_POST["txtObservacoes"],
        $_POST["cbUsuario"],
        $_POST["cbPaciente"],
        $_POST["cbProcedimento"]

    );

    $consultaDao = new ConsultaDao();

    $consultaDao->create($consulta);

    header("location:../consulta.php");
}