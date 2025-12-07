# Tweaks.json Schema Documentation

## Overview

The `config/tweaks.json` file contains all tweak definitions used by the application. Each tweak is identified by a unique key and contains properties defining what modifications to make.

## Top-Level Structure

```json
{
  "TweakKey1": { /* Tweak object */ },
  "TweakKey2": { /* Tweak object */ }
}
```

## Tweak Object Schema

### Required Properties

| Property | Type | Description |
|----------|------|-------------|
| `Content` | string | Display name of the tweak |
| `Description` | string | Detailed description of what the tweak does |
| `category` | string | Category for grouping (e.g., "Essential Tweaks") |
| `panel` | string | UI panel number |
| `Order` | string | Sort order within category |

### Optional Properties

| Property | Type | Description |
|----------|------|-------------|
| `link` | string | Documentation URL |
| `registry` | array | Registry modifications (see below) |
| `service` | array | Service modifications (see below) |
| `ScheduledTask` | array | Scheduled task modifications (see below) |
| `InvokeScript` | array | PowerShell scripts to run when applying |
| `UndoScript` | array | PowerShell scripts to run when undoing |
| `appx` | array | Windows Store apps to remove |

## Registry Entry Schema

```json
{
  "Path": "HKLM:\\Software\\...",
  "Name": "ValueName",
  "Type": "DWord|String|QWord|Binary|MultiString|ExpandString",
  "Value": "NewValue",
  "OriginalValue": "OriginalValue or <RemoveEntry>"
}
```

## Service Entry Schema

```json
{
  "Name": "ServiceName",
  "StartupType": "Automatic|Manual|Disabled",
  "OriginalType": "OriginalStartupType"
}
```

## Scheduled Task Entry Schema

```json
{
  "Name": "\\TaskPath\\TaskName",
  "State": "Enabled|Disabled",
  "OriginalState": "OriginalState"
}
```

## Example Complete Tweak

```json
{
  "WPFTweaksExample": {
    "Content": "Example Tweak",
    "Description": "This is an example tweak demonstrating all properties",
    "category": "Essential Tweaks",
    "panel": "1",
    "Order": "a001_",
    "link": "https://example.com/docs",
    "registry": [
      {
        "Path": "HKCU:\\Software\\Example",
        "Name": "Enabled",
        "Type": "DWord",
        "Value": "1",
        "OriginalValue": "0"
      }
    ],
    "service": [
      {
        "Name": "ExampleService",
        "StartupType": "Disabled",
        "OriginalType": "Automatic"
      }
    ]
  }
}
```

## Validation

Always validate your JSON after editing:

```bash
# Using Python
python3 -m json.tool config/tweaks.json

# Using jq
jq . config/tweaks.json

# Using validation scripts
./scripts/validate-json.sh
```
