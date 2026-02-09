[[ "${BASH_SOURCE[0]}" != "$0" ]] || {
  echo "This file must be sourced"
  exit 1
}

# Set config
set_config() {
  local key="$1"
  local value="$2"
  local file="$CONFIG_USER"
  
  # Validate inputs
  if [ -z "$key" ]; then
    echo "Error: key is required" >&2
    return 1
  fi
  
  mkdir -p "$(dirname "$file")"
  
  # Special validation for EDITOR
  if [[ "${key,,}" == "editor" ]]; then
    if ! validate_editor "$value"; then
      echo "Warning: Invalid editor '$value', falling back to nano" >&2
      value="nano"
    fi
  fi
  
  # Update or add config value
  if [ -f "$file" ] && grep -q "^${key}=" "$file"; then
    # Update existing
    sed -i "s|^${key}=.*|${key}=\"${value}\"|" "$file"
  else
    # Add new
    echo "${key}=\"${value}\"" >> "$file"
  fi
}

# Usage
set_config EDITOR vim
set_config COLORS blue:cyan
