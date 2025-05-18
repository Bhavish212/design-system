import React from 'react';

interface ToastProps {
  type: 'success' | 'error' | 'info' | 'warning';
  message: string;
}

export const Toast: React.FC<ToastProps> = ({ type, message }) => {
  const colors: Record<string, string> = {
    success: 'bg-green-100 text-green-800',
    error: 'bg-red-100 text-red-800',
    info: 'bg-blue-100 text-blue-800',
    warning: 'bg-yellow-100 text-yellow-800',
  };

  return <div className={`px-4 py-2 rounded ${colors[type]}`}>{message}</div>;
};
