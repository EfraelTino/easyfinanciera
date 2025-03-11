import { Button } from '../ui/button'
import { Dialog, DialogContent, DialogTitle, DialogTrigger, DialogHeader, DialogFooter } from '../ui/dialog'
import { Plus } from 'lucide-react'
import { ModalNewCreditType } from '@/lib/types'

export const ModalNewCredit = ({
    openText,
    title,
    children,
}: ModalNewCreditType) => {
    return (
        <Dialog>
            <DialogTrigger asChild>
                <Button className="ml-auto"><Plus />
                    <span className="ml-2">{openText}</span> </Button>
            </DialogTrigger>
            <DialogContent className="sm:max-w-[425px] md:max-w-2xl">
                <DialogHeader>
                    <DialogTitle>{title}</DialogTitle>
                </DialogHeader>
                <>
                    {children}
                </>
               {/**
                *  <DialogFooter>
                    <Button type="submit">Save changes</Button>
                </DialogFooter>
                */}
            </DialogContent>
        </Dialog>
    )
}
