import { useState } from "react"
import { format } from "date-fns"
import { es } from "date-fns/locale"
import { CalendarIcon } from "lucide-react"

import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"
import { Calendar } from "@/components/ui/calendar"
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover"

export function Test({ onSelect, className }: { onSelect: (date: Date) => void, className: string }) {
  const [selectedDate, setSelectedDate] = useState(new Date()) // Fecha predeterminada: Hoy

  const handleSelect = (date: Date | undefined) => {
    if (date) {
      setSelectedDate(date)
      onSelect(date) // Enviar la fecha al formulario padre
    }
  }

  return (
    <div className={`${className}`}>
      <Popover >
        <PopoverTrigger className={`w-full`} asChild>
          <Button
            variant="outline"
            className={cn(
              `w-full`,
              !selectedDate && "text-muted-foreground"
            )}
          >
            {selectedDate ? format(selectedDate, "PPP", { locale: es }) : "Selecciona una fecha"}
            <CalendarIcon className="ml-auto h-4 w-4 opacity-50" />
          </Button>
        </PopoverTrigger>
        <PopoverContent className="w-auto p-0" align="start">
          <Calendar
            mode="single"
            locale={es}
            selected={selectedDate}
            onSelect={handleSelect}
            disabled={(date) => date > new Date() || date < new Date("1900-01-01")}
            initialFocus
          />
        </PopoverContent>
      </Popover>
    </div>
  )
}
