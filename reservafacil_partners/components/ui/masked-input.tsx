import React, { useEffect, useRef } from 'react';
import IMask from 'imask';
import { Input } from './input';

interface MaskedInputProps {
  mask: string;
  placeholder: string;
  value: string;
  onChange: (value: string) => void;
}

const MaskedInput: React.FC<MaskedInputProps> = ({ mask, placeholder, value, onChange }) => {
  const inputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    if (inputRef.current) {
      const maskInstance = IMask(inputRef.current, {
        mask: mask,
      });

      return () => {
        // Cleanup the mask instance when the component unmounts
        maskInstance.destroy();
      };
    }
  }, [mask]);

  return (
    <div className="space-y-2">
      <Input
        ref={inputRef}
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder={placeholder}
        className="input"
      />
    </div>
  );
};

export default MaskedInput;
