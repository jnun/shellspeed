# Video Slide Extraction Tool Setup Script

## Overview

This script automates the setup process for the `vid2slides` tool, which extracts slides from lecture videos. It creates a Python virtual environment, clones the repository, and installs all necessary dependencies.

## Prerequisites

- Python 3.6 or higher
- Git
- zsh shell
- Internet connection

## What This Script Does

1. Creates a Python virtual environment in the current directory
2. Activates the virtual environment
3. Clones the vid2slides repository from GitHub
4. Installs all required Python dependencies
5. Provides usage instructions

## Usage Instructions

1. Save the script below as `setup_vid2slides.sh`
2. Make the script executable:
   ```
   chmod +x setup_vid2slides.sh
   ```
3. Run the script:
   ```
   ./setup_vid2slides.sh
   ```

## The Script

```zsh
#!/bin/zsh

# Create a Python virtual environment in the current directory
echo "Creating Python virtual environment..."
python3 -m venv .venv

# Activate the virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Clone the vid2slides repository
echo "Cloning vid2slides repository..."
git clone https://github.com/patrickmineault/vid2slides.git
cd vid2slides

# Install required dependencies
echo "Installing dependencies..."
pip install --upgrade pip
pip install opencv-python numpy matplotlib scikit-image scikit-learn scipy tqdm pillow pytesseract moviepy pyyaml

# Install additional dependencies that might be in the environment.yml file
# Note: This is an approximation as we're not using conda
pip install decord torch torchvision

echo "Setup complete! You can now use vid2slides."
echo "Remember to activate the environment with 'source .venv/bin/activate' when you want to use it."
echo "To run vid2slides: python vid2slides.py input_vid output_json"
```

## After Installation

After running the script:

1. Activate the environment whenever you want to use the tool:
   ```
   source .venv/bin/activate
   ```

2. Use vid2slides to extract slides from a video:
   ```
   python vid2slides.py input_video.mp4 output_slides.json
   ```

3. Convert the JSON to PDF format:
   ```
   python slides2pdf.py output_slides.json slides.pdf
   ```

## Troubleshooting

- If you encounter missing dependencies, install them with:
  ```
  pip install [package-name]
  ```

- For OCR functionality, ensure Tesseract is installed on your system:
  - On Ubuntu/Debian: `sudo apt-get install tesseract-ocr`
  - On macOS: `brew install tesseract`

## Notes for ADHD Users

This tool is particularly helpful for students with ADHD as it:
- Automatically extracts key slides from lecture videos
- Creates searchable PDFs to quickly find information
- Reduces the need to manually take notes during lectures

Sources
