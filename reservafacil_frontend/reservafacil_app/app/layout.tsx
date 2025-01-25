import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";

const inter = Inter({
  subsets: ["latin-ext"],
  display: "swap",
});

export const metadata: Metadata = {
  title: "Seu lugar garantido | Reserva Fácil",
  description:
    "Seu lugar garantido para momentos inesquecíveis | Reserva Fácil",
};

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
      <body className={`${inter.className} antialiased`}>
        {children}
        <input type="hidden" name="app-version" value={"1.0.0"} />
      </body>
    </html>
  );
}
