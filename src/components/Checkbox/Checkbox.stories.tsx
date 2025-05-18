import React, { useState } from 'react';
import { Meta, StoryFn } from '@storybook/react';
import { Checkbox } from './Checkbox';

export default {
  title: 'Components/Checkbox',
  component: Checkbox,
} as Meta<typeof Checkbox>;

export const Basic: StoryFn = () => {
  const [checked, setChecked] = useState(false);

  return (
    <div className="min-h-screen bg-gray-100 dark:bg-gray-900 flex items-center justify-center p-8">
      <Checkbox
        label="Accept Terms and Conditions"
        checked={checked}
        onChange={() => setChecked(!checked)}
      />
    </div>
  );
};
