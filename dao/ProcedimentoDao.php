<?php

class ProcedimentoDao
{
    public function create(Procedimento $procedimento)
    {
        try {

            $pdo = conexao::conectar();

            $sql = "INSERT INTO procedimento
            (
                nomeProcedimento,
                descricao,
                valorProcedimento
            )
            VALUES
            (
                ?,?,?
            )";

            $query = $pdo->prepare($sql);

            $query->execute([
                $procedimento->nomeProcedimento,
                $procedimento->descricao,
                $procedimento->valorProcedimento
            ]);

            conexao::desconectar();

            return true;

        } catch(PDOException $exception) {

            die("Erro ao cadastrar procedimento: " . $exception->getMessage());

        }
    }

    public function read()
    {
        try {

            $pdo = conexao::conectar();

            $sql = "SELECT * FROM procedimento ORDER BY nomeProcedimento";

            $resultado = $pdo->query($sql);

            $lista = [];

            foreach($resultado as $linha)
            {
                $lista[] = new Procedimento(
                    $linha["idProcedimento"],
                    $linha["nomeProcedimento"],
                    $linha["descricao"],
                    $linha["valorProcedimento"]
                );
            }

            conexao::desconectar();

            return $lista;

        } catch(PDOException $exception) {

            return null;

        }
    }

    public function delete($id)
    {
        try {

            $pdo = conexao::conectar();

            $sql = "DELETE FROM procedimento WHERE idProcedimento = ?";

            $query = $pdo->prepare($sql);

            $query->execute([$id]);

            conexao::desconectar();

            return true;

        } catch(PDOException $exception) {

            die("Erro ao excluir procedimento: " . $exception->getMessage());

        }
    }
}