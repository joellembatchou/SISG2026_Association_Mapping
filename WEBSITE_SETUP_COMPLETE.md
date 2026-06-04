# Quarto Website Setup - COMPLETE ✓

## What Was Done

Your SISG 2026 Association Mapping website has been successfully converted from workflowr to Quarto!

### Files Created

1. **`_quarto.yml`** - Main configuration file with navigation menu
2. **`index.qmd`** - Home page (converted from index.Rmd)
3. **`styles.css`** - Custom CSS for styling
4. **`convert_to_quarto.R`** - R script to convert Rmd→qmd
5. **`build_website.sh`** - Shell script for common tasks
6. **`QUARTO_GUIDE.md`** - Complete documentation
7. **All analysis/*.qmd files** - Converted from .Rmd files

### Rendered Output

- Website built in `docs/` directory
- Answer key files excluded from rendering (since they're hidden)
- Code chunks set to not evaluate (since executables aren't available)

## Current Status

✅ Quarto installed (v1.9.38)
✅ All .Rmd files converted to .qmd
✅ Website rendered successfully
✅ Answer keys hidden from navigation
✅ Site opened in your browser

## Next Steps

### To preview locally during development:
```bash
quarto preview
```

### To rebuild the site:
```bash
quarto render
```

### To publish to GitHub Pages:

**Option 1: Automated (recommended)**
```bash
quarto publish gh-pages
```

**Option 2: Manual**
1. Commit all changes including the `docs/` directory
2. Push to GitHub
3. In GitHub repo settings: Settings → Pages → Source → Branch: `main` → Folder: `/docs`

### To reveal answer keys after a session:

Edit `_quarto.yml` and add this section to the navbar:
```yaml
- text: "Answer Keys"
  menu:
    - text: "Session 1: Association Testing"
      href: analysis/QG3_Association_Testing_practical_Key.qmd
    # ... add more as needed
```

Then update the render section to include the keys:
```yaml
project:
  render:
    - "*.qmd"
    - "analysis/QG3_*_practical.qmd"
    - "analysis/QG3_Association_Testing_practical_Key.qmd"  # Add each key
```

Finally, render and publish:
```bash
quarto render
quarto publish gh-pages
```

## Maintenance Tips

- **Add new practical**: Create `.qmd` file in `analysis/`, add to `_quarto.yml` menu, render
- **Update styling**: Edit `styles.css`
- **Change theme**: Edit `theme: cosmo` in `_quarto.yml` (options: flatly, darkly, cosmo, etc.)
- **Preview changes**: Always run `quarto preview` while editing

## Advantages Over workflowr

✅ Modern, professional design  
✅ Better navigation with dropdown menus  
✅ Code tools (copy button, folding)  
✅ Responsive mobile design  
✅ Active development and support  
✅ Easier customization  

## File Locations

- **Source files**: `*.qmd` and `analysis/*.qmd`
- **Rendered site**: `docs/`
- **Configuration**: `_quarto.yml`
- **Custom styles**: `styles.css`

## Troubleshooting

**Issue**: Changes not showing
- **Fix**: Run `quarto render` to force a rebuild

**Issue**: Want to execute R code in practicals
- **Fix**: Remove `eval: false` from `_quarto.yml` and ensure all required tools (PLINK, REGENIE, etc.) are available

**Issue**: Answer keys showing up
- **Fix**: Check the `render:` section in `_quarto.yml` excludes `*_Key.qmd` files

## Resources

- Full guide: `QUARTO_GUIDE.md`
- Quarto docs: https://quarto.org/docs/websites/
- Your rendered site: Open `docs/index.html` in browser
