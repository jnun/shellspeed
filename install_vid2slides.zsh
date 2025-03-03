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
