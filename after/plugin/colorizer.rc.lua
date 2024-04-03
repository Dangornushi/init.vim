local status,color = pcall(require,"colorizer")
if (not status) then return end

color.setup{
  'css';
  'scss';
}

-- CSSにある色コードに色を当ててくれる
require'colorizer'.setup(config, {
  RRGGBBAA = true;
  rgb_fn = true;
  hsl_fn = true;
})