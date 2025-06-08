#!/bin/bash

# --------------------------
# Quantitative Trading Full Stack Setup for macOS (M1/M2)
# --------------------------

echo "Starting Quant Trading Setup..."

# 1. Install Homebrew
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed."
fi

# 2. Install core development tools
echo "Installing core dev tools..."
brew install git
brew install --cask iterm2
brew install --cask visual-studio-code
brew install --cask docker

# 3. Install pyenv and latest Python
echo "Installing pyenv and Python..."
brew install pyenv
pyenv install 3.11.8
pyenv global 3.11.8

# 4. Install virtualenvwrapper
echo "Installing virtualenvwrapper..."
pip3 install virtualenvwrapper

# 5. Install pipx and poetry
echo "Installing pipx and poetry..."
brew install pipx
pipx ensurepath
pipx install poetry

# 6. Setup project directory
echo "Creating quant_projects directory..."
mkdir -p ~/quant_projects
cd ~/quant_projects
poetry init --no-interaction

# 7. Add dependencies to pyproject.toml
echo "Adding dependencies to pyproject.toml..."
poetry add numpy pandas scipy matplotlib seaborn plotly scikit-learn xgboost lightgbm tensorflow-macos torch stable-baselines3 gym optuna yfinance pandas-datareader ta backtrader zipline-reloaded quantstats ffn bt empyrical alphalens-reloaded pyfolio-reloaded requests beautifulsoup4 lxml sqlalchemy pymongo openpyxl ib_insync alpaca-trade-api ccxt jupyterlab notebook ipython voila pytest black pylint mypy jupyterlab_code_formatter openai langchain transformers sentence-transformers dash streamlit bokeh quandl

echo "Setup complete. All tools and libraries installed."
