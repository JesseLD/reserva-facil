import type { NextConfig } from "next";

const cspHeader = `
  default-src 'self';
  script-src 'self' 'nonce-abc123';
  style-src 'self' 'nonce-abc123';
  img-src 'self' https:;
  font-src 'self' https:;
  object-src 'none';
  base-uri 'self';
  form-action 'self';
  frame-ancestors 'none';
  upgrade-insecure-requests;
`;

const securityHeaders = [
  {
    key: "Strict-Transport-Security",
    value: "max-age=63072000; includeSubDomains; preload", // Força HTTPS em todo o domínio
  },
  {
    key: "X-Content-Type-Options",
    value: "nosniff", // Evita a interpretação incorreta de tipos de conteúdo
  },
  {
    key: "X-Frame-Options",
    value: "DENY", // Bloqueia o carregamento em iframes
  },
  {
    key: "Referrer-Policy",
    value: "no-referrer", // Não envia o cabeçalho Referer
  },
  {
    key: "Permissions-Policy",
    value: `
      geolocation=(),
      microphone=(),
      camera=(),
      payment=(),
      usb=(),
      fullscreen=()
    `.replace(/\n/g, ""), // Limita permissões do navegador
  },
  {
    key: "Content-Security-Policy",
    value: cspHeader.replace(/\n/g, ""), // Aplica a política CSP
  },
];

const nextConfig: NextConfig = {
  async headers() {
    return [
      {
        source: "/(.*)",
        headers: securityHeaders,
      },
    ];
  },
};

export default nextConfig;
