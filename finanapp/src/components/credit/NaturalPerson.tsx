import { Tabs, TabsList } from "@/components/ui/tabs";
import { Button } from "@/components/ui/button";
import { useEffect, useState } from "react";
import { useForm } from "react-hook-form";
import { CreditCard, User } from "lucide-react";
import { Input } from "@/components/ui/input";
import { Card } from "../ui/card";
import { Label } from "../ui/label";
import { Test } from "./Test";
import { getDatas } from "@/api/api";
import {
    Select,
    SelectContent,
    SelectGroup,
    SelectItem,
    SelectLabel,
    SelectTrigger,
    SelectValue,
} from "../ui/select"
const steps = ["step1", "step2", "step3", "step4"];
const stepLabels = ["Información", "Cliente", "Crédito", "Resumen"];
const stepIcons = [<User />, <CreditCard />, <CreditCard />, <CreditCard />];

export const NaturalPerson = () => {
    const [currentStep, setCurrentStep] = useState(steps[0]);

    // Estado global para almacenar los datos del formulario
    const [formData, setFormData] = useState({
        nombres: "",
        tarjeta: "",
        apellidos: "",
        expiracion: "",
        dni: "",
        cvv: "",
        fechanacimiento: new Date() // Inicializar con hoy
    });
    const [occupations, setOccupations] = useState([]);
    // Manejador de formularios
    const { register, handleSubmit, formState: { errors }, trigger, getValues } = useForm({
        mode: "onChange"
    });

    const nextStep = async () => {
        const currentIndex = steps.indexOf(currentStep);
        if (currentIndex < steps.length - 1) {
            const stepFields = getStepFields(currentStep);
            const isValid = await trigger(stepFields);
            if (isValid) {
                setCurrentStep(steps[currentIndex + 1]);
            }
        }
    };
    useEffect(() => {
        const fetchOccupations = async () => {
            const response = await getDatas('occupations');
            if(response.success){
                setOccupations(response.message)
            }
            console.log(response)
        };
        fetchOccupations();
    }, []);

    const prevStep = () => {
        const currentIndex = steps.indexOf(currentStep);
        if (currentIndex > 0) {
            setCurrentStep(steps[currentIndex - 1]);
        }
    };

    const onSubmit = (data: any) => {
        console.log("Datos finales del formulario:", { ...formData, ...data });
    };


    // Función para determinar los campos de cada paso
    const getStepFields = (step: string) => {
        switch (step) {
            case "step1": return ["nombres", "apellidos", "dni", "celular", "fechanacimiento", "estado_civil", "sexo", "ocupacion", "telefono"];
            case "step2": return ["tarjeta"];
            case "step3": return ["expiracion"];
            case "step4": return ["cvv"];
            default: return [];
        }
    };
    return (
        <Card className=" p-4 border">
            <Tabs value={currentStep} onValueChange={() => { }} className="w-full">
                <TabsList className="w-full h-auto bg-none p-0">
                    {/* En móviles: Mostrar solo el icono y el nombre del paso actual */}
                    <div className="flex w-full justify-center items-center gap-2 sm:hidden">
                        <span className="text-3xl">{stepIcons[steps.indexOf(currentStep)]}</span>
                        <p className="text-lg font-medium">{stepLabels[steps.indexOf(currentStep)]}</p>
                    </div>

                    {/* En pantallas grandes: Mantener el estilo actual */}
                    <div className="hidden relative bg-white sm:grid w-full grid-cols-4">
                        {steps.map((step, index) => (
                            <div key={step} className="flex flex-col items-center">
                                <span
                                    className={`text-3xl border border-gray-200 text-gray-500 rounded-full p-2 ${currentStep === step ? 'border !border-primary shadow text-white bg-primary' : 'bg-gray-200'
                                        }`}
                                >
                                    {stepIcons[index]}
                                </span>
                                {stepLabels[index]}
                            </div>
                        ))}
                    </div>
                </TabsList>

                {/* Contenido de los pasos con Formularios */}
                <form onSubmit={handleSubmit(onSubmit)} className=" my-2">
                    {currentStep === "step1" && (
                        <div className="space-y-2">
                            <>
                                <div className="grid grid-cols-5 items-center gap-5">
                                    <Label htmlFor="username" className="text-left">
                                        DNI<span className="text-red-500 text-sm">*</span>
                                    </Label>
                                    <Input type="number"
                                        {...register("dni", { required: "Este campo es obligatorio" })}
                                        defaultValue={formData.dni}
                                        onChange={(e) => setFormData({ ...formData, dni: e.target.value })} className="col-span-4" />
                                </div>
                                {errors.dni && <span className="text-red-500 text-sm">{errors.dni.message}</span>}
                            </>
                            <>
                                <div className="grid grid-cols-5 items-center gap-5">
                                    <Label htmlFor="username" className="text-left">
                                        Nombres<span className="text-red-500 text-sm">*</span>
                                    </Label>
                                    <Input type="text"
                                        {...register("nombres", { required: "Este campo es obligatorio" })}
                                        defaultValue={formData.nombres}
                                        onChange={(e) => setFormData({ ...formData, nombres: e.target.value })} className="col-span-4" />
                                </div>
                                {errors.nombres && <span className="text-red-500 text-sm">{errors.nombres.message}</span>}
                            </>
                            <>
                                <div className="grid grid-cols-5 items-center gap-5">
                                    <Label htmlFor="username" className="text-left">
                                        Apellidos<span className="text-red-500 text-sm">*</span>
                                    </Label>
                                    <Input type="text"
                                        {...register("apellidos", { required: "Este campo es obligatorio" })}
                                        defaultValue={formData.apellidos}
                                        onChange={(e) => setFormData({ ...formData, apellidos: e.target.value })} className="col-span-4" />
                                </div>
                                {errors.apellidos && <span className="text-red-500 text-sm">{errors.apellidos.message}</span>}
                            </>

                            <>
                                <div className="grid grid-cols-5 items-center gap-5">
                                    <Label htmlFor="username" className="text-left">
                                        Fehcha nac.<span className="text-red-500 text-sm">*</span>
                                    </Label>
                                    <Test className="col-span-4" onSelect={(date) => setFormData((prev) => ({ ...prev, fechanacimiento: date }))} />
                                </div>
                                { /**errors.apellidos && <spann className="text-red-500 text-sm">{errors.apellidos.message}</spann> */}
                            </>
                            <>
                                <div className="grid grid-cols-5 items-center gap-5">
                                    <Label htmlFor="username" className="text-left">
                                        Opcupación<span className="text-red-500 text-sm">*</span>
                                    </Label>
                                    <Select>
                                        <SelectTrigger className="col-span-4">
                                            <SelectValue placeholder="Selecciona una ocupación" />
                                        </SelectTrigger>
                                        <SelectContent>
                                            <SelectGroup>
                                                <SelectLabel>Selecciona una ocupación</SelectLabel>
                                                {
                                                    occupations.map((occupation: any) => (
                                                        <SelectItem key={occupation.id} value={occupation.id}>{occupation.nombreOccupation}</SelectItem>
                                                    ))
                                                }
                                            </SelectGroup>
                                        </SelectContent>
                                    </Select>
                                </div>
                                {errors.apellidos && <span className="text-red-500 text-sm">{errors.apellidos.message}</span>}
                            </>
                        </div>

                    )}

                    {currentStep === "step2" && (
                        <>
                            <label className="block">Número de tarjeta</label>
                            <Input
                                type="text"
                                {...register("tarjeta", { required: "Este campo es obligatorio", pattern: { value: /^\d{16}$/, message: "Debe tener 16 dígitos" } })}
                                defaultValue={formData.tarjeta}
                                onChange={(e) => setFormData({ ...formData, tarjeta: e.target.value })}
                            />
                            {errors.tarjeta && <p className="text-red-500">{errors.tarjeta.message}</p>}
                        </>
                    )}

                    {currentStep === "step3" && (
                        <>
                            <label className="block">Fecha de expiración</label>
                            <Input
                                type="month"
                                {...register("expiracion", { required: "Este campo es obligatorio" })}
                                defaultValue={formData.expiracion}
                                onChange={(e) => setFormData({ ...formData, expiracion: e.target.value })}
                            />
                            {errors.expiracion && <p className="text-red-500">{errors.expiracion.message}</p>}
                        </>
                    )}

                    {currentStep === "step4" && (
                        <>
                            <label className="block">Código de seguridad (CVV)</label>
                            <Input
                                type="text"
                                {...register("cvv", { required: "Este campo es obligatorio", pattern: { value: /^\d{3,4}$/, message: "Debe tener 3 o 4 dígitos" } })}
                                defaultValue={formData.cvv}
                                onChange={(e) => setFormData({ ...formData, cvv: e.target.value })}
                            />
                            {errors.cvv && <p className="text-red-500">{errors.cvv.message}</p>}
                        </>
                    )}

                    {/* Botones de navegación */}
                    <div className="flex justify-between mt-4">
                        <Button type="button" onClick={prevStep} disabled={currentStep === "step1"}>
                            Anterior
                        </Button>
                        {currentStep === "step4" ? (
                            <Button type="submit">Finalizar</Button>
                        ) : (
                            <Button type="button" onClick={nextStep}>
                                Siguiente
                            </Button>
                        )}
                    </div>
                </form>
            </Tabs>

        </Card>

    )
}
