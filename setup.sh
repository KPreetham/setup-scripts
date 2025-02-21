# !/bin/sh

sudo apt update;
sudo apt upgrade -y;

sudo apt install vim -y;
sudo apt install curl -y;

sudo apt install terminator -y;

sudo apt install postgresql-client -y;

# Install dev tools
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
        && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

# Refer to https://nodejs.org/en/download
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 18

npm install --global yarn;

# Install Google Cloud CLI
# sudo apt install apt-transport-https ca-certificates gnupg curl -y;
# curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg;
# echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list;
# sudo apt update && sudo apt install google-cloud-cli;

# Install Golang
wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz;
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz;

echo "export PATH=/usr/local/go/bin:$PATH" >> ~/.profile;
echo "export PATH=$HOME/go/bin:$PATH" >> ~/.profile;

source ~/.profile;

# Install python pip
sudo apt install python3-pip;

wget https://github.com/beekeeper-studio/beekeeper-studio/releases/download/v5.0.9/beekeeper-studio_5.0.9_amd64.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i beekeeper-studio_5.0.9_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

curl -f https://zed.dev/install.sh | sh

sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code
