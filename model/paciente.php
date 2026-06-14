<?php

class Paciente
{
    private $idPaciente;
    private $nome;
    private $cpf;
    private $telefone;
    private $email;
    private $cep;
    private $logradouro;
    private $numero;
    private $bairro;
    private $cidade;
    private $estado;
    private $dataNascimento;
    private $historicoOdontologico;

    public function __construct(
        $idPaciente,
        $nome,
        $cpf,
        $telefone,
        $email,
        $cep,
        $logradouro,
        $numero,
        $bairro,
        $cidade,
        $estado,
        $dataNascimento,
        $historicoOdontologico
    )
    {
        $this->idPaciente = $idPaciente;
        $this->nome = $nome;
        $this->cpf = $cpf;
        $this->telefone = $telefone;
        $this->email = $email;
        $this->cep = $cep;
        $this->logradouro = $logradouro;
        $this->numero = $numero;
        $this->bairro = $bairro;
        $this->cidade = $cidade;
        $this->estado = $estado;
        $this->dataNascimento = $dataNascimento;
        $this->historicoOdontologico = $historicoOdontologico;
    }

    public function __get($atributo)
    {
        return $this->$atributo;
    }

    public function __set($atributo, $valor)
    {
        $this->$atributo = $valor;
    }
}