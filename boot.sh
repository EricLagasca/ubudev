set -e

echo "Running UBUDEV setup (ctrl+c to abort)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

rm -rf $HOME/.local/share/git
git clone https://github.com/git/git.git $HOME/.local/share/git >/dev/null
cd $HOME/.local/share/git
git checkout v$(git --version | awk '{print $3}') >/dev/null
cd -

echo "Cloning UBUDEV..."
rm -rf $HOME/.local/share/ubudev
git clone https://github.com/EricLagasca/ubudev.git $HOME/.local/share/ubudev >/dev/null

echo "Installation starting..."
source $HOME/.local/share/ubudev/install.sh
