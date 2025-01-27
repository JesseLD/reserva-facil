import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import favicon from "./favicon.png";

const inter = Inter({
  variable: "--font-inter",
  subsets: ["latin"],
})

export const metadata: Metadata = {
  title: "Parceiros | Reserva Fácil",
  description: "Crie e Gerencie sua loja de forma fácil e rápida",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="pt-br">
      <link rel="shortcut icon" href={favicon.src} type="image/x-icon" />
      <body
        className={`${inter.variable}  antialiased`}
      >
        {children}
      </body>
    </html>
  );
}
