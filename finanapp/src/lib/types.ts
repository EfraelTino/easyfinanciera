export type UserData = {
    email: string;
    name: string;
    lastname: string;
    typeuser: string;
    id:number;
};

export type PostData = {
    url: string;
    data: string;
}

export type User = {
    id: number;
    nombres: string;
    apellidos: string;
    email: string;
    typeuser: number;
    created_at: string;
    estado: number;
}

export type ModalNewCreditType = {
    openText: string;
    title: string;
    children: React.ReactNode;
}