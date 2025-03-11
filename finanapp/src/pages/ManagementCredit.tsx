import React, { useEffect } from "react"

import {
    ColumnDef,
    ColumnFiltersState,
    SortingState,
    VisibilityState,
    flexRender,
    getCoreRowModel,
    getFilteredRowModel,
    getPaginationRowModel,
    getSortedRowModel,
    useReactTable,
} from "@tanstack/react-table"
import { ArrowUpDown, ChevronDown,  Pencil } from "lucide-react"

import { Button } from "@/components/ui/button"
import { Checkbox } from "@/components/ui/checkbox"
import {
    DropdownMenu,
    DropdownMenuCheckboxItem,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"
import { Input } from "@/components/ui/input"
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/components/ui/table"
import { Card } from "@/components/ui/card"
import { getDatas } from "@/api/api"
import { User } from "@/lib/types"
import { ModalAddUser } from "@/components/ModalAddUser"
import { ModalNewCredit, NewCredit } from "@/components/credit/ModalNewCredit"
import { FormAddCredit } from "@/components/credit/FormAddCredit"



export const columns: ColumnDef<User>[] = [
    {
        id: "select",
        header: ({ table }) => (
            <Checkbox
                checked={
                    table.getIsAllPageRowsSelected() ||
                    (table.getIsSomePageRowsSelected() && "indeterminate")
                }
                onCheckedChange={(value) => table.toggleAllPageRowsSelected(!!value)}
                aria-label="Select all"
            />
        ),
        cell: ({ row }) => (
            <Checkbox
                checked={row.getIsSelected()}
                onCheckedChange={(value) => row.toggleSelected(!!value)}
                aria-label="Select row"
            />
        ),
        enableSorting: false,
        enableHiding: false,
    },
    {
        accessorKey: "nombres",
        header: ({ column }) => (
            <Button
                variant="ghost"
                onClick={() => column.toggleSorting(column.getIsSorted() === "asc")}
            >
                Nombres y Apellidos
                <ArrowUpDown />
            </Button>
        ),
        cell: ({ row }) => (
            <div>{`${row.original.nombres} ${row.original.apellidos}`}</div>
        ),
    },
    {
        accessorKey: "email",
        header: ({ column }) => (
            <Button
                variant="ghost"
                onClick={() => column.toggleSorting(column.getIsSorted() === "asc")}
            >
                Email
                <ArrowUpDown />
            </Button>
        ),
        cell: ({ row }) => <div className="lowercase">{row.getValue("email")}</div>,
    },
    {
        accessorKey: "estado",
        sortingFn: "basic", // Se asegura de que se ordene correctamente
        header: ({ column }) => (
            <Button
                variant="ghost"
                onClick={() => column.toggleSorting(column.getIsSorted() === "asc")}
            >
                Estado
                <ArrowUpDown />
            </Button>
        ),
        cell: ({ row }) => {
            const estado = row.getValue("estado") === 1 ? "Activo" : "Inactivo";
            return (
                <div className="mx-auto ">
                    <span
                    className={`capitalize font-medium px-4 gap-2 mx-auto rounded-full ${estado === "Activo" ? "text-green-600 " : "text-red-600 "
                        }`}
                >
                    {estado}
                </span>
                </div>
            );
        },
    }
    ,
    {
        accessorKey: "fecha inicio",
        sortingFn: "basic", // Se asegura de que se ordene correctamente
        header:"Fecha de inicio",
        cell: ({ row }) => (
            <div>{`${row.original.created_at}`}</div>
        ),
    }
    ,
    {
        id: "acciones",
        header: "Acciones",
        cell: ({ row }) => {
            const user = row.original;
            return (
                <DropdownMenu>
                    <DropdownMenuTrigger asChild>
                        <Button variant="secondary" className="h-8 w-8 p-0">
                           {/**
                            *  <MoreHorizontal />
                            */}
                            <Pencil />
                        </Button>
                    </DropdownMenuTrigger>
                    <DropdownMenuContent align="end">
                        <DropdownMenuLabel>Acciones</DropdownMenuLabel>
                        <DropdownMenuSeparator />
                        <DropdownMenuItem onClick={()=>console.log(user.id)}>{
                            user.estado === 1 ? "Inhabilitar usuario" : "Habilitar usuario"
                            }</DropdownMenuItem>
                        <DropdownMenuItem>Editar usuario</DropdownMenuItem>
                        <DropdownMenuItem className="text-red-600">Eliminar usuario</DropdownMenuItem>
                    </DropdownMenuContent>
                </DropdownMenu>
            );
        },
    },
];


export function ManagementCredit() {
    const [sorting, setSorting] = React.useState<SortingState>([])
    const [users, setUsers] = React.useState<[]>([])
    const [loading, setLoading] = React.useState(false)
    const [columnFilters, setColumnFilters] = React.useState<ColumnFiltersState>(
        []
    )

    const [columnVisibility, setColumnVisibility] =
        React.useState<VisibilityState>({})
    const [rowSelection, setRowSelection] = React.useState({})

    const table = useReactTable({
        data: users,
        columns,
        onSortingChange: setSorting,
        onColumnFiltersChange: setColumnFilters,
        getCoreRowModel: getCoreRowModel(),
        getPaginationRowModel: getPaginationRowModel(),
        getSortedRowModel: getSortedRowModel(),
        getFilteredRowModel: getFilteredRowModel(),
        onColumnVisibilityChange: setColumnVisibility,
        onRowSelectionChange: setRowSelection,
        initialState: {
            pagination: {
                pageSize: 10, // Muestra solo 1 usuario por página
            },
        },
        state: {
            sorting,
            columnFilters,
            columnVisibility,
            rowSelection,
        },
    })
    const fetchUsers = async () => {
        try {
            setLoading(true)
            const response = await getDatas('usuarios')
            console.log(response.message)
            setUsers(response.message)
            setLoading(false)
        } catch (error) {
            console.error('Error fetching users:', error)
        } finally {
            setLoading(false)
        }
    }
    useEffect(() => {
        fetchUsers()
    }, [])
    return (
        <div className="mx-auto w-full   max-w-screen-xl lg:px-10 grid gap-y-2">
            <Card className="p-4">
                <div className="flex items-center py-4 justify-between">
                    <Input
                        placeholder="Buscar usuario..."
                        value={(table.getColumn("email")?.getFilterValue() as string) ?? ""}
                        onChange={(event) =>
                            table.getColumn("email")?.setFilterValue(event.target.value)
                        }
                        className="max-w-sm"
                    />
                    <div className="flex items-center gap-2">
                        <DropdownMenu>
                            <DropdownMenuTrigger asChild>
                                <Button variant="outline" className="ml-auto">
                                    Filtrar <ChevronDown />
                                </Button>
                            </DropdownMenuTrigger>
                            <DropdownMenuContent align="end">
                                {table
                                    .getAllColumns()
                                    .filter((column) => column.getCanHide())
                                    .map((column) => {
                                        return (
                                            <DropdownMenuCheckboxItem
                                                key={column.id}
                                                className="capitalize"
                                                checked={column.getIsVisible()}
                                                onCheckedChange={(value) =>
                                                    column.toggleVisibility(!!value)
                                                }
                                            >
                                                {column.id}
                                            </DropdownMenuCheckboxItem>
                                        )
                                    })}
                            </DropdownMenuContent>
                        </DropdownMenu>
                        <ModalNewCredit openText="Editor de solicitud" title="Edito de solicitud"  children={<FormAddCredit />}  />
                    </div>
                </div>
                <div className="rounded-md border">
                    <Table>
                        <TableHeader>
                            {table.getHeaderGroups().map((headerGroup) => (
                                <TableRow key={headerGroup.id}>
                                    {headerGroup.headers.map((header) => {
                                        return (
                                            <TableHead key={header.id}>
                                                {header.isPlaceholder
                                                    ? null
                                                    : flexRender(
                                                        header.column.columnDef.header,
                                                        header.getContext()
                                                    )}
                                            </TableHead>
                                        )
                                    })}
                                </TableRow>
                            ))}
                        </TableHeader>
                        <TableBody>
                            {table.getRowModel().rows?.length ? (
                                table.getRowModel().rows.map((row) => (
                                    <TableRow
                                        key={row.id}
                                        data-state={row.getIsSelected() && "selected"}
                                    >
                                        {row.getVisibleCells().map((cell) => (
                                            <TableCell key={cell.id}>
                                                {flexRender(
                                                    cell.column.columnDef.cell,
                                                    cell.getContext()
                                                )}
                                            </TableCell>
                                        ))}
                                    </TableRow>
                                ))
                            ) : (
                                <TableRow>
                                    <TableCell
                                        colSpan={columns.length}
                                        className="h-24 text-center"
                                    >
                                        No results.
                                    </TableCell>
                                </TableRow>
                            )}
                        </TableBody>
                    </Table>
                </div>
                <div className="flex items-center justify-end space-x-2 py-4">
                    <div className="flex-1 text-sm text-muted-foreground">
                        {table.getFilteredSelectedRowModel().rows.length} of{" "}
                        {table.getFilteredRowModel().rows.length} row(s) selected.
                    </div>
                    <div className="space-x-2">
                        <Button
                            variant="outline"
                            size="sm"
                            onClick={() => table.previousPage()}
                            disabled={!table.getCanPreviousPage()}
                        >
                            Atrás
                        </Button>
                        <Button
                            variant="outline"
                            size="sm"
                            onClick={() => table.nextPage()}
                            disabled={!table.getCanNextPage()}
                        >
                            Siguiente
                        </Button>
                    </div>
                </div>
            </Card>
           
        </div>
    )
}
