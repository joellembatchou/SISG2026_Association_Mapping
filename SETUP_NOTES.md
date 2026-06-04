# SISG 2026 QG3 Website Setup Notes

## Summary
This website has been created for SISG 2026 based on the 2025 structure.

## Key Changes Made

### 1. Instructors Updated
- Changed from "Joelle Mbatchou & Michael Epstein" to "Joelle Mbatchou & Moeen Riaz"

### 2. Dates Updated
- **Monday**: June 8th, 2026 (was June 9th, 2025)
- **Tuesday**: June 9th, 2026 (was June 10th, 2025)
- **Wednesday**: June 10th, 2026 (was June 11th, 2025)

### 3. Practical Solutions (Keys) Hidden
- All "Key" columns in the schedule tables now show empty strings
- The *_Key.Rmd files are kept locally but excluded from git tracking via .gitignore
- The *_Key.html files in docs/ are also excluded from git tracking
- Updated intro text to remove mention of "solutions"

### 4. Files Updated
- `/analysis/index.Rmd` - Main website homepage with updated schedule and instructors
- `/analysis/_site.yml` - Updated navbar title and GitHub link to 2026
- `/README.md` - Updated all references from 2025 to 2026
- `SISG2026_Association_Mapping.Rproj` - Renamed project file
- `.gitignore` - Created to exclude Key files and other non-public materials

### 5. Files Kept (not tracked in git)
- All `*_Key.Rmd` files in analysis/
- All `*_Key.html` files in docs/
- exe/, lectures/, mk_website.R, notes.txt, tmp/

## Next Steps

1. **Initialize git repository** (if publishing to GitHub):
   ```bash
   cd "/path/to/SISG2026_Association_Mapping"
   git init
   git add .
   git commit -m "Initial commit for SISG 2026 website"
   ```

2. **Build the website** using workflowr:
   ```R
   library(workflowr)
   wflow_build()
   wflow_publish("analysis/index.Rmd", "Update for 2026")
   ```

3. **Update lecture slides links** - The Box links currently point to 2025 lectures. Update these when 2026 slides are ready.

4. **Update data links** - Verify the Box folder link for datasets is correct for 2026.

## Schedule Summary
- **10 sessions** total over 3 days (June 8-10, 2026)
- Same session structure as 2025
- Practical exercises included but solutions hidden from public website

## Contact
Instructors: Joelle Mbatchou & Moeen Riaz
