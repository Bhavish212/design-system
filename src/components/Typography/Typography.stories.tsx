import React from 'react';
import { Meta, StoryFn } from '@storybook/react';
import { Typography } from './Typography';

export default {
  title: 'Components/Typography',
  component: Typography,
} as Meta<typeof Typography>;

export const All: StoryFn = () => (
  <div className="p-10 space-y-4 bg-gray-100 dark:bg-gray-900 text-black dark:text-white">
    <Typography variant="h1">Heading 1</Typography>
    <Typography variant="h2">Heading 2</Typography>
    <Typography variant="h3">Heading 3</Typography>
    <Typography variant="p">This is a paragraph.</Typography>
    <Typography variant="label">Form Label</Typography>
    <Typography variant="caption">Caption text</Typography>
    <Typography variant="helper">Helper text</Typography>
  </div>
);
