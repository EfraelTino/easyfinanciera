import { Link, useLocation } from "react-router-dom";
import { SidebarMenuButton } from "./ui/sidebar";
import { ReactNode } from "react";

interface Props {
    children?: ReactNode;
    icon: React.ElementType;
    to: string;
}

export const SidebarMenuLink = ({ to, icon: Icon, children }: Props) => {
    const location = useLocation();
    const fullPath = `/dashboard/${to}`; // Asegura que la ruta sea absoluta

    // Compara correctamente para evitar que todas las subrutas se activen
    const isActive = location.pathname === fullPath ? "bg-blue-600 text-white hover:bg-primary hover:text-white transition" : "";


    return (
        <SidebarMenuButton asChild className={ `${`transition-all duration-300`} ${isActive}`}>
            <Link to={to}>
                <Icon className=""/>
                <span>{children}</span>
            </Link>
        </SidebarMenuButton>
    );
};
