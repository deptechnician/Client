# ---------------------------------------------------------------
# Bash reference
# ---------------------------------------------------------------
mkdir -p ~/build
cd ~/build
git clone https://github.com/christitustech/mybash
cd mybash
./setup.sh

# Install the helper tools
sudo apt install multitail tree zoxide trash-cli fzf bash-completion
