"use client";
import { useRouter } from "next/navigation";
import { useState } from "react";
import cookie from "js-cookie";
import { config } from "@/utils/config";

export default function Page() {

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const router = useRouter();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    // console.log(process.env.API_URL);

    try {
      // Fazendo a requisição de login
      const response = await fetch("http://localhost:3030/v0/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `RFAPP_012025_DEV`,
        },
        body: JSON.stringify({ email, password }),
      });
      const data = await response.json();
      console.log(data)
      if (!response.ok) {
        // Se a resposta não for ok, lança erro
        throw new Error("Credenciais inválidas");

      }

      // const data = await response.json();
      const { token } = data;  // Supondo que a API retorne o token

      // Armazenando o token nos cookies
      cookie.set("token", token, { expires: 1 }); // O token expira em 1 dia

      // Redireciona para a página principal ou outra página após login
      router.push("/home");
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    } catch (error: any) {
      setError(error.message); // Exibe o erro caso a requisição falhe
    }
  };
  
  return (
    <div className="w-full h-dvh flex justify-center items-center">
      <div>
        <h1>Login</h1>
        <form onSubmit={handleSubmit} className="flex flex-col gap-2">
          <div>
            <label>Email</label>
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
          </div>
          <div>
            <label>Password</label>
            <input
              type="text"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </div>
          {error && <p style={{ color: "red" }}>{error}</p>}
          <button type="submit" className="bg-orange-500 p-2 rounded-sm text-white font-bold">Login</button>
        </form>
      </div>
    </div>
  );
}


