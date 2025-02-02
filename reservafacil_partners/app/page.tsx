"use client";
import {
  Carousel,
  CarouselContent,
  CarouselItem,
} from "@/components/ui/carousel";
import Header from "@/components/widgets/header";
import Image from "next/image";

import chef1 from "@/public/chef1.png";
import chef2 from "@/public/chef2.png";
import chef3 from "@/public/chef3.png";
import Autoplay from "embla-carousel-autoplay";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Button } from "@/components/ui/button";

export default function Page() {
  return (
    <>
      <div className="w-full h-dvh relative">
      <Header />
        <Carousel
          plugins={[
            Autoplay({
              delay: 5000,
            }),
          ]}
        >
          <div className="w-[300px] lg:w-[400px] bg-white absolute top-[15vw] right-[2vw] lg:top-[10vw] lg:right-[20vw] z-20 rounded-xl shadow-xl p-4 flex flex-col justify-between">
            <div>
              <h1 className="text-3xl font-semibold">Cadastre sua loja</h1>
              <p className="py-2">E deixe seu restaurante famoso.</p>
            </div>
            <div>
              <Label htmlFor="email">Email</Label>
              <Input type="email" name="email" placeholder="email@email.com" required />
            </div>
            <Button className="w-full my-6" size={"xl"}>
              Cadastrar
            </Button>
            <p className="text-sm">Ao continuar, você concorda em receber comunicações do iFood. Confira nossa <span className="underline hover:cursor-pointer">Declaração de Privacidade.</span></p>
          </div>
          <CarouselContent className="">
            <CarouselItem>
              <Image
                src={chef1.src}
                width={chef1.width}
                height={200}
                alt=""
                className="h-[80vh] lg:max-h-[800px] object-cover object-top"
              />
            </CarouselItem>
            <CarouselItem>
              <Image
                src={chef2.src}
                width={chef2.width}
                height={200}
                alt=""
                className="h-[80vh] lg:max-h-[800px] object-cover object-top"
              />
            </CarouselItem>
            <CarouselItem>
              <Image
                src={chef3.src}
                width={chef3.width}
                height={200}
                alt=""
                className="h-[80vh] lg:max-h-[800px] object-cover object-top"
              />
            </CarouselItem>
          </CarouselContent>
          {/* <CarouselPrevious />
          <CarouselNext /> */}
        </Carousel>
        <div className="bg-orange-500 h-[15px] w-full"></div>
        <h1>Em Breve...</h1>
      </div>
    </>
  );
}
