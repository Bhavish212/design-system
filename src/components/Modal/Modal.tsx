import React from 'react';

interface ModalProps {
  title: string;
  description: string;
  isOpen: boolean;
  onClose: () => void;
}

export const Modal: React.FC<ModalProps> = ({ title, description, isOpen, onClose }) => {
  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
      <div className="bg-white dark:bg-gray-800 p-6 rounded-md shadow-md max-w-md w-full">
        <h2 className="text-lg font-semibold mb-2">{title}</h2>
        <p className="text-sm mb-4">{description}</p>
        <button onClick={onClose} className="mt-2 px-4 py-2 bg-blue-500 text-white rounded">Close</button>
      </div>
    </div>
  );
};
