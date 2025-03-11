import { Separator } from '@/components/ui/separator'
import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbPage, BreadcrumbSeparator } from '@/components/ui/breadcrumb';
import { SidebarTrigger } from '@/components/ui/sidebar'
import { useLocation } from 'react-router-dom';
import React from 'react';
export const HeaderLayout = () => {
    const location = useLocation();
    
    const breadcrumbMap: { [key: string]: string } = {
        '/dashboard': 'Créditos',
        '/dashboard/control': 'Control',
        '/dashboard/ingresos-y-egresos': 'Ingresos y Egresos',
        '/dashboard/creditos': 'Créditos',
        '/dashboard/empresa': 'Empresa',
        '/dashboard/usuarios': 'Usuarios',
        '/dashboard/management-credit': 'Gestión de Créditos',
        '/dashboard/cobranza': 'Cobranza',
    };

    // Obtiene las partes de la ruta y construye rutas completas para el breadcrumb
    const paths = location.pathname.split('/').filter(Boolean);
    const breadcrumbs = paths.map((_, index) => {
        const path = `/${paths.slice(0, index + 1).join('/')}`;
        return {
            path,
            label: breadcrumbMap[path] || path.replace('/', ''), // Si no está en el mapa, usa el nombre de la ruta
        };
    });

    return (
        <header className="flex h-16 shrink-0 items-center gap-2 border-b px-4">
            <SidebarTrigger className="-ml-1" />
            <Separator orientation="vertical" className="mr-2 h-4" />
            <Breadcrumb>
                <BreadcrumbList>
                    <BreadcrumbItem className="hidden md:block">
                        <BreadcrumbLink href="/dashboard">Dashboard</BreadcrumbLink>
                    </BreadcrumbItem>
                    {breadcrumbs.map((crumb, index) => (
                        <React.Fragment key={crumb.path}>
                            <BreadcrumbSeparator className="hidden md:block" />
                            <BreadcrumbItem>
                                {index === breadcrumbs.length - 1 ? (
                                    <BreadcrumbPage>{crumb.label}</BreadcrumbPage>
                                ) : (
                                    <BreadcrumbLink href={crumb.path}>{crumb.label}</BreadcrumbLink>
                                )}
                            </BreadcrumbItem>
                        </React.Fragment>
                    ))}
                </BreadcrumbList>
            </Breadcrumb>
        </header>
    );
};
