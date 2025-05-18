import React, { useState } from 'react';
import { Meta, StoryFn } from '@storybook/react';
import { Modal } from './Modal';

export default {
  title: 'Components/Modal',
  component: Modal,
} as Meta<typeof Modal>;

export const Basic: StoryFn = () => {
  const [open, setOpen] = useState(true);

  return (
    <div className="min-h-screen bg-gray-100 dark:bg-gray-900 flex flex-col items-center justify-center gap-4 p-8">
      <button
        onClick={() => setOpen(true)}
        className="px-4 py-2 bg-blue-500 text-white rounded"
      >
        Open Modal
      </button>
      <Modal
        isOpen={open}
        title="Confirm Action"
        description="Are you sure you want to proceed?"
        onClose={() => setOpen(false)}
      />
    </div>
  );
};
