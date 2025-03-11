import { DashboardLayout } from '@/pages/DashboardLayout'
import { Login } from '@/pages/Login'
import { Creditos } from '@/pages/Creditos'
import { Route, Routes } from 'react-router-dom'
import { ControlPage } from '@/pages/ControlPage'
import { IncomeAndExpenses } from '@/pages/IncomeAndExpenses'
import { Business } from '@/pages/Business'
import { Users } from '@/pages/Users'
import { ManagementCredit } from '@/pages/ManagementCredit'
import { Cobranza } from '@/pages/Cobranza'
export const RouterPrincipal = () => {
  return (
    <Routes>
      <Route path="/" element={<Login />} />

      <Route path="/dashboard" element={<DashboardLayout />}>
        <Route index element={<Creditos />} />
        <Route path="control" element={<ControlPage />} />
        <Route path="ingresos-y-egresos" element={<IncomeAndExpenses />} />
        <Route path="creditos" element={<Creditos />} />
        <Route path="empresa" element={<Business />} />
        <Route path="usuarios" element={<Users />} />
        <Route path="management-credit" element={<ManagementCredit />} />
        <Route path="cobranza" element={<Cobranza />} />
      </Route>

    </Routes>
  )
}
