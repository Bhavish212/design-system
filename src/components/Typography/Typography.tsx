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
