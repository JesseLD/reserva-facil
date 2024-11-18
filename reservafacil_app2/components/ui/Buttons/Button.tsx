import React from 'react'

type ButtonProps = {
  children?: React.ReactNode;
  onClick?: () => void;
  type?: "button" | "submit" | "reset";
  disabled?: boolean;
  className?: string;
  variant?: "primary" | "secondary" | "tertiary";
  text: string;
  // size?: "sm" | "md" | "lg";
 }

export default function Button( { children = null, onClick, type, disabled, className, variant, text }: ButtonProps ) {
  return (
    <button
      onClick={onClick}
      type={type}
      disabled={disabled}
      className={` p-2 md:p-4 w-full rounded-md font-bold hover:brightness-90 cursor-pointer transition-all ${className} ${variant === "primary" ? "bg-orange-500 text-white " : variant === "secondary" ? "bg-transparent border-2 border-orange-500 text-orange-500" : "bg-white text-black"}`}
    >
      {text}

      {children}
    </button>
  )
}
