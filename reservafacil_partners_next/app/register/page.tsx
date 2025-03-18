"use client";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import MaskedInput from "@/components/ui/masked-input";
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group";
import Header from "@/components/widgets/header";
import React, { useEffect, useState } from "react";
import { states } from "@/utils/states";
import { storeCategories, StoreCategory } from "@/utils/store-category";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Button } from "@/components/ui/button";

export default function Page() {
  const [useCPF, setUseCPF] = useState("CPF");
  const [cpf, setCPF] = useState("");
  const [cnpj, setCNPJ] = useState("");

  const [cep, setCep] = useState("");
  const [userState, setUserState] = useState("");
  const [city, setCity] = useState("");
  const [birth, setBirth] = useState("");

  useEffect(() => {
    if (cep.length === 9) {
      fetch(`https://viacep.com.br/ws/${cep}/json/`)
        .then((response) => response.json())
        .then((data) => {
          console.log(data);
          setUserState(data.uf);
          setCity(data.localidade);
        });
    }
  }, [cep]);


  return (
    <div className="flex flex-col bg-neutral-100 w-full">
      <Header disableButtons />
      <div className="w-full px-[5vw] h-full lg:px-[24vw] mt-4">
        <h1 className="my-8 text-2xl font-bold">Cadastre Sua Loja</h1>
        <hr className="my-8" />
        <h2 className="my-4 text-xl font-bold">Informações Pessoais</h2>
        <Input placeholder="Nome Completo" name="fullname" type="text" />
        <div className="grid grid-cols-3 gap-4 my-4">
          <Input placeholder="Celular" name="phone" type="phone" />
          <Input placeholder="Email" name="email" type="email" />
          <MaskedInput
            onChange={setBirth}
            value={birth}
            mask="00/00/0000"
            placeholder="Data de Nascimento"
          />
        </div>
        <hr className="my-8" />
        <h2 className="my-4 text-xl font-bold">Endereço</h2>
        <div className="grid grid-cols-3 gap-4 my-4">
          <MaskedInput
            onChange={setCep}
            value={cep}
            mask="00000-000"
            placeholder="CEP"
          />

          <Select
            value={userState}
            onValueChange={(newState) => {
              setUserState(newState);
              console.log(newState);
            }}
          >
            <SelectTrigger>
              <SelectValue placeholder="Estado" />
            </SelectTrigger>
            <SelectContent>
              {states.map((state) => (
                <SelectItem key={state.uf} value={state.uf}>
                  {state.name}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>

          <Input
            placeholder="Cidade"
            name="city"
            type="text"
            value={city}
            onChange={(e) => {
              setCity(e.target.value);
            }}
          />
        </div>
        <div className="grid grid-cols-3 gap-4 my-4">
          <Input placeholder="Bairro" name="neighborhood" type="text" />
          <Input placeholder="Endereço" name="address" type="text" />
          <Input placeholder="Número" name="number" type="number" />
        </div>
        <Input
          placeholder="Complemento"
          name="complement"
          type="text"
          readOnly
        />
        
        <h2 className="my-4 text-xl font-bold">Informações Fiscais</h2>
        <RadioGroup defaultValue="cpf" className="flex gap-4 my-4">
          <div
            className="flex items-center space-x-2"
            onClick={() => setUseCPF("CPF")}
          >
            <RadioGroupItem value="cpf" id="r1" />
            <Label htmlFor="r1">CPF</Label>
          </div>
          <div
            className="flex items-center space-x-2"
            onClick={() => setUseCPF("CNPJ")}
          >
            <RadioGroupItem value="cnpj" id="r2" />
            <Label htmlFor="r2">CNPJ</Label>
          </div>
        </RadioGroup>
        {useCPF === "CPF" ? (
          <MaskedInput
            onChange={setCPF}
            value={cpf}
            mask="000.000.000-00"
            placeholder="CPF"
          />
        ) : (
          <MaskedInput
            onChange={setCNPJ}
            value={cnpj}
            mask="00.000.000/0000-00"
            placeholder="CNPJ"
          />
        )}
        <div className="my-2"></div>
        <Select
          // value={userState}
          onValueChange={(newState) => {
            // setUserState(newState)
            console.log(newState);
          }}
        >
          <SelectTrigger>
            <SelectValue placeholder="Especialidade" />
          </SelectTrigger>
          <SelectContent>
            {storeCategories.map((category: StoreCategory) => (
              <SelectItem key={category.id} value={category.id.toString()}>
                {category.name}
              </SelectItem>
            ))}
          </SelectContent>
        </Select>

        <hr className="my-12" />

        <div className="w-full flex justify-end">
          <Button size={"xl"}>Cadastrar</Button>
        </div>

        <div className="my-12"></div>
      </div>
    </div>
  );
}
