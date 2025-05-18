import '../src/styles/tailwind.css';

export const parameters = {
  actions: { argTypesRegex: '^on.*' },
  controls: { matchers: { color: /(background|color)$/i, date: /Date$/ } },
};
