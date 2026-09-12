const autoprefixer = require("autoprefixer");
const prefixCustomProperties = require("postcss-prefix-custom-properties");

module.exports = {
  plugins: [
    autoprefixer,
    prefixCustomProperties({
      prefix: "tblr-",
      ignore: [
        /^--tblr-/,
        /^--bs-/,
        /^--fc-/,
        /^--gl-/,
        /^--litepicker-/,
        /^--plyr-/,
        /^--ts-/,
        "--section-bg",
      ],
    }),
  ],
};
