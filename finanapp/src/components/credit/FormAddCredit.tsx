import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { NewCredit } from "./NewCredit";
import { Refinancing } from "./Refinancing";

export const FormAddCredit = () => {
    return (

            <Tabs defaultValue="natural" className="w-full h-full">
                <TabsList className="flex justify-between gap-4">
                    <TabsTrigger
                        className="w-full h-8 data-[state=active]:bg-primary data-[state=active]:text-white"
                        value="natural"
                    >
                        Nuevo Crédito
                    </TabsTrigger>
                    <TabsTrigger
                        className="w-full h-8  data-[state=active]:bg-primary data-[state=active]:text-white"
                        value="juridica"
                    >
                        Refinanciamiento
                    </TabsTrigger>
                </TabsList>

                <TabsContent value="natural">
                    <NewCredit />
                </TabsContent>

                <TabsContent value="juridica">
                    <Refinancing />
                </TabsContent>
            </Tabs>
    );
};
