"use client";
import Image from "next/image";
import React from "react";
import Link from "next/link";
import { Button } from "@/components/ui/button";

export default function Home() {
  return (
    <>
      <section className="hidden lg:flex ">
        <div
          style={{
            backgroundImage: `url('/food.jpg')`,
            backgroundSize: "cover",
            backgroundPosition: "center",
          }}
          className="flex w-full h-screen bg-cover bg-center  items-center justify-center "
        >
          <Image
            src={`/logo_big_w.png`}
            alt=""
            width={500}
            height={100}
            className="pointer-events-none"
          />
        </div>
        <div className="w-full h-screen flex items-center justify-center flex-col gap-2 p-8">
          <div className="w-[500px] flex flex-col gap-4 shadow-lg p-8 rounded-lg ">
            <h1 className="text-5xl font-bold mb-2">
              Bem vindo ao Reserva Fácil
            </h1>
            <p className="text-xl mb-4">
              Faça login ou crie uma conta para começar
            </p>

            <Button className="w-full" asChild>
              <Link href={"/login"}>Sou Cliente </Link>
            </Button>

            <Button variant="outline" className="w-full" asChild>
              <Link href={"/register"}>Criar Conta </Link>
            </Button>
          </div>
        </div>
      </section>

      <section className="flex lg:hidden">
        <div
          style={{
            backgroundImage: `url('/food.jpg')`,
            backgroundSize: "cover",
            backgroundPosition: "center",
          }}
          className="flex flex-col w-full h-[100dvh] bg-cover bg-center items-center justify-between"
        >
          <Image
            src={`/logo_big_w.png`}
            alt=""
            width={200}
            height={100}
            className="mt-8 pointer-events-none"
          />
          <div className="w-full flex flex-col gap-4 px-4 py-6 rounded-t-lg bg-white">
            <p className="mb-2 font-bold text-xl text-center">
              Faça sua primeira reserva hoje!
            </p>
            <Button className="w-full" asChild>
              <Link href={"/login"}>Sou Cliente </Link>
            </Button>

            <Button variant="outline" className="w-full" asChild>
              <Link href={"/register"}>Criar Conta </Link>
            </Button>
          </div>
        </div>
      </section>
    </>
  );
}
