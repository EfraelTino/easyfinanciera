<?php
require_once './config/Utils.php';

class User
{
    private $db;
    private $utils;

    public function __construct($db)
    {
        $this->db = $db;
        $this->utils = new Utils();
    }

    public function findUserByEmail($email)
    {
        $stmt = $this->db->prepare("SELECT * FROM users WHERE email = ?");
        $stmt->execute([$email]);
        return $stmt->fetch(PDO::FETCH_ASSOC); // Solo se llama a fetch una vez
    }
    public function findUserIdActive($id){
        $stmt = $this->db->prepare("SELECT * FROM users WHERE id = ? AND status = 1");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC); // Solo se llama a fetch una vez
    }
    public function findUserId($id)
    {
        $stmt = $this->db->prepare("SELECT * FROM users WHERE id = ?");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC); // Solo se llama a fetch una vez
    }
    public function updateLogin($email)
    {
        $fecha = $this->utils->dataNow();
        $stmt = $this->db->prepare("UPDATE users SET fechainicio = ? WHERE email = ?");
        $stmt->execute([$fecha, $email]); // Corregido: los parámetros deben estar en un array

        // Como es un UPDATE, no se usa fetch() aquí
        return $stmt->rowCount(); // Opcional: devuelve el número de filas afectadas

    }
    // Validar si un usuario existe 
    public function checkUserExists($email)
    {
        return self::findUserByEmail($email) !== false;
    }
    public function verifyData($email)
    {
        $stm = $this->db->prepare("SELECT is_verify FROM user WHERE email = ?");
        $stm->execute([$email]);
        $result = $stm->fetch(PDO::FETCH_ASSOC);
        $isverify = intval($result['is_verify']);

        if ($isverify === 0) {  // Si el usuario no está verificado
            $this->utils->sendEmail($email);
            return false;  // Retorna false para indicar que el usuario no está verificado
        } else {
            return true;  // Retorna true para indicar que el usuario está verificado
        }
    }
    public function updateData($actualizar, $condicion, $valorCondicion)
    {
        $sql = "UPDATE user SET $actualizar WHERE $condicion = :valorCondicion";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':valorCondicion', $valorCondicion, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->rowCount();
    }

    public function createUser($data)
    {
   
        $stmt = $this->db->prepare(
            "INSERT INTO users (name, lastname, password, email, typeuser,status, created_at) 
            VALUES (?, ?, ?, ?, ?, ?,?)"
        );
        $success = $stmt->execute([
            $data['name'],
            $data['lastname'],
            $data['password'],
            $data['email'],
            $data['userType'],
            1,
            $data['created_at'],
        ]);

        // Verifica si la inserción fue exitosa
        return $success;
    }

    public function updateDataUser($data)
    {
        if (!isset($data['iduser'])) {
            return 0; // Si no hay ID, no se puede actualizar
        }
    
        $fields = [];
        $values = [];
        $columnas = ['name', 'lastname', 'password', 'typeuser', 'status'];
    
        foreach ($columnas as $columna) {
            if (array_key_exists($columna, $data)) { // Evita que 0 sea ignorado
                $fields[] = "$columna = ?";
                $values[] = $data[$columna];
            }
        }
    
        if (empty($fields)) {
            return 0; // Si no hay nada que actualizar, no ejecuta la consulta
        }
    
        $values[] = $data['iduser']; // Agregamos el ID al final
        echo json_encode($data);
        
        $sql = "UPDATE users SET " . implode(", ", $fields) . " WHERE id = ?";
        

    
        $stmt = $this->db->prepare($sql);
        $stmt->execute($values);
    
        return $stmt->rowCount(); // Verifica cuántas filas se actualizaron
    }
    
    public function allUsers(){
        $stmt = $this->db->prepare("SELECT name as nombres, lastname as apellidos, email, typeuser as tipo, status as estado, created_at, id FROM users ORDER BY status DESC");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function allOccupations(){
        $stmt = $this->db->prepare("SELECT * FROM occupation");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }









    public function updateDataFoto($data)
    {

        $stmt = $this->db->prepare("UPDATE user SET perfil=? WHERE id =?");
        $stmt->execute([$data['foto'], $data['id_user']]);
        return $stmt->rowCount();
    }
    public function updatePassword($data)
    {

        $stmt = $this->db->prepare("UPDATE user SET password=?, repeat_password=? WHERE id =?");
        $stmt->execute([$data['password'], $data['repeat_password'], $data['id_user']]);
        return $stmt->rowCount();
    }
    public function updatePasswordEmail($data)
    {

        $stmt = $this->db->prepare("UPDATE user SET password=?, repeat_password=? WHERE email =?");
        $stmt->execute([$data['password'], $data['repeat_password'], $data['email']]);
        return $stmt->rowCount();
    }
}
