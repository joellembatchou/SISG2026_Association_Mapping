#!/bin/bash
### Script to build and publish the Quarto website

# Function to display usage
usage() {
    echo "Usage: $0 [command]"
    echo ""
    echo "Commands:"
    echo "  convert   - Convert all .Rmd files to .qmd"
    echo "  preview   - Preview the website locally"
    echo "  render    - Build the website"
    echo "  publish   - Publish to GitHub Pages"
    echo "  all       - Convert, render, and publish"
    echo ""
}

# Convert Rmd to qmd
convert() {
    echo "Converting .Rmd files to .qmd..."
    Rscript convert_to_quarto.R
}

# Preview the site
preview() {
    echo "Starting preview server..."
    quarto preview
}

# Render the site
render() {
    echo "Rendering website..."
    quarto render
}

# Publish to GitHub Pages
publish() {
    echo "Publishing to GitHub Pages..."
    quarto publish gh-pages --no-prompt
}

# Main logic
case "$1" in
    convert)
        convert
        ;;
    preview)
        preview
        ;;
    render)
        render
        ;;
    publish)
        publish
        ;;
    all)
        convert
        render
        publish
        ;;
    *)
        usage
        exit 1
        ;;
esac
