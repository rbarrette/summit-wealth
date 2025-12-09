/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,ts,tsx}'],
  theme: {
    extend: {
      colors: {
        primary: '#0A2540', // Deep, authoritative Navy Blue
        secondary: '#C5A059', // Muted Gold/Beige for accents
        'brand-neutral': '#fdfbf7', // Subtle warm-white for section backgrounds
      },
      fontFamily: {
        sans: ['Lato', 'sans-serif'], // Clean, readable sans-serif
        serif: ['Playfair Display', 'serif'], // Editorial/Storytelling vibe for headings
      },
    },
  },
  plugins: [],
};
