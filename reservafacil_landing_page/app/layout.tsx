import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import Header from "@/components/widgets/Header";
import favicon from "@/app/favicon.png";
import Footer from "@/components/widgets/Footer";

const inter  = Inter({
  variable: "--font-inter",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Seu lugar garantido para momentos inesquecíveis | Reserva Fácil",
  description: "Reserve Fácil é o seu lugar para momentos inesquecíveis",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="pt-br">
      <head>
        <link rel="shortcut icon" href={favicon.src} type="image/x-icon" />
      </head>
      <body
        className={`${inter.variable} antialiased`}
      >
        <Header/>
        {children}
        <Footer/>
      </body>
    </html>
  );
}
