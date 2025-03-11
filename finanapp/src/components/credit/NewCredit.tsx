import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { NaturalPerson } from "./NaturalPerson";
import { ArtificialPerson } from "./ArtificialPerson";

export const NewCredit = () => {
    return (
        <div className="w-full">
            <Tabs defaultValue="natural" className="w-full">
                <TabsList className="flex justify-between gap-4">
                    <TabsTrigger className="w-full h-8 data-[state=active]:bg-primary data-[state=active]:text-white" value="natural">Persona Natural</TabsTrigger>
                    <TabsTrigger className="w-full h-8 data-[state=active]:bg-primary data-[state=active]:text-white" value="juridica">Persona Jurídica</TabsTrigger>
                </TabsList>

                <TabsContent value="natural">
                    <NaturalPerson />
                </TabsContent>

                <TabsContent value="juridica">
                    <ArtificialPerson />
                </TabsContent>
            </Tabs>
        </div>
    );
};
