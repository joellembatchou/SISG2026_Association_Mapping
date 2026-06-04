# Quarto Website Guide for SISG 2026

This guide explains how to build and maintain the SISG 2026 Association Mapping website using Quarto.

## Prerequisites

1. **Install Quarto**: Download from https://quarto.org/docs/get-started/
2. **Install R and RStudio** (already done)
3. **Install required R packages**:
   ```r
   install.packages(c("knitr", "rmarkdown", "dplyr", "kableExtra"))
   ```

## Quick Start

### 1. Convert existing files (one-time)
```bash
Rscript convert_to_quarto.R
```
This converts all `.Rmd` files in the `analysis/` directory to `.qmd` format.

### 2. Preview your site locally
```bash
quarto preview
```
This opens a browser window with live preview. Changes to files will auto-refresh.

### 3. Build the site
```bash
quarto render
```
This generates HTML files in the `docs/` directory.

### 4. Publish to GitHub Pages
```bash
quarto publish gh-pages
```
This publishes your site to GitHub Pages automatically.

## Convenience Script

Use the provided `build_website.sh` script:

```bash
# Convert Rmd files
./build_website.sh convert

# Preview locally
./build_website.sh preview

# Render the site
./build_website.sh render

# Publish to GitHub
./build_website.sh publish

# Do all steps at once
./build_website.sh all
```

## File Structure

```
SISG2026_Association_Mapping/
├── _quarto.yml           # Main configuration file
├── index.qmd             # Home page
├── styles.css            # Custom CSS styling
├── analysis/             # All practical exercises
│   ├── QG3_*.qmd        # Practical files
│   └── QG3_*_Key.qmd    # Answer keys (hidden initially)
├── docs/                 # Generated website (Git Pages serves from here)
└── data/                 # Course datasets
```

## Common Tasks

### Adding a new practical

1. Create new `.qmd` file in `analysis/` directory
2. Add to `_quarto.yml` under `navbar -> Practicals -> menu`
3. Render and preview

### Revealing answer keys

When ready to reveal answer keys after a session:

1. Edit `_quarto.yml`
2. Add an "Answer Keys" menu item to the navbar:
   ```yaml
   - text: "Answer Keys"
     menu:
       - text: "Session 1: Association Testing"
         href: analysis/QG3_Association_Testing_practical_Key.qmd
   ```
3. Render and publish

### Customizing appearance

- **Change theme**: Edit `theme: cosmo` in `_quarto.yml` (options: cosmo, flatly, darkly, etc.)
- **Custom CSS**: Edit `styles.css`
- **Navbar color**: Change `background: primary` in `_quarto.yml`

## Quarto vs workflowr

### Advantages of Quarto:
- ✅ Modern, professional design
- ✅ Better default themes
- ✅ Active development (backed by Posit/RStudio)
- ✅ Multi-language support (R, Python, Julia)
- ✅ Better code tools (folding, copying)
- ✅ Easier customization

### What you lose from workflowr:
- Git integration is less automated (but still easy)
- Less emphasis on reproducibility tracking
- Need to manage versioning yourself if desired

## GitHub Pages Setup

To host on GitHub Pages:

1. Push your repository to GitHub
2. Run `quarto publish gh-pages` (first time setup)
3. This creates a `gh-pages` branch automatically
4. GitHub Actions will deploy updates automatically

Or manually:
1. Build site: `quarto render`
2. Commit `docs/` directory
3. In GitHub repo settings: Pages → Source → Deploy from branch `main` → `/docs`

## Tips

- Use `quarto preview` during development for live updates
- The `freeze: auto` setting caches R code execution for faster builds
- Code tools are enabled (`code-tools: true`) so students can copy code easily
- Tables use `kableExtra` for nice formatting

## Troubleshooting

**Issue**: Quarto not found
- **Fix**: Install from https://quarto.org or use `brew install quarto` (Mac)

**Issue**: R packages missing
- **Fix**: Run the install commands in the Prerequisites section

**Issue**: Changes not showing
- **Fix**: Stop preview and run `quarto render` to force a full rebuild

## Resources

- [Quarto Documentation](https://quarto.org/docs/guide/)
- [Quarto Websites Guide](https://quarto.org/docs/websites/)
- [GitHub Pages with Quarto](https://quarto.org/docs/publishing/github-pages.html)
- [Quarto Themes Gallery](https://quarto.org/docs/output-formats/html-themes.html)
