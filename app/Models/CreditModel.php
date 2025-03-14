<?php
require_once './config/Utils.php';
class CreditModel
{
    private $db;
    private $utils;
    public function __construct($db)
    {
        $this->db = $db;
        $this->utils = new Utils();
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
    public function createUserCredit($data, $ocupationid, $statusOcupation)
    {
        try {
            $statusOcupation = $statusOcupation == true ? $data['occupation_id'] : $ocupationid;

            $query = "INSERT INTO credit_user (dni, name, lastname, birthday, civil_state, occupation_id, phone, document, gender, persontype, asesor_id, credit_portfolio_id) VALUES (:userdni, :username, :userlastname, :userbirthday, :usercivil_state, :useroccupation_id, :userphone, :userdocument, :gender, :persontype, :asesor_id, :credit_portfolio_id)";

            $stmt = $this->db->prepare($query);
            $stmt->bindParam(':userdni', $data['dni']);
            $stmt->bindParam(':username', $data['name']);
            $stmt->bindParam(':userlastname', $data['lastname']);
            $stmt->bindParam(':userbirthday', $data['birthday']);
            $stmt->bindParam(':usercivil_state', $data['civil_state']);
            $stmt->bindParam(':useroccupation_id', $statusOcupation);
            $stmt->bindParam(':userphone', $data['phone']);
            $stmt->bindParam(':userdocument', $data['document']);
            $stmt->bindParam(':gender', $data['gender']);
            $stmt->bindParam(':persontype', $data['persontype']);
            $stmt->bindParam(':asesor_id', $data['asesor_id']);
            $stmt->bindParam(':credit_portfolio_id', $data['credit_portfolio']);
            $stmt->execute();
            if (!$stmt) {
                return [
                    'status' => false,
                    'message' => 'Error al crear el usuario'
                ];
            }
            return [
                'status' => true,
                'message' => 'Usuario creado correctamente',
                'id' => $this->db->lastInsertId()
            ];
        } catch (\Throwable $th) {
            return [
                'status' => false,
                'message' => 'Error al crear el usuario',
                'error' => $th->getMessage()
            ];
        }
    }
    public function createAddress($data, $id)
    {
        $latitude = (!empty($data['latitud']) && is_numeric($data['latitud'])) ? (float)$data['latitud'] : 0.0;

        $query = "INSERT INTO address_credit_user (user_id, condicion, tipo, principal, depatamento_id, provincia_id, distrito_id, direccion, denominacion ,latitud) VALUES (:user_id, :condicion, :tipo, :principal, :departament_id, :provincia_id, :distrito_id, :direccion, :denominacion, :latitud)";
        $stmt = $this->db->prepare($query);

        $stmt->bindParam(':user_id', $id);
        $stmt->bindParam(':condicion', $data['condicion']);
        $stmt->bindParam(':tipo', $data['tipo']);
        $stmt->bindParam(':principal', $data['principal']);
        $stmt->bindParam(':departament_id', $data['depatamento_id']);
        $stmt->bindParam(':provincia_id', $data['provincia_id']);
        $stmt->bindParam(':distrito_id', $data['distrito_id']);
        $stmt->bindParam(':direccion', $data['direccion']);
        $stmt->bindParam(':denominacion', $data['denominacion']);
        $stmt->bindParam(':latitud', $latitude, PDO::PARAM_NULL); // Especificar que puede ser NULl
        $stmt->execute();
        return $this->db->lastInsertId();
    }
    public function getInterestRate()
    {
        $query = "SELECT * FROM tbInterest WHERE status = 1";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Verificar si hay datos antes de acceder a $result[0]
        if (!empty($result)) {
            $interestRate = $result[0]['interest_rate'] ?? 0.08;

            // SOLO SE COBRA EN EL PPRIMER CRÉDITO SI TIENE MAS PRESTAMOS SOLO 1
            $adminFee = $result[0]['admin_fee'] ?? 0.01;
            $riskFee = $result[0]['risk_fee'] ?? 0.01;
        } else {
            // Si no hay datos, usar valores por defecto
            $interestRate = floatval(0.08);
            $adminFee = 0.01;
            $riskFee = 0.01;
        }

        return [
            'interestRate' => floatval($interestRate),
            'adminFee' => floatval($adminFee),
            'riskFee' => floatval($riskFee)
        ];
    }
    public function getTypePayment($modalidad = 1)
    {
        $query = "SELECT * FROM tipoPago where id = ?   ";
        $stmt = $this->db->prepare($query);
        $stmt->execute([$modalidad]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    //calcular interés total --- creo que hay un error
    public function calculateTotalInterest($amount, $interestRate, $days)
    {
        $dailyInterest = ($amount * $interestRate) / 30; // Interés diario basado en 30 días
        $totalInterest = $dailyInterest * $days;
        return $totalInterest;
    }
    //calculo total a pago 
    public function calculateTotalPayable($amount, $totalInterest)
    {
        $totalPayable = $amount + $totalInterest;
        return $totalPayable;
    }
    //calcular tramites admin. solo por el primer préstamo
    public function calculateAdminFee($amount, $adminFee)
    {
        $adminFee = $amount * $adminFee;
        return $adminFee;
    }
    //calcular central de riesgo
    public function calculateRiskFee($amount = 500, $riskFee = 0.01)
    {
        $riskFee = $amount * $riskFee;
        return $riskFee;
    }
    //fecha actual
    public function dateFetch()
    {
        date_default_timezone_set('America/Bogota');
        return date('d-m-Y');
    }

    public function getToday()
    {
        $nowMoment = $this->utils->dateFetch();
        return $nowMoment;
    }
    public function getDayOfWeek()
    {
        $sql = "SELECT * FROM daysExcluded";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function insertPrestamo($data) {}
    public function calculatePaymentAmount($data)
    {
        // Valores de ejemplo para pruebas

        /**
         * NECESITAMOS LOS SIGUIENTES DATOS: 
         * client_id: id del cliente
         * user_id: id del asesor
         * date_prestamo: fecha del préstamo
         * payment_start_date: fecha de inicio de pago
         * payment_end_date: fecha de fin de pago
         * payment_type: tipo de pago
         * simulation_amount: monto de simulación
         * payment_amount: monto de pago
         * payment_term: plazo de pago
         * payment_interest_rate: tasa de interés
         * payment_admin_fee: comisión administrativa
         * 
         *  $data['tipoPago'] = 1;
         $data['totalDays'] = 30;
         $data['amount'] = 540;
         DATA ----- NO SE QUE ESTOY HACIENDO ACÁ PERO FUNCIONA ASI QUE NO LO VUELVO A TOCAR : P
         */

        
        $data = [
            'idperiodopagos' => $data['tipoPago'], // Pago semanal
            'montoTotaldePago' => $data['amount'], // Monto de 580
            'term' => $data['totalDays'] // 30 días
        ];
        $activeDays = $this->getDayOfWeek();
        $amount =$data['montoTotaldePago']; // Monto por defecto 500
        $term = $data['term']; // Plazo por defecto 30 días

        $tipoPago = $data['idperiodopagos']; // Tipo pago por defecto diario

        // Obtener la fecha actual y sumar un día para empezar mañana
        $todayStr = $this->getToday();
        $startDate = DateTime::createFromFormat('d-m-Y', $todayStr);
        $startDate->modify('+1 day'); // Empezar al día siguiente

        if (!$startDate) {
            $startDate = new DateTime();
            $startDate->modify('+1 day');
        }

        $endDate = clone $startDate;
        $endDate->modify("+{$term} days");

        $totalPayments = 0;
        $paymentDates = [];

        // Crear array de días activos
        $activeDaysMap = [];
        foreach ($activeDays as $day) {
            // Convertir nombre del día a número (Sunday = 1 -> 0, Monday = 2 -> 1, etc)
            $dayNumber = $day['id'] - 1;
            $activeDaysMap[$dayNumber] = $day['status'] == 1;
        }

        switch ($tipoPago) {
            case 1: // Diario
                $currentDate = clone $startDate;
                $daysCount = 0;

                while ($daysCount < $term) {
                    $dayOfWeek = intval($currentDate->format('w'));
                    // Verificar si el día está activo según la tabla daysExcluded
                    if (isset($activeDaysMap[$dayOfWeek]) && $activeDaysMap[$dayOfWeek]) {
                        $paymentDates[] = clone $currentDate;
                        $totalPayments++;
                    }
                    $currentDate->modify('+1 day');
                    $daysCount++;
                }
                break;

            case 2: // Semanal
                $totalPayments = ceil($term / 7);
                for ($i = 0; $i < $totalPayments; $i++) {
                    $currentDate = clone $startDate;
                    $currentDate->modify("+" . ($i * 7) . " days");
                    $dayOfWeek = intval($currentDate->format('w'));
                    if (isset($activeDaysMap[$dayOfWeek]) && $activeDaysMap[$dayOfWeek]) {
                        $paymentDates[] = $currentDate;
                    }
                }
                break;

            case 3: // Mensual
                $totalPayments = ceil($term / 30);

                for ($i = 0; $i < $totalPayments; $i++) {
                    $currentDate = clone $startDate;
                    $currentDate->modify("+" . ($i) . " month");
                    $dayOfWeek = intval($currentDate->format('w'));
                    if (isset($activeDaysMap[$dayOfWeek]) && $activeDaysMap[$dayOfWeek]) {
                        $paymentDates[] = $currentDate;
                    }
                }
                break;

            default:
                throw new Exception("Tipo de pago no válido");
        }

        // Calcular cuota regular redondeada a 2 decimales usando number_format
        $regularPaymentAmount = number_format($amount / $totalPayments, 2, '.', '');

        // Calcular la suma de todas las cuotas regulares
        $totalRegularPayments = $regularPaymentAmount * ($totalPayments - 1);

        // Calcular la última cuota ajustada para que la suma sea exactamente igual al monto total
        $lastPaymentAmount = number_format($amount - $totalRegularPayments, 2, '.', '');

        // Crear array de montos de pago
        $paymentAmounts = array_fill(0, $totalPayments - 1, $regularPaymentAmount);
        $paymentAmounts[] = $lastPaymentAmount;

        // Formatear fechas para el retorno
        $formattedDates = [];
        $paymentSchedule = [];
        foreach ($paymentDates as $index => $date) {
            $formattedDate = $date->format('d-m-Y');
            $formattedDates[] = $formattedDate;

            // Crear el calendario de pagos con montos
            $paymentSchedule[] = [
                'date' => DateTime::createFromFormat('d-m-Y', $formattedDate)->format('Y-m-d'),
                'montodePago' => floatval($regularPaymentAmount)
            ];
        }

        return [
            'date' => $todayStr,
            'start_date' => $startDate->format('d-m-Y'),
            'end_date' => $endDate->format('d-m-Y'),
            'simulation_amount' => $amount,
            'payment_type' => $tipoPago,
            'total_amount_verification' => number_format(array_sum($paymentAmounts), 2, '.', ''),
            'payment_amount' => floatval($regularPaymentAmount),
            'last_payment_amount' => floatval($lastPaymentAmount),
            'total_payments' => $totalPayments,
            'payment_dates' => $formattedDates,
            'payment_schedule' => $paymentSchedule
        ];
    }
    //insertamos el calendario de pagos
    public function createPaymentSchedule($payments, $creditId, $clientId)
    {
        try {
            $query = "INSERT INTO payment_schedule (credit_client_id, scheduled_date, scheduled_amount, paid_amount, status, client_id, id_prestamo) 
                      VALUES (:credit_client_id, :scheduled_date, :scheduled_amount, :paid_amount, :status, :client_id, :id_prestamo)";

            $stmt = $this->db->prepare($query);

            foreach ($payments as $payment) {
                $stmt->bindParam(':credit_client_id', $creditId);
                $stmt->bindParam(':scheduled_date', $payment['date']);
                $stmt->bindParam(':scheduled_amount', $payment['montodePago']);
                $stmt->bindParam(':paid_amount', $payment['montodePago']);
                $stmt->bindValue(':status', 'pendiente'); // Estado inicial del pago
                $stmt->bindParam(':client_id', $clientId);
                $stmt->bindParam(':id_prestamo', $creditId);
                $stmt->execute();
            }

            return ['status' => true, 'message' => 'Calendario de pagos creado correctamente', 'id' => $this->db->lastInsertId()];
        } catch (\Throwable $th) {
            return ['status' => false, 'message' => 'Error al crear el calendario de pagos', 'error' => $th->getMessage()];
        }
    }

    //insertamos el prestamo
    public function createPaymentRegister($data)
    {
        try {
            $query = "INSERT INTO payments_register_credit_client (client_credit_user, date_prestamo, payment_start_date, payment_end_date, total_amount, id_type_payment, total_amount_verification, current_payment_amount, last_payment_amount, total_payments, idEstadoPrestamo, tasaInteres, tramite_dministrativo, central_riesgo, totalDaysPago) VALUES (:userid, :date_prestamo, :payment_start_date, :payment_end_date, :total_amount, :id_type_payment, :total_amount_verification, :current_payment_amount, :last_payment_amount, :total_payments, :idEstadoPrestamo, :tasaInteres, :tramite_dministrativo, :central_riesgo, :totalDaysPago)";
            $stmt = $this->db->prepare($query);
            $stmt->bindParam(':userid', $data['client_credit_user']);
            $stmt->bindParam(':date_prestamo', $data['dia_prestamo']);
            $stmt->bindParam(':payment_start_date', $data['fecha_inicio_pago']);
            $stmt->bindParam(':payment_end_date', $data['fecha_fin_pago']);
            $stmt->bindParam(':total_amount', $data['monto_prestado']);
            $stmt->bindParam(':id_type_payment', $data['tipo_pago']);
            $stmt->bindParam(':total_amount_verification', $data['monto_prestado']);
            $stmt->bindParam(':current_payment_amount', $data['monto_pago_actual']);
            $stmt->bindParam(':last_payment_amount', $data['monto_pago_ultimo']);
            $stmt->bindParam(':total_payments', $data['total_pagos']);
            $stmt->bindParam(':idEstadoPrestamo', $data['idEstadoPrestamo']);
            $stmt->bindParam(':tasaInteres', $data['tasaInteres']);
            $stmt->bindParam(':tramite_dministrativo', $data['tramite_dministrativo']);
            $stmt->bindParam(':central_riesgo', $data['central_riesgo']);
            $stmt->bindParam(':totalDaysPago', $data['totalDaysPago']);
            $stmt->execute();
            if (!$stmt) {
                return ['status' => false, 'message' => 'Error al crear el prestamo'];
            }
            return ['status' => true, 'message' => 'Prestamo creado correctamente', 'id' => $this->db->lastInsertId()];
        } catch (\Throwable $th) {
            return ['status' => false, 'message' => 'Error al crear el prestamo', 'error' => $th->getMessage()];
        }
    }
    public function createLoan($data, $id)
    {
        $diasPago = $data['totalDays'];
        $tipoPago = $data['tipoPago'];
        $montoPrestado = $data['amount'];

        $tasaInteres = $this->getInterestRate()['interestRate'];
        $tasaAdministrativa = $this->getInterestRate()['adminFee'];
        $tasaRiesgo = $this->getInterestRate()['riskFee'];

        $soloInteres = $this->calculateTotalInterest($montoPrestado, $tasaInteres, $diasPago);

        $totalPago = $this->calculateTotalPayable($montoPrestado, $soloInteres);

        $data['amount'] = $totalPago;
        $data['monto_prestado'] = $totalPago;
        
       $pretamoARelizar = $this->calculatePaymentAmount($data);

        //insertamos el prestamo

        $params = [
            'client_credit_user' => $id, //id del usuario que recibe prestamo --- joder que dificil es esto
            'dia_prestamo' => DateTime::createFromFormat('d-m-Y', $pretamoARelizar['date'])->format('Y-m-d'),
            'fecha_inicio_pago' => DateTime::createFromFormat('d-m-Y', $pretamoARelizar['start_date'])->format('Y-m-d'),
            'fecha_fin_pago' => DateTime::createFromFormat('d-m-Y', $pretamoARelizar['end_date'])->format('Y-m-d'),
            'monto_prestado' => $pretamoARelizar['simulation_amount'],
        
            'tipo_pago' => $pretamoARelizar['payment_type'],
            'monto_total_verificacion' => $pretamoARelizar['simulation_amount'],
        
            'monto_pago_actual' => $pretamoARelizar['payment_amount'],
        
            'monto_pago_ultimo' => $pretamoARelizar['last_payment_amount'],
            'total_pagos' => $pretamoARelizar['total_payments'],
        
            'idEstadoPrestamo' => $data['status'],
            'tasaInteres' => $tasaInteres,
            //considerar que esto debe de venir del controller
            'tramite_dministrativo' => $tasaAdministrativa,
            'central_riesgo' => $tasaRiesgo,
            'totalDaysPago' => $diasPago,
        
        ];
        $crearPrestamo = $this->createPaymentRegister($params, $id);
      
        //if (!$crearPrestamo) {
        //    return ['status' => false, 'message' => 'Error al crear el prestamo'];
        //}
        //insertamos el calendario de pagos
        /**
         * 
         */
        if(!$crearPrestamo['status']){
            return ['status' => false, 'message' => 'Error al crear el prestamo'];
        }
        $crearCalendario = $this->createPaymentSchedule($pretamoARelizar['payment_schedule'], $crearPrestamo['id'], $id);
        if (!$crearCalendario) {
            return ['status' => false, 'message' => 'Error al crear el calendario de pagos'];
        }
        
        return ['status' => true, 'message' => 'Prestamo creado correctamente'];
    }
}
