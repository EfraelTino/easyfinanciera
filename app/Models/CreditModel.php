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
        $statusOcupation = $statusOcupation == true ? $data['occupation_id'] : $ocupationid;

        $query = "INSERT INTO credit_user (dni, name, lastname, birthday, civil_state, occupation_id, phone, document, gender, persontype, asesor_id) VALUES (:userdni, :username, :userlastname, :userbirthday, :usercivil_state, :useroccupation_id, :userphone, :userdocument, :gender, :persontype, :asesor_id)";

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
        $stmt->execute();
        return $this->db->lastInsertId();
    }
    public function createAddress($data, $id)
    {
        $latitude = (!empty($data['latitud']) && is_numeric($data['latitud'])) ? (float)$data['latitud'] : 0.0;

        $query = "INSERT INTO address_credit_user (user_id, condicion, tipo, principal, depatamento_id, provincia_id, distrito_id, direccion, denominacion, latitud) VALUES (:user_id, :condicion, :tipo, :principal, :departament_id, :provincia_id, :distrito_id, :direccion, :denominacion, :latitud)";
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
        $stmt->bindParam(':latitud', $latitude, PDO::PARAM_NULL); // Especificar que puede ser NULL
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
    public function calculateTotalInterest($amount = 500, $interestRate = 0.08, $days = 90)
    {
        $dailyInterest = ($amount * $interestRate) / 30; // Interés diario basado en 30 días
        $totalInterest = $dailyInterest * $days;
        return $totalInterest;
    }
    //calculo total a pago 
    public function calculateTotalPayable($amount = 500, $totalInterest = 40)
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
    public function calculatePaymentAmount($diasPago= 30, $tipoPago= 1, $montoTotal= 540)
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
         */
        $data = [
            'idperiodopagos' => $tipoPago, // Pago semanal
            'montoTotaldePago' => $montoTotal, // Monto de 580
            'term' => $diasPago, // 30 días
        ];
        $activeDays = $this->getDayOfWeek();
        $amount = isset($data['montoTotaldePago']) ? $data['montoTotaldePago'] : 500; // Monto por defecto 500
        $term = isset($data['term']) ? $data['term'] : 30; // Plazo por defecto 30 días

        $tipoPago = $this->getTypePayment(isset($data['idperiodopagos']) ? $data['idperiodopagos'] : 1); // Tipo pago por defecto diario

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

        switch ($tipoPago['id']) {
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
                'date' => $formattedDate,
                'montodePago' => floatval($regularPaymentAmount)
            ];
        }

        return [
            'date' => $todayStr,
            'start_date' => $startDate->format('d-m-Y'),
            'end_date' => $endDate->format('d-m-Y'),
            'simulation_amount' => $amount,
            'payment_type' => $tipoPago['id'],
            'total_amount_verification' => number_format(array_sum($paymentAmounts), 2, '.', ''),
            'payment_amount' => floatval($regularPaymentAmount),
            'last_payment_amount' => floatval($lastPaymentAmount),
            'total_payments' => $totalPayments,
            'payment_dates' => $formattedDates,
            'payment_schedule' => $paymentSchedule
        ];
    }

    public function createLoan($data, $id)
    {
        $diasPago = $data['totalDays'];
        $tipoPago = $data['tipoPago'];
        $montoPrestado = $data['amount'];

        $tasaInteres = $this->getInterestRate()['interestRate'];
        $tasaAdministrativa = $this->getInterestRate()['adminFee'];
        $tasaRiesgo = $this->getInterestRate()['riskFee'];
        
        $tramiteAdministrativo = $montoPrestado * $tasaAdministrativa;

        $montoTotal = $this->calculateTotalInterest($montoPrestado, $tasaInteres);

        $totalPago = $this->calculateTotalPayable($montoPrestado, $tasaInteres);

        $centralRiesgo = $tasaRiesgo == 0 ? $this->calculateRiskFee($montoPrestado, $tasaRiesgo) : $tasaRiesgo;

        $interesGenerado = $this->calculateTotalInterest($montoPrestado, $tasaInteres);

        $pretamoARelizar = $this->calculatePaymentAmount($diasPago, $tipoPago, $montoTotal);

        $query = "INSERT INTO loans (client_id, amount, interest_rate, total_interest, admin_fee, risk_fee, total_payable, term, start_date, end_date, status, credit_portfolio) VALUES (:user_id, :loan_type, :loan_amount, :loan_term, :loan_interest_rate)";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(':user_id', $id);
        $stmt->execute();
    }
}
