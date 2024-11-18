import type { Metadata } from "next";
import { Inter } from "next/font/google";


import "./globals.css";

export const metadata: Metadata = {
  title: "Faça Login | Reserva Fácil",
  description:
    "Seu lugar garantido para momentos inesquecíveis | Reserva Fácil",
};

const inter = Inter({
  subsets: ["latin-ext"],
  display: "swap",
});

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="pt-br">
      <head>
        <link rel="shortcut icon" href="/favicon.png" type="image/x-icon" />
      </head>
      <body className={`${inter.className}`}>{children}  </body>
    </html>
  );
}
