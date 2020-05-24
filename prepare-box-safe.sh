cd ~/


echo =======Remove LibreOffice
sudo apt-get remove --purge libreoffice --assume-yes
sudo apt-get remove --purge libreoffice* --assume-yes
sudo apt clean -y
sudo apt autoremove -y

echo =======Remove FireFox
sudo apt purge -y firefox
sudo rm -rf /usr/lib/firefox*

echo =======Remove Chromium
sudo apt-get remove --purge chromium --assume-yes
sudo apt clean -y
sudo apt autoremove -y

echo =======Install Flatpak
sudo apt-get install curl --assume-yes
sudo apt-get install flatpak --assume-yes
sudo flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo

echo =======Install Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install google-chrome-stable --assume-yes

echo =======Install SDKMan
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

echo =======Install java
sdk install java 8.0.252-open

echo =======Install docker
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
docker --version
sudo usermod -aG docker $USER

echo =======Install docker-compose
sudo apt install -y docker-compose

echo =======Install utils
sudo apt install -y htop
sudo apt install -y timeshift
sudo apt install -y gnome-tweak-tool
sudo apt install -y awscli

echo =======Install nodejs & npm
sudo apt install -y nodejs
sudo apt install -y npm

echo =======Install aws-azure-login
sudo curl -o /usr/local/bin/aws-azure-login https://raw.githubusercontent.com/sportradar/aws-azure-login/master/docker-launch.sh
sudo chmod o+x /usr/local/bin/aws-azure-login

echo =======Install privoxy
sudo apt install -y privoxy

echo =======Install desktop apps
flatpak install -y flathub io.dbeaver.DBeaverCommunity
flatpak install -y flathub com.microsoft.Teams
flatpak install -y flathub com.getpostman.Postman
flatpak install -y flathub com.jetbrains.IntelliJ-IDEA-Community


echo =======Install latest VirtualBox
#wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian eoan contrib"
#sudo apt update
sudo apt install -y virtualbox-6.1

echo =======Fixing DNS issue. See https://github.com/pop-os/pop/issues/773
sudo dpkg-reconfigure resolvconf


echo =======Install OpenConnect
sudo apt install -y openconnect network-manager-openconnect network-manager-openconnect-gnome

echo =======Adding VPN connection
nmcli c add con-name "CLV-EMEA.clarivate.com" ifname "AAA" type vpn vpn-type openconnect +vpn.data "gateway=CLV-EMEA.clarivate.com"

echo =======Install Keybase
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install ./keybase_amd64.deb --assume-yes


echo =======Install dependencies for OneDrive
sudo apt install -y build-essential
sudo apt install -y libcurl4-openssl-dev
sudo apt install -y libsqlite3-dev
sudo apt install -y pkg-config
curl -fsS https://dlang.org/install.sh | bash -s dmd
sudo apt install -y libnotify-dev

echo =======Compile and install OneDrive
source ~/dlang/dmd-2.092.0/activate
cd ~/Downloads
git clone https://github.com/abraunegg/onedrive.git
cd onedrive
./configure
make clean; make;
sudo make install
cd ~/

echo =======Configure and synchronize OneDrive
onedrive --synchronize
systemctl --user enable onedrive
systemctl --user start onedrive
systemctl --user status onedrive

echo =======Configure ssh
tar -zxf ~/OneDrive/Pop_OS/sshconfig.tar.gz

echo =======Configure aws cli
sudo mkdir ~/.aws
sudo cp ~/OneDrive/Pop_OS/aws/config ~/.aws


echo =======Configure privoxy
sudo mv /etc/privoxy/config /etc/privoxy/config.bak
sudo cp ~/OneDrive/Pop_OS/privoxy/config /etc/privoxy/

echo =======Create code dir
mkdir ~/code
cd ~/code

echo =======Start VPN connection
sudo openconnect --servercert pin-sha256:rby4MfqHAKveAOKiSdyw6tvoxp3wUk0bZGJA0zjxsGw= -b "CLV-EMEA.clarivate.com"

echo =======Clone all repos
git clone ssh://git@git.clarivate.io/sp/1p-kafka-engine.git
git clone ssh://git@git.clarivate.io/pas/1p-email-engine.git
git clone ssh://git@git.clarivate.io/sp/1p-alert-manager.git
git clone ssh://git@git.clarivate.io/sp/elasticsearch-loader.git
git clone ssh://git@git.clarivate.io/sp/1p-alert-acceptance-test-example.git
git clone ssh://git@git.clarivate.io/sp/alerts-admin.git
git clone ssh://git@git.clarivate.io/sp/cassandra-manager.git
git clone ssh://git@git.clarivate.io/ds/usage-data.git
git clone ssh://git@git.clarivate.io/sp/1p-perf-eval.git
git clone ssh://git@git.clarivate.io/sp/eiddo.git
git clone ssh://git@git.clarivate.io/ui/tableau.git
git clone ssh://git@git.clarivate.io/ls-cortellis-services/fireflight.git
git clone ssh://git@git.clarivate.io/~johannes.barnard_clarivate.com/es-loader-jenkins-jobs.git
git clone ssh://git@git.clarivate.io/~johannes.barnard_clarivate.com/jenkins-dsl.git

git clone http://johannes.barnard@eiddo.dev.oneplatform.build/r/1pemailengine.git
git clone http://johannes.barnard@eiddo.dev.oneplatform.build/r/1palertmanager.git
git clone http://johannes.barnard@eiddo.dev.oneplatform.build/r/1pesloaderservice.git
git clone http://johannes.barnard@eiddo.dev.oneplatform.build/r/1pzuulfiltermaps.git
git clone http://johannes.barnard@eiddo.dev.oneplatform.build/r/1pcommon.git

git clone https://github.com/csi-lk/aws-ses-local.git
git clone https://github.com/hansbarnard/pop_os_helper.git

echo =======Success!!!!!!!



