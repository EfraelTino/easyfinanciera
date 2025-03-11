import { BanknoteIcon, Check, ChevronDown, ChevronsUpDown, ChevronUp, CreditCard, Landmark, LayoutPanelLeft, LogOut, Package2, Scale, User, User2, Users, Wallet } from "lucide-react";
import {
    Sidebar,
    SidebarContent,
    SidebarFooter,
    SidebarGroup,
    SidebarGroupContent,
    SidebarGroupLabel,
    SidebarHeader,
    SidebarMenu,
    SidebarMenuButton,
    SidebarMenuItem,
    SidebarMenuSub,
    SidebarMenuSubItem,
} from "@/components/ui/sidebar";
import { DropdownMenu, DropdownMenuTrigger, DropdownMenuContent, DropdownMenuItem } from "@/components/ui/dropdown-menu";
import { Collapsible, CollapsibleContent, CollapsibleTrigger } from "./collapsible";
import React from "react";
import { useAuth } from "@/store/auth";
import { SidebarMenuLink } from "../SidebarMenuLink";

export function AppSidebar() {
    const [selectedVersion, setSelectedVersion] = React.useState('')
    const { user } = useAuth();
    console.log(typeof user?.typeuser)
    const userType = parseInt(user?.typeuser || "0")
    const isAdmin: number = userType === 1 ? 1 : 0
    const isUser: number = userType === 0 ? 0 : 0
    const isSuperAdmin: number = userType === 2 ? 2 : 0


    const versions = ["1.0.1", "1.1.0-alpha", "2.0.0-beta1"]

    return (
        <Sidebar >
            <SidebarContent>
                <SidebarGroup>
                    <SidebarGroupLabel>Application</SidebarGroupLabel>
                    <SidebarHeader>
                        <SidebarMenu>
                            <SidebarMenuItem>
                                <DropdownMenu>
                                    <DropdownMenuTrigger asChild>
                                        <SidebarMenuButton
                                            size="lg"
                                            className="data-[state=open]:bg-sidebar-accent data-[state=open]:text-sidebar-accent-foreground"
                                        >
                                            <div className="flex aspect-square size-8 items-center justify-center rounded-full bg-primary  text-primary-foreground">
                                                <User className="size-4" />
                                            </div>
                                            <div className="flex flex-col gap-0.5 leading-none">
                                                <span className="truncate text-sm font-medium leading-5 text-neutral-900">{`${user?.name} ${user?.lastname}`}</span>
                                                <span className="truncate text-xs capitalize leading-tight text-neutral-500">Financiera</span>
                                            </div>
                                            <ChevronsUpDown className="ml-auto" />
                                        </SidebarMenuButton>
                                    </DropdownMenuTrigger>
                                    <DropdownMenuContent className="w-[--radix-dropdown-menu-trigger-width]" align="start">
                                        {versions.map((version) => (
                                            <DropdownMenuItem key={version} onSelect={() => setSelectedVersion(version)}>
                                                v{version} {version === selectedVersion && <Check className="ml-auto" />}
                                            </DropdownMenuItem>
                                        ))}
                                    </DropdownMenuContent>
                                </DropdownMenu>
                            </SidebarMenuItem>
                        </SidebarMenu>
                    </SidebarHeader>
                    <SidebarGroupContent>
                        <SidebarMenu>
                            <Collapsible defaultOpen className="group/collapsible">
                                <SidebarMenuItem>
                                    <CollapsibleTrigger asChild>
                                        <SidebarMenuButton>
                                            <Package2 /> <span>Caja</span>   <ChevronDown className="ml-auto transition-transform group-data-[state=open]/collapsible:rotate-180" />
                                        </SidebarMenuButton>
                                    </CollapsibleTrigger>
                                    <CollapsibleContent>
                                        <SidebarMenuSub>
                                            <SidebarMenuSubItem>
                                                <SidebarMenuLink to="ingresos-y-egresos" icon={BanknoteIcon}>Ingresos y egresos (ADMIN)</SidebarMenuLink>
                                                <SidebarMenuLink to="control" icon={Scale}>Control</SidebarMenuLink>
                                            </SidebarMenuSubItem>
                                        </SidebarMenuSub>
                                    </CollapsibleContent>
                                </SidebarMenuItem>
                            </Collapsible>
                        </SidebarMenu>
                        <SidebarMenu>
                            <SidebarMenuItem>
                                <Collapsible defaultOpen className="group/collapsible">
                                    <SidebarMenuItem>
                                        <CollapsibleTrigger asChild>
                                            <SidebarMenuButton>
                                                <CreditCard /> <span>Crédicto</span>   <ChevronDown className="ml-auto transition-transform group-data-[state=open]/collapsible:rotate-180" />
                                            </SidebarMenuButton>
                                        </CollapsibleTrigger>
                                        <CollapsibleContent>
                                            <SidebarMenuSub>
                                                <SidebarMenuSubItem>
                                                    <SidebarMenuLink to="management-credit" icon={LayoutPanelLeft}>Administrar</SidebarMenuLink>
                                                    <SidebarMenuLink to="cobranza" icon={Wallet}>Cobranza</SidebarMenuLink>
                                                </SidebarMenuSubItem>
                                            </SidebarMenuSub>
                                        </CollapsibleContent>
                                    </SidebarMenuItem>
                                </Collapsible>
                                {
                                    isAdmin === 1 && (
                                        <>
                                            <SidebarMenuLink to="empresa" icon={Landmark}>Empresa</SidebarMenuLink>

                                            <SidebarMenuLink to="usuarios" icon={Users}>Usuarios</SidebarMenuLink>
                                        </>
                                    )
                                }
                            </SidebarMenuItem>

                        </SidebarMenu>
                    </SidebarGroupContent>
                </SidebarGroup>
            </SidebarContent>
            <SidebarFooter className="border-t border-sidebar-border">
                <SidebarMenu className="bg-white">
                    <SidebarMenuItem className="bg-white">
                        <DropdownMenu>
                            <DropdownMenuTrigger className="w-full justify-between border bg-white" asChild>
                                <SidebarMenuButton className="w-full justify-between border">
                                    <User2 /> {user?.name} {user?.lastname}
                                    <ChevronUp className="ml-auto" />
                                </SidebarMenuButton>
                            </DropdownMenuTrigger>
                            <DropdownMenuContent side="top" className="w-[--radix-popper-anchor-width]">
                                <DropdownMenuItem>
                                    <div><p className="truncate text-sm font-medium text-neutral-900">
                                        {user?.name} {user?.lastname}
                                    </p><p className="truncate text-sm text-neutral-500">{user?.email}</p></div>
                                </DropdownMenuItem>
                                <DropdownMenuItem>
                                    <LogOut /> <span>Salir</span>
                                </DropdownMenuItem>
                            </DropdownMenuContent>
                        </DropdownMenu>
                    </SidebarMenuItem>
                </SidebarMenu>
            </SidebarFooter>
        </Sidebar>
    );
}
