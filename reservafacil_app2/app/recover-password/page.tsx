"use client";
import React, { useState } from "react";
import Image from "next/image";
import TextInput from "@/components/ui/Inputs/TextInput";
import Button from "@/components/ui/Buttons/Button";
import { useRouter } from "next/navigation";
// import Link from "next/link";
export default function Page() {
  const router = useRouter();
  const [errorMsg, setErrorMsg] = useState("");
  const [data, setData] = useState("");

  // Error message, temporary using empty string for testing purposes

  return (
    <>
      <section className="hidden lg:block w-full h-dvh ">
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
                  Recuperação de senha
                </h1>
              </div>

              <div className="w-full">
                <span className="text-red-500 text-sm">{errorMsg}</span>
              </div>
              <TextInput
                placeholder="Email cadastrado"
                type="email"
                name="email"
                className=""
                required
                value={data}
                onChange={(e) => {
                  setData(e.target.value);
                }}
              />

              <Button
                text="Enviar Código"
                variant="primary"
                className="my-2"
                onClick={(e) => {
                  e.preventDefault();
                  if (
                    data.length > 3 &&
                    data.includes("@") &&
                    data.includes(".")
                  ) {
                    console.log(data);
                    router.push("/recover-password/code");
                  } else {
                    setErrorMsg("Email inválido");
                  }
                }}
              />
            </div>
          </div>
        </form>
      </section>

      <section className="block lg:hidden w-full h-dvh ">
        <form action="#" method="post">
          <div className="w-full h-screen flex items-center justify-center flex-col gap-2 p-8">
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
                  Recuperação de senha
                </h1>
              </div>
              <div className="w-full">
                <span className="text-red-500 text-sm">{errorMsg}</span>
              </div>
              <TextInput
                placeholder="Email cadastrado"
                type="email"
                name="email"
                className=""
                required
                value={data}
                onChange={(e) => {
                  setData(e.target.value);
                }}
              />

              <Button
                text="Enviar Código"
                variant="primary"
                className="my-2"
                onClick={(e) => {
                  e.preventDefault();
                  if (
                    data.length > 3 &&
                    data.includes("@") &&
                    data.includes(".")
                  ) {
                    console.log(data);
                    router.push("/recover-password/code");
                  } else {
                    setErrorMsg("Email inválido");
                  }
                }}
              />
            </div>
          </div>
        </form>
      </section>
    </>
  );
}
