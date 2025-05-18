import React from 'react';

interface CheckboxProps {
  label: string;
  checked: boolean;
  onChange: () => void;
}

export const Checkbox: React.FC<CheckboxProps> = ({ label, checked, onChange }) => (
  <label className="inline-flex items-center space-x-2">
    <input type="checkbox" checked={checked} onChange={onChange} className="form-checkbox" />
    <span>{label}</span>
  </label>
);
