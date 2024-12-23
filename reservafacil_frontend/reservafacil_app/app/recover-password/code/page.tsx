"use client";
import React from "react";
import Image from "next/image";
import { useRouter } from "next/navigation";
import {
  InputOTP,
  InputOTPGroup,
  InputOTPSeparator,
  InputOTPSlot,
} from "@/components/ui/input-otp";
import { Button } from "@/components/ui/button";
// import Link from "next/link";
export default function Page() {
  const router = useRouter();
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
                width={200}
                height={100}
                className="pointer-events-none mb-6"
              />

              <div className="w-full ">
                <h1 className="text-2xl font-bold text-neutral-600 text-center">
                  Confirmar Código
                </h1>
              </div>
              <div className="w-full ">
                <h1 className="text-sm text-neutral-400 text-center">
                  Insira o código de recuperação enviado para o seu email
                </h1>
              </div>

              <div className="w-full">
                <span className="text-red-500 text-sm">{errorMsg}</span>
              </div>
              <InputOTP maxLength={6}>
                <InputOTPGroup>
                  <InputOTPSlot index={0} />
                  <InputOTPSlot index={1} />
                  <InputOTPSlot index={2} />
                </InputOTPGroup>
                <InputOTPSeparator />
                <InputOTPGroup>
                  <InputOTPSlot index={3} />
                  <InputOTPSlot index={4} />
                  <InputOTPSlot index={5} />
                </InputOTPGroup>
              </InputOTP>
              <Button
                onClick={(e) => {
                  e.preventDefault();
                  router.replace("/");
                }}
                className="w-full"
              >
                Validar Código
              </Button>
            </div>
          </div>
        </form>
      </section>

      <section className="block lg:hidden w-full h-dvh ">
        <form action="#" method="post">
          <div className="w-full h-dvh flex items-center justify-center flex-col gap-2 p-8">
            <div className="w-full flex flex-col items-center gap-2 p-2 rounded-lg ">
              <Image
                src={`/logo_center.png`}
                alt=""
                width={160}
                height={100}
                className="pointer-events-none mb-6"
              />
              <div className="w-full ">
                <h1 className="text-xl font-bold text-neutral-600 text-center">
                  Recuperação de senha
                </h1>
              </div>
              <div className="w-full ">
                <h1 className="text-sm text-neutral-400 text-center">
                  Insira o código de recuperação enviado para o seu email
                </h1>
              </div>

              <div className="w-full">
                <span className="text-red-500 text-sm">{errorMsg}</span>
              </div>

              <InputOTP maxLength={6} className="my-4">
                <InputOTPGroup>
                  <InputOTPSlot index={0} />
                  <InputOTPSlot index={1} />
                  <InputOTPSlot index={2} />
                </InputOTPGroup>
                <InputOTPSeparator />
                <InputOTPGroup>
                  <InputOTPSlot index={3} />
                  <InputOTPSlot index={4} />
                  <InputOTPSlot index={5} />
                </InputOTPGroup>
              </InputOTP>
              <Button
                onClick={(e) => {
                  e.preventDefault();
                  router.replace("/");
                }}
                className="w-full mt-4"
              >
                Validar Código
              </Button>
            </div>
          </div>
        </form>
      </section>
    </>
  );
}
