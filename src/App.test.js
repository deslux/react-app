import React from 'react';
import { render } from '@testing-library/react';
import App from './App';

test('check for of course', () => {
  const { getByText } = render(<App />);
  const linkElement = getByText(/Of course/i);
  expect(linkElement).toBeInTheDocument();
});