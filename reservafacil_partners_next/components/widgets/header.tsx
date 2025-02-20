import React from "react";
import logo from "@/public/logo_big.png";
import { IoIosMenu } from "react-icons/io";
import Image from "next/image";
import { Button } from "../ui/button";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  // DropdownMenuLabel,
  // DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "../ui/dropdown-menu";

interface HeaderProps {
  disableButtons?: boolean;
}
export default function Header({ disableButtons }: HeaderProps) {
  return (
    <div className="px-[5vw] lg:px-[24vw] flex justify-between items-center py-4 bg-white">
      <div>
        <Image src={logo.src} width={200} height={logo.height} alt="" />
      </div>
      {disableButtons ? null : (
        <div className="flex gap-4">
          <Button variant={"outline"} size={"xl"} className="hidden lg:block">
            Entrar no Portal
          </Button>
          <Button size={"xl"} className="hidden lg:block">Cadastrar</Button >


          <DropdownMenu >
            <DropdownMenuTrigger className="lg:hidden">
              <IoIosMenu size={32} />
            </DropdownMenuTrigger>
            <DropdownMenuContent className="mr-8">
              {/* <DropdownMenuLabel>My Account</DropdownMenuLabel>
              <DropdownMenuSeparator /> */}
              <DropdownMenuItem>Entrar no Portal</DropdownMenuItem>
              <DropdownMenuItem>Cadastrar</DropdownMenuItem>
              {/* <DropdownMenuItem>Team</DropdownMenuItem>
              <DropdownMenuItem>Subscription</DropdownMenuItem> */}
            </DropdownMenuContent>
          </DropdownMenu>
        </div>
      )}
    </div>
  );
}
