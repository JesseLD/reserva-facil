import type { Metadata } from "next";
import { Inter } from "next/font/google";

import "./globals.css";

export const metadata: Metadata = {
  title: "Seu lugar garantido | Reserva Fácil",
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
      <body className={`${inter.className}`}>
        {children} <input type="hidden" name="app-version" value={"1.0.0"} />
      </body>
    </html>
  );
}
