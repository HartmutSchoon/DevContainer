#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Get the parent directory (project root)
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
# Use the project root directory name as the image name
IMAGE_NAME=$(basename "$PROJECT_ROOT" | tr '[:upper:]' '[:lower:]')
CONTAINER_NAME="${IMAGE_NAME}-instance"

# Check if the image exists
if [[ "$(docker images -q "$IMAGE_NAME" 2> /dev/null)" == "" ]]; then
  echo "Image '$IMAGE_NAME' not found. Please run ./build.sh first."
  exit 1
fi

echo "Starting $IMAGE_NAME..."

# Use the project root directory name for the mount point
PROJECT_NAME=$(basename "$PROJECT_ROOT")

# Build the docker run command arguments
DOCKER_ARGS=(
    -it
    --rm
    --name "$CONTAINER_NAME"
    -v "$PROJECT_ROOT:/workspaces/$PROJECT_NAME"
    -w "/workspaces/$PROJECT_NAME"
    -v "$HOME/.config/tmux:/home/devuser/.config/tmux:ro"
    -v "$HOME/.tmux/plugins:/home/devuser/.tmux/plugins:ro"
    -v "$HOME/.scripts:/home/devuser/.scripts:ro"
    -e TERM="xterm-256color"
    -e COLORTERM="truecolor"
    -e LANG=en_US.UTF-8
    -e NO_BROWSER=true
)

# Optional mount for P10k config
if [ -f "$HOME/.p10k.zsh" ]; then
    DOCKER_ARGS+=(-v "$HOME/.p10k.zsh:/home/devuser/.p10k.zsh:ro")
fi

# Optional mount for Neovim config (prioritize .config/nvim as it was found on the host)
if [ -d "$HOME/.config/nvim" ]; then
    DOCKER_ARGS+=(-v "$HOME/.config/nvim:/home/devuser/.config/nvim:ro")
elif [ -d "$HOME/.nvim" ]; then
    DOCKER_ARGS+=(-v "$HOME/.nvim:/home/devuser/.config/nvim:ro")
fi


# Run the container (fix permissions before launching shell)
docker run "${DOCKER_ARGS[@]}" "$IMAGE_NAME" /bin/zsh 