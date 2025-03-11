<?php

class CreditModel
{
    private $db;

    public function __construct($db)
    {
        $this->db = $db;
    }
    public function findOccupation($id)
    {
        $stmt = $this->db->prepare("SELECT * FROM occupation WHERE id = ?");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    public function createOccupation($data)
    {
        $query = "INSERT INTO occupation (name) VALUES (:occupationname)";
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':occupationname', $data, PDO::PARAM_STR);
        $stmt->execute();

        return $this->db->lastInsertId();
    }
    public function manageDateCredits()
    {
        $query = "SELECT * FROM tbInterest";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function createUserCredit($data)
    {
        $query = "INSERT INTO credit_user (dni, name, lastname, birthday, civil_state, occupation_id, phone, document, gender, persontype) VALUES (:userdni, :username, :userlastname, :userbirthday, :usercivil_state, :useroccupation_id, :userphone, :userdocument, :gender, :persontype)";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(':userdni', $data['dni']);
        $stmt->bindParam(':username', $data['name']);
        $stmt->bindParam(':userlastname', $data['lastname']);
        $stmt->bindParam(':userbirthday', $data['birthday']);
        $stmt->bindParam(':usercivil_state', $data['civil_state']);
        $stmt->bindParam(':useroccupation_id', $data['occupation_id']);
        $stmt->bindParam(':userphone', $data['phone']);
        $stmt->bindParam(':userdocument', $data['document']);
        $stmt->bindParam(':gender', $data['gender']);
        $stmt->bindParam(':persontype', $data['persontype']);
        $stmt->execute();
        return $this->db->lastInsertId();
    }
    public function createAddress($data, $id)
    {
        $query = "INSERT INTO address_credit_user (user_id, condicion, tipo, principal, depatamento_id, provincia_id, distrito_id, direccion, denominacion, latitud) VALUES (:user_id, :condicion, :tipo, :principal, :departament_id, :provincia_id, :distrito_id, :direccion, :denominacion, :latitud)";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(':user_id', $id);
        $stmt->bindParam(':city', $data['city']);
        $stmt->execute();
    }
}
