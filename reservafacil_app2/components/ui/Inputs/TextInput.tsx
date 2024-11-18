import React from "react";

type TextInputProps = {
  placeholder: string;
  type: string;
  id?: string;
  name: string;
  value?: string;
  className?: string;
};
export default function TextInput({
  placeholder,
  type,
  id,
  name,
  value,
  className,
}: TextInputProps) {
  return (
    <input
      className={`${className} outline-none p-2 md:p-4 border-slate-300 border-[1px] rounded-md w-full text-slate-600 focus:ring-1 focus:ring-orange-500 focus:border-orange-500 hover:border-orange-500 hover:ring-orange-500 hover:ring-1 cursor-pointer transition-all `}
      type={type}
      name={name}
      placeholder={placeholder}
      value={value}
      id={id}
    />
  );
}
