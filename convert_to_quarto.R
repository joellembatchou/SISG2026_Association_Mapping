### Script to convert .Rmd files to .qmd for Quarto
library(stringr)

# Function to convert Rmd YAML header to Quarto format
convert_rmd_to_qmd <- function(rmd_file, qmd_file) {

  # Read the Rmd file
  lines <- readLines(rmd_file)

  # Find YAML header boundaries
  yaml_start <- which(lines == "---")[1]
  yaml_end <- which(lines == "---")[2]

  if(is.na(yaml_start) || is.na(yaml_end)) {
    warning(paste("No YAML header found in", rmd_file))
    return(FALSE)
  }

  # Extract YAML content
  yaml_lines <- lines[(yaml_start+1):(yaml_end-1)]

  # Remove workflowr-specific lines
  yaml_lines <- yaml_lines[!grepl("^site:|^output:", yaml_lines)]
  yaml_lines <- yaml_lines[!grepl("workflowr::", yaml_lines)]
  yaml_lines <- yaml_lines[!grepl("editor_options:", yaml_lines)]
  yaml_lines <- yaml_lines[!grepl("chunk_output_type:", yaml_lines)]

  # Get content after YAML
  content_lines <- lines[(yaml_end+1):length(lines)]

  # Write new qmd file
  writeLines(c(
    "---",
    yaml_lines,
    "---",
    "",
    content_lines
  ), qmd_file)

  cat("Converted:", rmd_file, "->", qmd_file, "\n")
  return(TRUE)
}

# Convert all Rmd files in analysis directory
rmd_files <- list.files("analysis", pattern = "\\.Rmd$", full.names = TRUE)

for(rmd_file in rmd_files) {
  qmd_file <- str_replace(rmd_file, "\\.Rmd$", ".qmd")
  convert_rmd_to_qmd(rmd_file, qmd_file)
}

cat("\nConversion complete!\n")
cat("Next steps:\n")
cat("1. Preview the site: quarto preview\n")
cat("2. Render the site: quarto render\n")
cat("3. Publish to GitHub Pages: quarto publish gh-pages\n")
