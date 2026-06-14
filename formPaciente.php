<?php

session_start();

if(!isset($_SESSION["usuario"])){
    header("location:login.php");
    exit;
}

include_once "config/conexao.php";
include_once "model/paciente.php";
include_once "dao/PacienteDao.php";

$idPaciente = "";
$nome = "";
$cpf = "";
$telefone = "";
$email = "";
$cep = "";
$logradouro = "";
$numero = "";
$bairro = "";
$cidade = "";
$estado = "";
$dataNascimento = "";
$historicoOdontologico = "";

if (isset($_GET["id"])) {
    $pacienteDao = new PacienteDao();
    $dados = $pacienteDao->readId($_GET["id"]);

    if ($dados) {
        $idPaciente = $dados["idPaciente"];
        $nome = $dados["nome"];
        $cpf = $dados["cpf"];
        $telefone = $dados["telefone"];
        $email = $dados["email"];
        $cep = $dados["cep"];
        $logradouro = $dados["logradouro"];
        $numero = $dados["numero"];
        $bairro = $dados["bairro"];
        $cidade = $dados["cidade"];
        $estado = $dados["estado"];
        $dataNascimento = $dados["dataNascimento"];
        $historicoOdontologico = $dados["historicoOdontologico"];
    }
}

?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cadastrar Paciente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<?php include_once "navbar.php"; ?>

<div class="container mt-5">

    <div class="card shadow p-4">

        <h1 class="mb-4">
            <?= $idPaciente == "" ? "Cadastrar Paciente" : "Editar Paciente" ?>
        </h1>

<form action="controller/PacienteController.php" method="POST" class="d-grid gap-3">

    <input type="hidden" name="txtIdPaciente" value="<?= $idPaciente ?>">

    Nome:<br>
    <input type="text" name="txtNome" value="<?= $nome ?>" class="form-control" required><br><br>

    CPF:<br>
    <input type="text" name="txtCpf" value="<?= $cpf ?>" class="form-control" required><br><br>

    Telefone:<br>
    <input type="text" name="txtTelefone" value="<?= $telefone ?>" class="form-control"><br><br>

    Email:<br>
    <input type="email" name="txtEmail" value="<?= $email ?>" class="form-control"><br><br>

    CEP:<br>
    <input type="text" name="txtCep" value="<?= $cep ?>" class="form-control"><br><br>

    Logradouro:<br>
    <input type="text" name="txtLogradouro" value="<?= $logradouro ?>" class="form-control"><br><br>

    Número:<br>
    <input type="text" name="txtNumero" value="<?= $numero ?>" class="form-control"><br><br>

    Bairro:<br>
    <input type="text" name="txtBairro" value="<?= $bairro ?>" class="form-control"><br><br>

    Cidade:<br>
    <input type="text" name="txtCidade" value="<?= $cidade ?>" class="form-control"><br><br>

    Estado:<br>
    <input type="text" name="txtEstado" value="<?= $estado ?>" maxlength="2" class="form-control"><br><br>

    Data de nascimento:<br>
    <input type="date" name="txtDataNascimento" value="<?= $dataNascimento ?>" class="form-control"><br><br>

    Histórico odontológico:<br>
    <textarea name="txtHistoricoOdontologico" class="form-control"><?= $historicoOdontologico ?></textarea><br><br>

    <button type="submit" name="btGravar" class="btn btn-primary">
    Salvar
    </button>

</form>

<br>
<a href="paciente.php" class="btn btn-secondary mt-3">
    Ver pacientes
</a>
    </div>    
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>