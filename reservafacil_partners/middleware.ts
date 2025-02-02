import { NextRequest, NextResponse } from "next/server";

export function middleware(req: NextRequest) {
  
  const token = req.cookies.get("token") ?? true;

  const publicRoutes = ["","login", "register"];


  // console.log("PATH: " +req.nextUrl.pathname);
  
  if (publicRoutes.some((route) => req.nextUrl.pathname.startsWith(`/${route}`))) {
    return NextResponse.next();
  }
  

  // Check if the user is authenticated

  if (!token) {
    return NextResponse.redirect(new URL("/login", req.url));
  }
}

export const config = {
  matcher: [
    // "/:path*",
    "/((?!_next/static|_next/image|favicon.png|/login|/register).*)",
  ],
};
