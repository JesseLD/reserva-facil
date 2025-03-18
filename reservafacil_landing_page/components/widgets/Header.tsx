"use client";
import React from "react";
import Image from "next/image";
import Logo from "@/public/logo_big_size.png";
import Link from "next/link";
import Button from "../ui/Buttons/Button";
import { usePathname } from "next/navigation";
import { IoMenu } from "react-icons/io5";

export default function Header() {
  // const router = useRouter();
  const currentRoute = usePathname();

  const [isMenuOpen, setIsMenuOpen] = React.useState(false);

  const navBar = [
    {
      name: "Home",
      href: "/",
      external: false,
    },
    {
      name: "Contato",
      href: "https://status.reservafacil.site",
      external: true,
    },
    {
      name: "Para Empresas",
      href: "https://status.reservafacil.site",
      external: true,
    },
    {
      name: "Sobre",
      href: "https://status.reservafacil.site",
      external: true,
    },
    {
      name: "Criar Conta",
      href: "https://test-app.reservafacil.site",
      external: true,
    },
  ];

  return (
    <>
      <header className="w-full py-4 shadow-md bg-white ">
        {/* // Uncomment this line to make the header sticky */}
        {/* <header className="w-full py-4 shadow-md bg-white fixed top-0 z-50"> */}
        <div className="px-[10vw] flex justify-between items-center">
          <div>
            <Link href="/">
              <Image
                src={Logo.src}
                width={200}
                height={Logo.height}
                alt=""
                className="pointer-events-none"
              />
            </Link>
          </div>
          <nav className="hidden lg:block">
            <ul className="flex space-x-4 items-center">
              {navBar.map((item, index) => (
                <li key={index}>
                  <Link
                    href={item.href || "#"}
                    passHref={!item.external}
                    target={item.external ? "_blank" : ""}
                    className={`text-lg font-semibold hover:text-orange-500 hover:underline ${
                      currentRoute === item.href
                        ? "text-orange-500"
                        : "text-neutral-800"
                    }`}
                  >
                    {item.name}
                  </Link>
                </li>
              ))}

              <li>
                <Link href="https://test-app.reservafacil.site" passHref>
                  <Button>Entrar</Button>
                </Link>
              </li>
            </ul>
          </nav>

          <nav className="lg:hidden">
            <IoMenu
              size={40}
              color="text-neutral-800"
              onClick={() => setIsMenuOpen(!isMenuOpen)}
            />

            {isMenuOpen && (
              <div className="">
                <ul className="mr-[10vw] absolute top-20 right-0  bg-white p-8 shadow-xl rounded-lg flex flex-col items-center justify-center space-y-4">
                  {navBar.map((item, index) => (
                    <li key={index}>
                      <Link
                        href={item.href || "#"}
                        passHref={!item.external}
                        target={item.external ? "_blank" : ""}
                        className={`text-lg font-semibold hover:text-orange-500 hover:underline ${
                          currentRoute === item.href
                            ? "text-orange-500"
                            : "text-neutral-800"
                        }`}
                      >
                        {item.name}
                      </Link>
                    </li>
                  ))}

                  <li>
                    <Link href="https://test-app.reservafacil.site" passHref>
                      <Button>Entrar</Button>
                    </Link>
                  </li>
                </ul>
              </div>
            )}
          </nav>
        </div>
      </header>
    </>
  );
}
