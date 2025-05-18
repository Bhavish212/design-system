import React from 'react';
import { Meta, StoryFn } from '@storybook/react';
import { Dropdown } from './Dropdown';

export default {
  title: 'Components/Dropdown',
  component: Dropdown,
} as Meta<typeof Dropdown>;

export const Basic: StoryFn = () => {
  return (
    <div className="min-h-screen bg-gray-100 dark:bg-gray-900 flex items-center justify-center p-8">
      <Dropdown
        options={['Option 1', 'Option 2', 'Option 3']}
        onChange={(val) => alert(`Selected: ${val}`)}
      />
    </div>
  );
};
