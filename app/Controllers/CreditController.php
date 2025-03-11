<?php
require_once './app/Models/CreditModel.php';
require_once './app/Models/User.php';
require_once './config/Utils.php';

use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\Filesystem\Exception\IOExceptionInterface;

class CreditController
{
    private $creditModel;
    private $utils;
    private $userModel;
    public function __construct($db)
    {
        $this->creditModel = new CreditModel($db);
        $this->userModel = new User($db);
        $this->utils = new Utils();
        // $this->filesystem = new Filesystem();
    }
    public function manageDateCredits()
    {
        $search = $this->creditModel->manageDateCredits();
        if (!$search) {
            return $this->utils->jsonResponse(200, ['success' => false, 'message' => 'No se encontraron datos']);
        }
        return $this->utils->jsonResponse(200, ['success' => true, 'message' => $search]);
    }
    public function createCredit($request)
    {
        $data = $request['body'];
        $validateFields = $this->utils->validateAllFields($data["userdata"]);
        $validateAdress = $this->utils->validateArrays($data["address"]);
        if (!$validateFields['status']) {
            return $this->utils->jsonResponse(200, ['success' => false, 'message' => $validateFields['message'] . json_encode($data)]);
        }
        if (!$validateAdress['status']) {
            return $this->utils->jsonResponse(200, ['success' => false, 'message' => $validateAdress['message']]);
        }
        $userById = $this->userModel->findUserIdActive($data['userdata']['asesor_id']);
        if (!$userById) {
            return  $this->utils->jsonResponse(200, ['success' => false, 'message' => 'Asesor no encontrado']);
        }
        $searchOccupation = $this->creditModel->findOccupation($data['userdata']['occupation_id']);
        if (!$searchOccupation) {
            if (!$data['userdata']['occupationname']) {
                return $this->utils->jsonResponse(200, ['success' => false, 'message' => 'Ingresa la ocupación']);
            }
            $createdOccupationId = $this->creditModel->createOccupation($data['occupationname']);
            if (!$createdOccupationId) {
                return $this->utils->jsonResponse(200, ['success' => false, 'message' => 'Error al crear la ocupación' . $createdOccupationId]);
            }
            return $this->utils->jsonResponse(200, ['success' => true, 'message' => 'Ocupación creada correctamente' . $createdOccupationId]);
        }

        return $this->utils->jsonResponse(200, ['success' => true, 'message' => 'Ocupación encontrada' . json_encode($validateAdress)]);
        /**
         * FIRST - CREATE CREDIT AND RETURN CLIENT ID TABLE credit_user
         * SECOND - INSERT ADDRESS OF CLIENT TYPE ARRAY table address_credit_user
         * THIRD - INSERT DATA OF LOANS WITH CLIENT ID table loans
         */

        /**
         * 
         * if($user){
            $user['credit']=$credit;
            return $this->utils->jsonResponse(200, ['success' => true, 'message' => $user]);
        }else{
            return $this->utils->jsonResponse(200, ['success' => false, 'message' => 'Usuario no encontrado']);
        }
        return $this->utils->jsonResponse(200, ['success' => true, 'message' => $credit]);
         */
    }
    public function createUserCredit($datas){
        $insertUser = $this->creditModel->createUserCredit($datas['userdata']);
        if(!$insertUser){
            return $this->utils->jsonResponse(200, ['success' => false, 'message' => 'Error al crear el usuario']);
        }

        $insertAddress = $this->creditModel->createAddress($datas['address'], $insertUser['id']);
        if(!$insertAddress){
            return $this->utils->jsonResponse(200, ['success' => false, 'message' => 'Error al crear la dirección']);
        }
        return $this->utils->jsonResponse(200, ['success' => true, 'message' => 'Dirección creada correctamente']);
    }
}