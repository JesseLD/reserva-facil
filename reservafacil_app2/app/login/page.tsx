import React from "react";
import Image from "next/image";
import TextInput from "@/components/ui/Inputs/TextInput";
import Button from "@/components/ui/Buttons/Button";
import Link from "next/link";
export default function Page() {
  const errorMsg = "";
  // Error message, temporary using empty string for testing purposes

  return (
    <>
      <section className="hidden lg:block w-full h-dvh">
        <form action="#" method="post">
          <div className="w-full h-screen flex items-center justify-center flex-col gap-2 p-8">
            <div className="w-[500px] flex flex-col items-center gap-4 shadow-lg p-8 rounded-lg ">
              <Image
                src={`/logo_center.png`}
                alt=""
                width={200}
                height={100}
                className="pointer-events-none mb-6"
              />
              <div className="w-full ">
                <h1 className="text-2xl font-bold text-slate-600">
                  Entre na sua conta
                </h1>
              </div>
              <div className="w-full">
                <span className="text-red-500 text-sm">{errorMsg}</span>
              </div>
              <TextInput
                placeholder="Entrar com seu email"
                type="email"
                name="email"
                className=""
                required
              />
              <TextInput
                placeholder="Sua Senha"
                type="password"
                name="password"
                className=""
                required
              />
              <div className="flex justify-between w-full my-4 ">
                <div>
                  <input
                    type="checkbox"
                    name=""
                    // id=""
                    className="cursor-pointer"
                  />
                  <span className="text-orange-500 font-bold hover:underline cursor-pointer transition-all ml-2">
                    Salvar Login
                  </span>
                </div>

                <div>
                  <Link
                    href="/recover-password"
                    className="text-orange-500 font-bold hover:underline transition-all"
                  >
                    Recuperar senha
                  </Link>
                </div>
              </div>
              <Button text="Entrar" variant="primary" className="my-2" />

              <p className="text-slate-400 my-4 font-bold cursor-pointer">Ou</p>
              <p className="text-slate-400 font-bold cursor-pointer">
                Não tem uma conta?{" "}
                <Link
                  href={"/register"}
                  className="text-orange-500 font-bold hover:underline transition-all"
                >
                  Cadastro Gratuito
                </Link>
              </p>
            </div>
          </div>
        </form>
      </section>

      <section className="block lg:hidden w-full h-dvh">
        <form action="#" method="post">
          <div className="w-full h-screen flex items-center justify-center flex-col gap-2 p-4">
            <div className="w-full flex flex-col items-center gap-2 p-2 rounded-lg ">
              <Image
                src={`/logo_center.png`}
                alt=""
                width={160}
                height={100}
                className="pointer-events-none mb-6"
              />
              <div className="w-full ">
                <h1 className="text-xl font-bold text-slate-600">
                  Entre na sua conta
                </h1>
              </div>
              <div className="w-full">
                <span className="text-red-500 text-sm">{errorMsg}</span>
              </div>
              <TextInput
                placeholder="Entrar com seu email"
                type="email"
                name="email"
                className=""
                required
              />
              <TextInput
                placeholder="Sua Senha"
                type="email"
                name="email"
                className=""
                required
                min={6}
              />
              <div className="flex justify-between w-full my-2 ">
                <div>
                  <input
                    type="checkbox"
                    name=""
                    // id=""
                    className="cursor-pointer"
                  />
                  <span className="text-orange-500 font-bold hover:underline cursor-pointer transition-all ml-2">
                    Salvar Login
                  </span>
                </div>

                <div>
                  <Link
                    href="/recover-password"
                    className="text-orange-500 font-bold hover:underline transition-all"
                  >
                    Recuperar senha
                  </Link>
                </div>
              </div>
              <Button text="Entrar" variant="primary" className="my-2" />

              <p className="text-slate-400 my-2 font-bold cursor-pointer">Ou</p>
              <p className="text-slate-400 font-bold cursor-pointer text-md text-center">
                Não tem uma conta?{" "}
                <Link
                  href={"/register"}
                  className="text-orange-500 font-bold hover:underline transition-all"
                >
                  Cadastro Gratuito
                </Link>
              </p>
            </div>
          </div>
        </form>
      </section>
    </>
  );
}
