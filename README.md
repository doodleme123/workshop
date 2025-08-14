# Visitors

You can download the:
 - [bondage-workshop-slides.pdf](bondage-workshop-slides.pdf) or
 - [bondage-workshop-handouts.pdf](bondage-workshop-handouts.pdf)

# Contributing

This project contains a combined presentation and handout system for the Beginner Bondage Workshop.

## How It Works

The system uses conditional sections in the markdown file:

- `<!-- SLIDES:START -->` and `<!-- SLIDES:END -->` - Content for presentation slides
- `<!-- HANDOUT:START -->` and `<!-- HANDOUT:END -->` - Content for handouts

The build script processes the combined file to generate separate outputs:

1. Removes handout sections to create slides
2. Removes slides sections to create handouts
3. Applies different styling for each output

## Usage

To build both PDFs:
```bash
./build.sh
```

To edit content:
1. Open `bondage-workshop.md`
2. Edit content within the appropriate conditional sections
3. Run `./build.sh` to regenerate PDFs