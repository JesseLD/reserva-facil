import gradientBg from "@/public/gradient.png";
import phone from "@/public/phone.png";
import phone2 from "@/public/phone2.png";
import restaurant1 from "@/public/restaurant1.jpg";
import restaurant2 from "@/public/restaurant2.jpg";
import { IoStar } from "react-icons/io5";

import Image from "next/image";
import Button from "@/components/ui/Buttons/Button";
import Link from "next/link";

export default function Home() {
  return (
    <>
      <section
        className=" bg-bottom w-full px-[10vw] flex flex-col lg:flex-row items-center justify-center bg-cover bg-no-repeat py-4"
        style={{ backgroundImage: `url(${gradientBg.src})` }}
      >
        <div className="max-w-[600px]">
          <h1 className="text-3xl text-center lg:text-start lg:text-6xl font-bold text-white ">
            Explore experiências gastronômicas incríveis perto de você.
          </h1>
          <p className="text-white lg:text-orange-600 text-center lg:text-start text-xl">
            Descubra restaurantes selecionados e viva momentos únicos com boa
            comida e companhia, de norte a sul do Brasil.
          </p>
        </div>
        <Image
          src={phone.src}
          width={260}
          height={phone.height}
          alt=""
          className="pointer-events-none w-[160px] lg:w-[260px]"
        />
      </section>

      <section className="hidden lg:flex w-full px-[10vw] py-8 flex-col gap-4 items-center justify-center">
        <h1 className="font-bold text-4xl text-orange-600">
          Como Funciona o Reserva Fácil?
        </h1>
        <div className="flex gap-8 items-center justify-center mt-4">
          <div className="flex flex-col gap-4 ">
            <div className="flex flex-col items-end gap-4 max-w-[240px]">
              <div className="text-5xl w-[64px] h-[64px] bg-orange-200 text-orange-600 rounded-lg flex items-center justify-center">
                1
              </div>
              <h2 className="font-bold text-2xl text-end">
                Encontre o Restaurante Ideal
              </h2>
              <p className="text-end text-sm">
                Navegue por nossa seleção especial de restaurantes em todo o
                Brasil. Use filtros para buscar por tipo de comida, localização
                ou ambiente, e descubra lugares perfeitos para cada ocasião.
              </p>
            </div>

            <div className="flex flex-col items-end justify-center gap-4 max-w-[240px]">
              <div className="text-5xl w-[64px] h-[64px] bg-orange-600 text-white rounded-lg flex items-center justify-center">
                3
              </div>
              <h2 className="font-bold text-2xl text-end">
                Reserve com Facilidade
              </h2>
              <p className="text-end text-sm">
                Garanta sua mesa em poucos cliques. Evite filas e surpresas ao
                reservar diretamente pelo site, com confirmação rápida e
                prática.
              </p>
            </div>
          </div>
          <Image
            src={phone2.src}
            width={260}
            height={phone2.height}
            alt=""
            className="pointer-events-none hidden lg:block"
          />
          <div className="flex flex-col  gap-12 lg:gap-4 ">
            <div className="flex flex-col items-start gap-4 max-w-[240px]">
              <div className="text-5xl w-[64px] h-[64px] bg-orange-200 text-orange-600 rounded-lg flex items-center justify-center">
                2
              </div>
              <h2 className="font-bold text-2xl text-start">
                Veja Avaliações Reais
              </h2>
              <p className="text-start text-sm">
                Tenha acesso a avaliações e fotos de pessoas que já visitaram os
                restaurantes. Decida com confiança onde aproveitar sua próxima
                experiência gastronômica.
              </p>
            </div>

            <div className="flex flex-col items-start gap-4 max-w-[240px]">
              <div className="text-5xl w-[64px] h-[64px] bg-orange-200 text-orange-600 rounded-lg flex items-center justify-center">
                4
              </div>
              <h2 className="font-bold text-2xl text-start">
                Viva uma Experiência Inesquecível
              </h2>
              <p className="text-start text-sm">
                Aproveite pratos incríveis, ambientes únicos e momentos
                especiais em restaurantes selecionados com muito cuidado para
                você.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Section For Mobile Version */}
      <section className="flex lg:hidden w-full px-[10vw] py-8 flex-col gap-4 items-center justify-center">
        <h1 className="font-bold text-4xl text-center text-orange-600">
          Como Funciona o Reserva Fácil?
        </h1>
        <div className="flex gap-8 items-center justify-center mt-4">
          <div className="flex flex-col gap-4 ">
            <div className="flex flex-col items-center gap-4 max-w-[240px]">
              <div className="text-5xl w-[64px] h-[64px] bg-orange-200 text-orange-600 rounded-lg flex items-center justify-center">
                1
              </div>
              <h2 className="font-bold text-2xl text-center">
                Encontre o Restaurante Ideal
              </h2>
              <p className="text-center text-sm">
                Navegue por nossa seleção especial de restaurantes em todo o
                Brasil. Use filtros para buscar por tipo de comida, localização
                ou ambiente, e descubra lugares perfeitos para cada ocasião.
              </p>
            </div>

            <div className="flex flex-col items-center gap-4 max-w-[240px]">
              <div className="text-5xl w-[64px] h-[64px] bg-orange-200 text-orange-600 rounded-lg flex items-center justify-center">
                2
              </div>
              <h2 className="font-bold text-2xl text-center">
                Veja Avaliações Reais
              </h2>
              <p className="text-center text-sm">
                Tenha acesso a avaliações e fotos de pessoas que já visitaram os
                restaurantes. Decida com confiança onde aproveitar sua próxima
                experiência gastronômica.
              </p>
            </div>

            <div className="flex flex-col items-center justify-center gap-4 max-w-[240px]">
              <div className="text-5xl w-[64px] h-[64px] bg-orange-600 text-white rounded-lg flex items-center justify-center">
                3
              </div>
              <h2 className="font-bold text-2xl text-center">
                Reserve com Facilidade
              </h2>
              <p className="text-center text-sm">
                Garanta sua mesa em poucos cliques. Evite filas e surpresas ao
                reservar diretamente pelo site, com confirmação rápida e
                prática.
              </p>
            </div>

            <div className="flex flex-col items-center gap-4 max-w-[240px]">
              <div className="text-5xl w-[64px] h-[64px] bg-orange-200 text-orange-600 rounded-lg flex items-center justify-center">
                4
              </div>
              <h2 className="font-bold text-2xl text-center">
                Viva uma Experiência Inesquecível
              </h2>
              <p className="text-center text-sm">
                Aproveite pratos incríveis, ambientes únicos e momentos
                especiais em restaurantes selecionados com muito cuidado para
                você.
              </p>
            </div>
          </div>
        </div>
      </section>

      <section
        className="w-full h-[600px] pl-[10vw] bg-slate-400 bg-cover md:bg-center"
        // style="background-image: url('./img/restaurant1.jpg')"
        style={{ backgroundImage: `url(${restaurant1.src})` }}
        data-aos="fade-up"
        data-aos-duration="750"
      >
        <div className="h-[600px] flex flex-col justify-center gap-4">
          <div className="max-w-[600px] flex items-center gap-4 text-white">
            <p className="text-4xl md:text-6xl font-bold text-white">3.212</p>
            <p className="text-2xl md:text-4xl text-white">
              restaurantes parceiros em todo o Brasil — e esse número só cresce!
            </p>
          </div>
          <div className="max-w-[400px] text-white font-light text-xl">
            <p className="text-white">
              Nossos parceiros enchem suas mesas mesmo nos horários mais
              ociosos, oferecendo promoções especiais e descontos que atraem
              novos clientes diariamente.
            </p>
          </div>

          <div>
            <Link
              href="https://partners.reservafacil.site"
              target="_blank"
              rel="external"
            >
              <div className="max-w-[200px]">
                <Button>Cadastrar Restaurante</Button>
              </div>
            </Link>
          </div>
        </div>
      </section>

      <section
        className="w-full h-[600px] px-[10vw] bg-slate-400 bg-cover bg-center justify-end"
        // style="background-image: url('./img/restaurant2.jpg')"
        style={{ backgroundImage: `url(${restaurant2.src})` }}
        data-aos="fade-up"
        data-aos-duration="1000"
      >
        <div className="flex justify-end">
          <div className="h-[600px] flex flex-col justify-center gap-2">
            <div className="max-w-[600px] flex items-center gap-4 text-white">
              <p className="text-4xl md:text-6xl font-bold text-white">114</p>
              <p className="text-2xl md:text-4xl text-white">
                Cidades com experiências gastronômicas incríveis
              </p>
            </div>
            <div className="max-w-[450px] font-light text-xl text-white">
              <p>
                O Reserva Fácil está presente em mais de 100 cidades pelo
                Brasil, incluindo destinos turísticos adorados como Fortaleza,
                Rio de Janeiro, Maceió, Foz do Iguaçu, Campos do Jordão, Natal,
                Florianópolis, e muitos outros. Sua próxima experiência de
                primeira pode estar mais perto do que você imagina! 🤩
              </p>
            </div>

            <div className="max-w-[450px] flex w-full">
              <Link
                href="https://partners.reservafacil.site"
                target="_blank"
                rel="external"
              >
                <div className="max-w-[200px]">
                  <Button>Seja Licenciado</Button>
                </div>
              </Link>
            </div>
          </div>
        </div>
      </section>

      <section
        className="w-full md:h-[800px] bg-gradient-to-b from-orange-600 to-yellow-500 px-[10vw] py-8"
        data-aos="fade-up"
        data-aos-duration="1000"
      >
        <div className="md:h-[800px] flex flex-col justify-center">
          <div className="w-full flex flex-col md:flex-row gap-4 items-center justify-center">
            <div className="bg-white w-[280px] p-4 rounded-lg flex flex-col gap-2">
              <div className="text-yellow-400 flex gap-2">
                <IoStar />
                <IoStar />
                <IoStar />
                <IoStar />
                <IoStar />
              </div>
              <p className="text-slate-600 font-light">
                Simplesmente sensacional, pra quem tem alguma dúvida realmente
                existe sim, os descontos como o anunciado no aplicativo. E o
                tratamento nos estabelecimentos é igualzinho aos outros clientes
                em relação a tudo. Esse aplicativo mudou minha vida
                financeiramente.
              </p>
              <p className="font-bold">Marcelo Fraga</p>
            </div>
            <div className="bg-white w-[280px] p-4 rounded-lg flex flex-col gap-2">
              <div className="text-yellow-400 flex gap-2">
                <IoStar />
                <IoStar />
                <IoStar />
                <IoStar />
                <IoStar />
              </div>
              <p className="text-slate-600 font-light">
                Esse aplicativo é uma mão na roda! É tão simples de usar que até
                parece que adivinha o que você precisa. Quando você vai nos
                restaurantes então, é uma maravilha. Você reserva sua mesa com
                uma taxa bem pequena, e ao chegar lá, só precisa pagar metade da
                conta. Então é só chegar e curtir, sem precisar explicar nada. É
                tipo chegar e já ser esperado!
              </p>
              <p className="font-bold">Oswaldo Costa</p>
            </div>
            <div className="bg-white w-[280px] p-4 rounded-lg flex flex-col gap-2">
              <div className="text-yellow-400 flex gap-2">
                <IoStar />
                <IoStar />
                <IoStar />
                <IoStar />
                <IoStar />
              </div>
              <p className="text-slate-600 font-light">
                Simplesmente sensacional, pra quem tem alguma dúvida realmente
                existe sim, os descontos como o anunciado no aplicativo. E o
                tratamento nos estabelecimentos é igualzinho aos outros clientes
                em relação a tudo. Esse aplicativo mudou minha vida
                financeiramente.
              </p>
              <p className="font-bold">Adriana Freitas</p>
            </div>
          </div>

          <div className="w-full mt-8 text-center">
            <h1 className="text-white text-3xl md:text-5xl font-bold">
              Baixe agora o app e faça sua primeira reserva!
            </h1>
          </div>

          <div className="w-full mt-2 text-center">
            <h1 className="text-white text-xl">Acesse agora mesmo!</h1>
          </div>
          <div className="w-full flex justify-center mt-4">
            <Link
              href="https://app.reservafacil.site"
              target="_blank"
              rel="external"
            >
              <div className="max-w-[200px]">
                <Button>Acesse Aqui</Button>
              </div>
            </Link>
          </div>
        </div>
      </section>
    </>
  );
}
