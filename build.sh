#!/bin/bash

# Build script for bondage workshop presentation and handouts
# This script processes the combined markdown file to generate both outputs

echo "Building bondage workshop files..."

# Slides 
echo "Generating slides..."
sed '/<!-- HANDOUT:START -->/,/<!-- HANDOUT:END -->/d' bondage-workshop.md > bondage-workshop-slides-temp.md

## Replace STYLES placeholder
sed '/\/\* STYLES \*\//r bondage-workshop-slides-style.css' bondage-workshop-slides-temp.md | sed 's/\/\* STYLES \*\///' > bondage-workshop-slides-temp2.md
npx @marp-team/marp-cli@latest bondage-workshop-slides-temp2.md --pdf --output bondage-workshop-slides.pdf
rm bondage-workshop-slides-temp.md bondage-workshop-slides-temp2.md

# Handouts
echo "Generating handouts..."
sed '/<!-- SLIDES:START -->/,/<!-- SLIDES:END -->/d' bondage-workshop.md > bondage-workshop-handouts-temp.md

## Remove invert
sed 's/class: invert//' bondage-workshop-handouts-temp.md > bondage-workshop-handouts-temp2.md

## Replace STYLES placeholder
sed '/\/\* STYLES \*\//r bondage-workshop-handouts-style.css' bondage-workshop-handouts-temp2.md | sed 's/\/\* STYLES \*\///' > bondage-workshop-handouts-temp3.md
npx @marp-team/marp-cli@latest bondage-workshop-handouts-temp3.md --pdf --output bondage-workshop-handouts.pdf
rm bondage-workshop-handouts-temp.md bondage-workshop-handouts-temp2.md bondage-workshop-handouts-temp3.md

echo "Build complete! Generated:"
echo "- bondage-workshop-slides.pdf"
echo "- bondage-workshop-handouts.pdf"

