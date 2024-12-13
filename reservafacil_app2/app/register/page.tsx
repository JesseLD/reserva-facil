import Button from "@/components/ui/Buttons/Button";
import TextInput from "@/components/ui/Inputs/TextInput";
import React from "react";
import Image from "next/image";
import Link from "next/link";

export default function Page() {
  const errorMsg = "";
  // Error message, temporary using empty string for testing purposes
  return (
    <>
      <section className="hidden lg:block w-full h-dvh ">
        <form action="#" method="post">
          <div className="w-full h-dvh flex items-center justify-center flex-col gap-2 p-8">
            <div className="w-[500px] flex flex-col items-center gap-4 shadow-lg p-8 rounded-lg ">
              <Image
                src={`/logo_center.png`}
                alt=""
                width={160}
                height={100}
                className="pointer-events-none mb-6"
              />
              <div className="w-full ">
                <h1 className="text-2xl font-bold text-slate-600">
                  Crie sua conta
                </h1>
              </div>
              <div className="w-full">
                <span className="text-red-500 text-sm">{errorMsg}</span>
              </div>
              <TextInput
                placeholder="Seu Nome"
                type="name"
                name="name"
                className=""
                required
              />
              <TextInput
                placeholder="Seu email"
                type="email"
                name="email"
                className=""
                required
              />
              {/* <TextInput
                placeholder="Seu endereço"
                type="text"
                name="address"
                className=""
                required
              /> */}
              <TextInput
                placeholder="Sua Senha"
                type="password"
                name="password"
                className=""
                required
              />
              <TextInput
                placeholder="Confirmar Senha"
                type="password"
                name="password"
                className=""
                required
              />

              <Button text="Cadastrar" variant="primary" className="my-2" />

              <p className="text-slate-400 my-4 font-bold cursor-pointer">Ou</p>
              <p className="text-slate-400 font-bold cursor-pointer">
                Já tem uma conta?{" "}
                <Link
                  href={"/login"}
                  className="text-orange-500 font-bold hover:underline transition-all"
                >
                  Faça login
                </Link>
              </p>
            </div>
          </div>
        </form>
      </section>
      <section className="block lg:hidden w-full h-dvh">
        <form action="#" method="post">
          <div className="w-full h-dvh flex items-center justify-center flex-col gap-2 p-4">
            <div className="w-full flex flex-col items-center gap-2 p-4 rounded-lg ">
              <Image
                src={`/logo_center.png`}
                alt=""
                width={160}
                height={100}
                className="pointer-events-none mb-3"
              />
              <div className="w-full ">
                <h1 className="text-xl font-bold text-slate-600">
                  Crie sua conta
                </h1>
              </div>
              <div className="w-full">
                <span className="text-red-500 text-sm">{errorMsg}</span>
              </div>
              <TextInput
                placeholder="Seu Nome"
                type="name"
                name="name"
                className=""
                required
              />
              <TextInput
                placeholder="Seu email"
                type="email"
                name="email"
                className=""
                required
              />
              {/* <TextInput
                placeholder="Seu endereço"
                type="text"
                name="address"
                className=""
                required
              /> */}
              <TextInput
                placeholder="Sua Senha"
                type="password"
                name="password"
                className=""
                required
              />
              <TextInput
                placeholder="Confirmar Senha"
                type="password"
                name="password"
                className=""
                required
              />

              <Button text="Cadastrar" variant="primary" className="my-2" />

              <p className="text-slate-400 my-2 font-bold cursor-pointer">Ou</p>
              <p className="text-slate-400 font-bold cursor-pointer">
                Já tem uma conta?{" "}
                <Link
                  href={"/login"}
                  className="text-orange-500 font-bold hover:underline transition-all"
                >
                  Faça login
                </Link>
              </p>
            </div>
          </div>
        </form>
      </section>
    </>
  );
}
