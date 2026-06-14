<?php

class PacienteDao
{
    public function create(Paciente $paciente)
    {
        try {
            $pdo = conexao::conectar();

            $sql = "INSERT INTO paciente
            (nome, cpf, telefone, email, cep, logradouro, numero, bairro, cidade, estado, dataNascimento, historicoOdontologico)
            VALUES
            (?,?,?,?,?,?,?,?,?,?,?,?)";

            $query = $pdo->prepare($sql);

            $query->execute([
                $paciente->nome,
                $paciente->cpf,
                $paciente->telefone,
                $paciente->email,
                $paciente->cep,
                $paciente->logradouro,
                $paciente->numero,
                $paciente->bairro,
                $paciente->cidade,
                $paciente->estado,
                $paciente->dataNascimento,
                $paciente->historicoOdontologico
            ]);

            conexao::desconectar();
            return true;

        } catch (PDOException $exception) {
            die("Erro ao cadastrar: " . $exception->getMessage());
        }
    }

    public function read()
    {
        try {
            $pdo = conexao::conectar();

            $sql = "SELECT * FROM paciente ORDER BY nome";
            $resultado = $pdo->query($sql);

            $lista = [];

            foreach ($resultado as $linha) {
                $lista[] = new Paciente(
                    $linha["idPaciente"],
                    $linha["nome"],
                    $linha["cpf"],
                    $linha["telefone"],
                    $linha["email"],
                    $linha["cep"],
                    $linha["logradouro"],
                    $linha["numero"],
                    $linha["bairro"],
                    $linha["cidade"],
                    $linha["estado"],
                    $linha["dataNascimento"],
                    $linha["historicoOdontologico"]
                );
            }

            conexao::desconectar();
            return $lista;

        } catch (PDOException $exception) {
            return null;
        }
    }

    public function readId($id)
    {
        try {
            $pdo = conexao::conectar();

            $sql = "SELECT * FROM paciente WHERE idPaciente = ?";
            $query = $pdo->prepare($sql);
            $query->execute([$id]);

            $dados = $query->fetch(PDO::FETCH_ASSOC);

            conexao::desconectar();
            return $dados;

        } catch (PDOException $exception) {
            return null;
        }
    }

    public function update(Paciente $paciente)
    {
        try {
            $pdo = conexao::conectar();

            $sql = "UPDATE paciente SET
                        nome = ?,
                        cpf = ?,
                        telefone = ?,
                        email = ?,
                        cep = ?,
                        logradouro = ?,
                        numero = ?,
                        bairro = ?,
                        cidade = ?,
                        estado = ?,
                        dataNascimento = ?,
                        historicoOdontologico = ?
                    WHERE idPaciente = ?";

            $query = $pdo->prepare($sql);

            $query->execute([
                $paciente->nome,
                $paciente->cpf,
                $paciente->telefone,
                $paciente->email,
                $paciente->cep,
                $paciente->logradouro,
                $paciente->numero,
                $paciente->bairro,
                $paciente->cidade,
                $paciente->estado,
                $paciente->dataNascimento,
                $paciente->historicoOdontologico,
                $paciente->idPaciente
            ]);

            conexao::desconectar();
            return true;

        } catch (PDOException $exception) {
            die("Erro ao alterar: " . $exception->getMessage());
        }
    }

    public function delete($id)
    {
        try {
            $pdo = conexao::conectar();

            $sql = "DELETE FROM paciente WHERE idPaciente = ?";
            $query = $pdo->prepare($sql);
            $query->execute([$id]);

            conexao::desconectar();
            return true;

        } catch (PDOException $exception) {
            die("Erro ao excluir: " . $exception->getMessage());
        }
    }
}