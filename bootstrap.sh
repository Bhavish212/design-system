#!/bin/bash

echo "🔧 Creating folders..."
mkdir -p .storybook
mkdir -p src/{components,styles}
mkdir -p src/components/{Typography,Dropdown,Checkbox,Toast,Modal}

echo "📄 Writing tailwind.css..."
cat > src/styles/tailwind.css <<EOL
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL

echo "⚙️ Writing tailwind.config.js..."
cat > tailwind.config.js <<EOL
module.exports = {
  content: ["./src/**/*.{js,ts,jsx,tsx}"],
  darkMode: "class",
  theme: {
    extend: {},
  },
  plugins: [],
};
EOL

echo "⚙️ Writing postcss.config.js..."
cat > postcss.config.js <<EOL
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
};
EOL

echo "📦 Writing tsconfig.json..."
cat > tsconfig.json <<EOL
{
  "compilerOptions": {
    "target": "ESNext",
    "useDefineForClassFields": true,
    "lib": ["DOM", "DOM.Iterable", "ESNext"],
    "module": "ESNext",
    "moduleResolution": "Node",
    "strict": true,
    "jsx": "react-jsx",
    "esModuleInterop": true,
    "skipLibCheck": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true
  },
  "include": ["src", ".storybook"]
}
EOL

echo "🧩 Writing .storybook/main.ts..."
cat > .storybook/main.ts <<EOL
import type { StorybookConfig } from '@storybook/react-vite';

const config: StorybookConfig = {
  stories: ['../src/**/*.stories.@(js|ts|jsx|tsx)'],
  addons: ['@storybook/addon-essentials', '@storybook/addon-interactions'],
  framework: {
    name: '@storybook/react-vite',
    options: {},
  },
  docs: { autodocs: true }
};
export default config;
EOL

echo "🧩 Writing .storybook/preview.ts..."
cat > .storybook/preview.ts <<EOL
import '../src/styles/tailwind.css';

export const parameters = {
  actions: { argTypesRegex: '^on.*' },
  controls: { matchers: { color: /(background|color)$/i, date: /Date$/ } },
};
EOL

# Typography
cat > src/components/Typography/Typography.tsx <<'EOL'
import React from 'react';

interface TypographyProps {
  variant: 'h1' | 'h2' | 'h3' | 'h4' | 'h5' | 'h6' | 'p' | 'label' | 'caption' | 'helper';
  children: React.ReactNode;
  className?: string;
}

export const Typography: React.FC<TypographyProps> = ({ variant, children, className }) => {
  const baseStyles: Record<string, string> = {
    h1: 'text-4xl font-bold',
    h2: 'text-3xl font-semibold',
    h3: 'text-2xl font-semibold',
    h4: 'text-xl font-medium',
    h5: 'text-lg font-medium',
    h6: 'text-base font-medium',
    p: 'text-base',
    label: 'text-sm font-medium',
    caption: 'text-xs text-gray-500',
    helper: 'text-sm text-gray-400 italic',
  };

  const Tag = variant === 'p' || variant === 'label' || variant === 'caption' || variant === 'helper' ? 'span' : variant;

  return <Tag className={`${baseStyles[variant]} ${className}`}>{children}</Tag>;
};
EOL

cat > src/components/Typography/Typography.stories.tsx <<'EOL'
import React from 'react';
import { Typography } from './Typography';

export default {
  title: 'Components/Typography',
  component: Typography,
};

export const All = () => (
  <>
    <Typography variant="h1">Heading 1</Typography>
    <Typography variant="p">This is a paragraph.</Typography>
    <Typography variant="caption">Caption text</Typography>
  </>
);
EOL

# Dropdown
cat > src/components/Dropdown/Dropdown.tsx <<'EOL'
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
EOL

cat > src/components/Dropdown/Dropdown.stories.tsx <<'EOL'
import React from 'react';
import { Dropdown } from './Dropdown';

export default {
  title: 'Components/Dropdown',
  component: Dropdown,
};

export const Basic = () => (
  <Dropdown options={['One', 'Two']} onChange={console.log} />
);
EOL

# Checkbox
cat > src/components/Checkbox/Checkbox.tsx <<'EOL'
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
EOL

cat > src/components/Checkbox/Checkbox.stories.tsx <<'EOL'
import React, { useState } from 'react';
import { Checkbox } from './Checkbox';

export default {
  title: 'Components/Checkbox',
  component: Checkbox,
};

export const Basic = () => {
  const [checked, setChecked] = useState(false);
  return <Checkbox label="Accept" checked={checked} onChange={() => setChecked(!checked)} />;
};
EOL

# Toast
cat > src/components/Toast/Toast.tsx <<'EOL'
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
EOL

cat > src/components/Toast/Toast.stories.tsx <<'EOL'
import React from 'react';
import { Toast } from './Toast';

export default {
  title: 'Components/Toast',
  component: Toast,
};

export const Success = () => <Toast type="success" message="Saved successfully!" />;
EOL

# Modal
cat > src/components/Modal/Modal.tsx <<'EOL'
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
EOL

cat > src/components/Modal/Modal.stories.tsx <<'EOL'
import React, { useState } from 'react';
import { Modal } from './Modal';

export default {
  title: 'Components/Modal',
  component: Modal,
};

export const Basic = () => {
  const [open, setOpen] = useState(true);
  return (
    <>
      <Modal title="Confirm Action" description="Are you sure?" isOpen={open} onClose={() => setOpen(false)} />
      <button onClick={() => setOpen(true)}>Open Modal</button>
    </>
  );
};
EOL

echo "✅ All files and code have been generated!"
