import { Button } from './ui/button'
import { Dialog, DialogContent, DialogDescription, DialogTitle, DialogTrigger , DialogHeader,DialogFooter } from './ui/dialog'
import { Label } from './ui/label'
import { Input } from './ui/input'
import { Plus } from 'lucide-react'
import { ModalAddUser as ModalAddUserType } from '@/lib/types'

export const ModalAddUser = ({
    openText, 
    closeText,
    title,
    description,
    children,
    onOpenChange,
    onOpen,
}: ModalAddUserType) => {
  return (
    <Dialog>
      <DialogTrigger asChild>
        <Button className="ml-auto"><Plus />
        <span className="ml-2">{openText}</span> </Button>
      </DialogTrigger>
      <DialogContent className="sm:max-w-[425px]">
        <DialogHeader>
          <DialogTitle>{title}</DialogTitle>
          <DialogDescription>
            Make changes to your profile here. Click save when you're done.
          </DialogDescription>
        </DialogHeader>
        <div className="grid gap-4 py-4">
          <div className="grid grid-cols-4 items-center gap-4">
            <Label htmlFor="name" className="text-right">
              Name
            </Label>
            <Input id="name" value="Pedro Duarte" className="col-span-3" />
          </div>
          <div className="grid grid-cols-4 items-center gap-4">
            <Label htmlFor="username" className="text-right">
              Username
            </Label>
            <Input id="username" value="@peduarte" className="col-span-3" />
          </div>
        </div>
        <DialogFooter>
          <Button type="submit">Save changes</Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  )
}
