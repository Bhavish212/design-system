import React from 'react';

interface DropdownProps {
  options: string[];
  onChange: (value: string) => void;
}

export const Dropdown: React.FC<DropdownProps> = ({ options, onChange }) => (
  <select
    className="border px-4 py-2 rounded-md"
    onChange={(e) => onChange(e.target.value)}
  >
    {options.map((opt) => (
      <option key={opt} value={opt}>{opt}</option>
    ))}
  </select>
);
