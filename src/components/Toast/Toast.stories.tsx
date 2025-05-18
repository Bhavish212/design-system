import React from 'react';
import { Meta, StoryFn } from '@storybook/react';
import { Toast } from './Toast';

export default {
  title: 'Components/Toast',
  component: Toast,
} as Meta<typeof Toast>;

export const Success: StoryFn = () => (
  <div className="min-h-screen bg-gray-100 dark:bg-gray-900 flex items-center justify-center p-8">
    <Toast type="success" message="Task completed successfully!" />
  </div>
);

export const Error: StoryFn = () => (
  <div className="min-h-screen bg-gray-100 dark:bg-gray-900 flex items-center justify-center p-8">
    <Toast type="error" message="Something went wrong." />
  </div>
);
