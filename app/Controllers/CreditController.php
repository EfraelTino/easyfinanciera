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
    public function getInterestRate()
    {
        /*
        $search = $this->creditModel->calculatePaymentAmount();
        if (!$search) {
            return $this->utils->jsonResponse(200, ['success' => false, 'message' => 'No se encontraron datos']);
        }
        return $this->utils->jsonResponse(200, ['success' => true, 'message' => $search]);
         */

    }
    public function createCredit($request)
    {
        $data = $request['body'];
        $userById = $this->userModel->findUserIdActive($data['userdata']['asesor_id']);
        if (!$userById) {
            return  $this->utils->jsonResponse(200, ['success' => false, 'message' => 'Asesor no encontrado']);
        }
        $searchOccupation = $this->creditModel->findOccupation($data['userdata']['occupation_id']);
        if (!$searchOccupation) {
            if (!$data['userdata']['occupationname']) {
                return $this->utils->jsonResponse(200, ['success' => false, 'message' => 'Ingresa la ocupación']);
            }
            $createdOccupationId = $this->creditModel->createOccupation($data['userdata']['occupationname']);
            if (!$createdOccupationId) {
                return $this->utils->jsonResponse(200, ['success' => false, 'message' => 'Error al crear la ocupación' . $createdOccupationId]);
            }
            return $this->utils->jsonResponse(200, ['success' => true, 'message' => 'Ocupación creada correctamente' . $createdOccupationId]);
            // enviar false la ocupation 
            $insertUser = $this->createUserCredit($data, $createdOccupationId, false);
            //esto retorna el id $insertUser['id']
        }
        $insertUser = $this->createUserCredit($data, $searchOccupation['id'], true);
            //esto retorna el id $insertUser['id']

        if (!$insertUser) {
            return $this->utils->jsonResponse(200, ['success' => false, 'message' => 'Error al crear el usuario']);
        }
        return $this->utils->jsonResponse(200, ['success' => true, 'message' => $insertUser]);
        /**
         * FIRST - CREATE CREDIT AND RETURN CLIENT ID TABLE credit_user
         * SECOND - INSERT ADDRESS OF CLIENT TYPE ARRAY table address_credit_user
         * THIRD - INSERT DATA OF LOANS WITH CLIENT ID table loans
         * PENDING - VERIFY IF A USER EXIST AND RETURN USER DATA, IF YOU HAVE CREDIT PENDING OR MORA
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
    public function createUserCredit($datas, $ocupationid, $statusOcupation)
    {

        $insertuser = $this->creditModel->createUserCredit($datas['userdata'], $ocupationid, $statusOcupation);
        if(!$insertuser){
            return $this->utils->jsonResponse(200, ['success' => false, 'message' => 'Error al crear el usuario']);
        }

        foreach ($datas['address'] as $address) {
            $insertAddress = $this->creditModel->createAddress($address, $insertuser['id']);
            if (!$insertAddress) {
                return $this->utils->jsonResponse(200, ['success' => false, 'message' => 'Error al crear la dirección'. $insertAddress]);
            }
        }

    $insertLoan = $this->creditModel->createLoan($datas['userdata'], $insertuser['id']);
    if(!$insertLoan['status']){
        return $this->utils->jsonResponse(200, ['success' => false, 'message' => 'Error al crear el prestamo']);
    }
        return $this->utils->jsonResponse(200, ['success' => true, 'message' => $insertLoan['message']]);  
    }
}
