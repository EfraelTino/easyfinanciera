import  { useState } from 'react'
import { Wallet, CreditCard, Building2 } from "lucide-react"
import { Link } from 'react-router-dom'

export const CajaControl = () => {
    const [activeId, setActiveId] = useState<string | null>(null)

    const options = [
        {
            id: "caja",
            label: "Caja",
            icon: Wallet,
            url: "https://example.com/caja",
        },
        {
            id: "credito",
            label: "Credito",
            icon: CreditCard,
            url: "https://example.com/credito",
        },
        {
            id: "empresa",
            label: "Empresa",
            icon: Building2,
            url: "https://example.com/empresa",
        },
    ]
    return (
        <div className="w-full max-w-2xl mx-auto p-4 min-h-screen grid items-center">
            <div className="flex flex-col sm:flex-row gap-4">
                {options.map((option) => {
                    const Icon = option.icon
                    return (
                        <Link
                            key={option.id}
                            to={option.url}
                            target="_blank"
                            rel="noopener noreferrer"
                            onClick={() => setActiveId(option.id)}
                            className={`flex-1 flex flex-col items-center gap-3 rounded-lg border-2 p-4 transition-all 
              hover:border-[#0044ff] hover:bg-[#0044ff]/5 
              ${activeId === option.id ? "border-[#0044ff] bg-[#0044ff]/5" : "border-gray-200"}
            `}
                        >
                            <Icon
                                className={`h-10 w-10 transition-colors ${activeId === option.id ? "text-[#0044ff]" : "text-gray-300"}`}
                            />
                            <span
                                className={`font-medium transition-colors ${activeId === option.id ? "text-[#0044ff]" : "text-gray-700"
                                    }`}
                            >
                                {option.label}
                            </span>
                        </Link>
                    )
                })}
            </div>
        </div>
    )
}
