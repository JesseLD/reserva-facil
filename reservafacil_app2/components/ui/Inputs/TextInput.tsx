"use client";
import React from "react";

type TextInputProps = {
  placeholder: string;
  type: string;
  id?: string;
  name: string;
  value?: string;
  className?: string;
  required?: boolean;
  readonly?: boolean;
  onChange?: (e: React.ChangeEvent<HTMLInputElement>) => void;
  min?: number;
  max?: number;
};
export default function TextInput({
  placeholder,
  type,
  id,
  name,
  value,
  className,
  required,
  readonly,
  onChange,
  min,
  max,
}: TextInputProps) {
  return (
    <input
      className={`${
        className || ""
      } outline-none p-2 lg:p-4 border-slate-300 border-[1px] rounded-md w-full text-slate-600 focus:ring-1 focus:ring-orange-500 focus:border-orange-500 hover:border-orange-500 hover:ring-orange-500 hover:ring-1 cursor-pointer transition-all `}
      type={type}
      name={name}
      placeholder={placeholder}
      value={value}
      id={id}
      readOnly={readonly ?? false}
      required={required ?? false}
      max={max}
      min={min}
      onChange={(e) => {
        console.log(e.target.value);
        if (onChange) {
          onChange(e);
        }
      }}
    />
  );
}
