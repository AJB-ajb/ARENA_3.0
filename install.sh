# Install Miniconda to home directory
MINICONDA_DIR="$HOME/miniconda3"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$MINICONDA_DIR"
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O "$MINICONDA_DIR/miniconda.sh"
bash "$MINICONDA_DIR/miniconda.sh" -b -u -p "$MINICONDA_DIR"
rm -rf "$MINICONDA_DIR/miniconda.sh"
"$MINICONDA_DIR/bin/conda" init bash
source ~/.bashrc
# Accept Anaconda Terms of Service for required channels
"$MINICONDA_DIR/bin/conda" tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
"$MINICONDA_DIR/bin/conda" tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
# Create & activate the Conda environment
"$MINICONDA_DIR/bin/conda" create -n arena-env python=3.11 -y
source "$MINICONDA_DIR/bin/activate" arena-env
"$MINICONDA_DIR/envs/arena-env/bin/pip" install -r "$SCRIPT_DIR/requirements.txt"
"$MINICONDA_DIR/bin/conda" install -n arena-env ipykernel --update-deps --force-reinstall -y