<?php

session_start();

if(!isset($_SESSION["usuario"])){
    header("location:login.php");
    exit;
}

?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Procedimentos</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<?php include_once "navbar.php"; ?>

<div class="container mt-5">

    <div class="card shadow p-4">

        <h1 class="mb-4">Cadastrar Procedimento</h1>

        <form action="controller/ProcedimentoController.php" method="POST" class="d-grid gap-3">

            <input type="hidden" name="txtIdProcedimento">

            <div>
                <label>Nome do Procedimento</label>
                <input type="text" name="txtNomeProcedimento" class="form-control" required>
            </div>

            <div>
                <label>Descrição</label>
                <textarea name="txtDescricao" class="form-control"></textarea>
            </div>

            <div>
                <label>Valor</label>
                <input type="number" step="0.01" name="txtValorProcedimento" class="form-control" required>
            </div>

            <button type="submit" name="btGravar" class="btn btn-primary">
                Salvar
            </button>

        </form>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>