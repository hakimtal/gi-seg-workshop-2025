#!/bin/bash

# Create target folder
mkdir -p cls_models

# Base URL for the release
BASE_URL="https://github.com/hakimtal/gi-seg-workshop-2025/releases/download/release-2025"

# List of model filenames
FILES=(
    "cls_efv2l_320_models_swa_0.pth.tar"
    "cls_efv2l_320_models_swa_1.pth.tar"
    "cls_efv2l_320_models_swa_2.pth.tar"
    "cls_efv2l_320_models_swa_3.pth.tar"
    "cls_efv2l_320_models_swa_4.pth.tar"
    "cls_efv2m_352_models_swa_0.pth.tar"
    "cls_efv2m_352_models_swa_1.pth.tar"
    "cls_efv2m_352_models_swa_2.pth.tar"
    "cls_efv2m_352_models_swa_3.pth.tar"
    "cls_efv2m_352_models_swa_4.pth.tar"
)

# Download each file
for file in "${FILES[@]}"; do
    echo "Downloading $file..."
    wget -q --show-progress "$BASE_URL/$file" -P cls_models
done

echo "✅ All models downloaded to ./cls_models"
