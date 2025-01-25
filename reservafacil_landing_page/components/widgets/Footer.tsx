import React from "react";
import { IoLogoYoutube } from "react-icons/io";
import { IoLogoInstagram } from "react-icons/io5";
import { FaFacebook } from "react-icons/fa6";
import Image from "next/image";
import Logo from "@/public/logo_big_size.png";
import Link from "next/link";

export default function Footer() {
  return (
    <>
      <footer className="py-8 px-[2vw] lg:px-[10vw] bg-slate-100">
        <div className="flex flex-col gap-4 items-center lg:items-start lg:gap-0 lg:flex-row justify-between">
          <Image
            src={Logo.src}
            width={200}
            height={Logo.height}
            alt=""
            className="pointer-events-none"
          />
          <div>
            <nav>
              <ul className="flex flex-col  lg:flex-row gap-2 lg:gap-4 text-sm lg:text-lg  text-slate-500">
                <div className="flex flex-col items-center lg:items-start">
                  <li className="hover:underline hover:cursor-pointer font-bold uppercase transition">
                    Links Rápidos
                  </li>
                  <Link href="#">Home</Link>
                  <Link href="#">Criar Conta</Link>
                  <Link href="#">Para Empresas</Link>
                  <Link href="#">Termos e Condições</Link>
                </div>
                <div className="flex flex-col items-center lg:items-start">
                  <li className="hover:underline hover:cursor-pointer font-bold uppercase transition">
                    Sobre nós
                  </li>
                  <Link href="#">Nosso Time</Link>
                  <Link href="#">Suporte</Link>
                  <Link href="#">Política de Privacidade</Link>
                  <Link target="_blank" href="https://status.reservafacil.site">Status</Link>
                </div>
                <div className="flex flex-col items-center lg:items-start">
                  <li className="hover:underline hover:cursor-pointer font-bold uppercase transition">
                    Contato
                  </li>
                  <Link href="#">Contato</Link>
                </div>
              </ul>
            </nav>
          </div>
        </div>
        <hr className="my-4" />
        <div className="flex justify-between text-center text-slate-400 text-[12px] lg:text-sm flex-col lg:flex-row items-center gap-4">
          <p>
            &copy;
            <a href="#" className="text-orange-600 font-bold">
              {" "}
              Reserva Fácil
            </a>{" "}
            {new Date().getFullYear()}| CNPJ 00.000.000/0001-00
          </p>

          <div className="flex space-x-2 text-2xl text-orange-600 text-center lg:text-start">
            <IoLogoYoutube size={20} />
            <IoLogoInstagram size={20} />
            <FaFacebook size={20} />
          </div>
        </div>
      </footer>
    </>
  );
}
