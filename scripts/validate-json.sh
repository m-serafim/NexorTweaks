#!/bin/bash
# JSON Validation Script
# Validates the tweaks.json configuration file

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
JSON_FILE="$PROJECT_DIR/config/tweaks.json"

echo "==================================="
echo "JSON Configuration Validator"
echo "==================================="
echo ""

if [ ! -f "$JSON_FILE" ]; then
    echo "❌ ERROR: Configuration file not found: $JSON_FILE"
    exit 1
fi

echo "📄 Validating: $JSON_FILE"
echo ""

# Check if python3 is available
if ! command -v python3 &> /dev/null; then
    echo "⚠️  Warning: python3 not found, skipping JSON validation"
    exit 0
fi

# Validate JSON syntax
if python3 -m json.tool "$JSON_FILE" > /dev/null 2>&1; then
    echo "✅ JSON syntax is valid"
    
    # Count tweaks
    TWEAK_COUNT=$(python3 -c "import json; print(len(json.load(open('$JSON_FILE'))))")
    echo "📊 Found $TWEAK_COUNT tweaks in configuration"
    
    exit 0
else
    echo "❌ JSON syntax is INVALID"
    echo ""
    echo "Error details:"
    python3 -m json.tool "$JSON_FILE" 2>&1 | head -10
    exit 1
fi
