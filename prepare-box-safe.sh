cd ~/

sudo apt install spice-vdagent --assume-yes
sudo apt install spice-webdavd --assume-yes

# Remove LibreOffice
sudo apt-get remove --purge libreoffice --assume-yes
sudo apt-get remove --purge libreoffice* --assume-yes
sudo apt clean -y
sudo apt autoremove -y

# Remove FireFox
sudo apt purge -y firefox
sudo rm -rf /usr/lib/firefox*

# Install Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install google-chrome-stable --assume-yes

# Install SDKMan
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

# Install java
sdk install java 8.0.252-open

# Install docker
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
docker --version
sudo usermod -aG docker $USER

flatpak install -y flathub com.microsoft.Teams

# Install Intellij
flatpak install -y flathub com.jetbrains.IntelliJ-IDEA-Community


# Install OneDrive
sudo apt install -y onedrive
onedrive --synchronize
systemctl --user enable onedrive
systemctl --user start onedrive
systemctl status --user onedrive

# Configure ssh
tar -zxf ~/OneDrive/Pop_OS/sshconfig.tar.gz


# Install OpenConnect
sudo apt install -y openconnect network-manager-openconnect network-manager-openconnect-gnome

#Adding VPN connection
nmcli c add con-name "CLV-EMEA.clarivate.com" type vpn vpn-type openconnect +vpn.data "gateway=CLV-EMEA.clarivate.com"

# Starting VPN in background
sudo openconnect --servercert pin-sha256:rby4MfqHAKveAOKiSdyw6tvoxp3wUk0bZGJA0zjxsGw= -b "CLV-EMEA.clarivate.com"


mkdir ~/code
cd ~/code

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





