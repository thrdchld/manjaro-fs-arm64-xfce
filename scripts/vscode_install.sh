mkdir /opt/vscode
cd /opt
wget https://az764295.vo.msecnd.net/stable/ee2b180d582a7f601fa6ecfdad8d9fd269ab1884/code-stable-arm64-1678817734.tar.gz
tar xf /opt/code-stable-arm64-1678817734.tar.gz -C /opt/vscode/ --strip-components=1
rm -rf code-stable-arm64-1678817734.tar.gz
echo -e "alias code='/opt/vscode/code --no-sandbox'" >> ~/.bashrc
