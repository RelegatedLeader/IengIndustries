/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
  ],
  theme: {
    extend: {
      colors: {
        'slate': {
          '900': '#0f172a',
          '800': '#1e293b',
          '700': '#334155',
        },
      },
      backdropBlur: {
        'xl': '20px',
      },
    },
  },
  plugins: [],
  darkMode: 'selector',
}
