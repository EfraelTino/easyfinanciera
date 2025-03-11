import { Toaster } from "sonner";
import { RouterPrincipal } from "./routes/RouterPrincipal";

export const App = () => {
  return (
    <>
      <RouterPrincipal />
      <Toaster richColors />
    </>
  );
};

export default App;
  