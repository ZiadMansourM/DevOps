# This scripts automate the intial configuration of new Ubuntu instances
# Download: nginx, node.js, pm2
# by Ziad Mansour Mohamed

# Prepare Keys | Defaults
SShKey=${1:-C:\\Users\\ziadm\\Desktop\\DevOps\\MainServerCMPNKEY\\DevOpsGeekKey.pem}
USER=${2:-ubuntu}
IP=${3:-3.138.118.110}
# SSh and excute commands
ssh -i "$SShKey" "$USER"@"$IP" <<'ENDSSH'

echo "  _  _  ____  ____   __  ____  ____    ____  _  _  ____  "
echo " / )( \(  _ \(    \ / _\(_  _)(  __)  / ___)( \/ )/ ___) "
echo " ) \/ ( ) __/ ) D (/    \ )(   ) _)   \___ \ )  / \___ \ "
echo " \____/(__)  (____/\_/\_/(__) (____)  (____/(__/  (____/ "

sudo apt-get update -y


echo "  _  _  ____   ___  ____   __   ____  ____    ____  _  _  ____  "
echo " / )( \(  _ \ / __)(  _ \ / _\ (    \(  __)  / ___)( \/ )/ ___) "
echo " ) \/ ( ) __/( (_ \ )   //    \ ) D ( ) _)   \___ \ )  / \___ \ "
echo " \____/(__)   \___/(__\_)\_/\_/(____/(____)  (____/(__/  (____/ "

sudo apt-get upgrade -y


echo "  __ _   __  ____  ____       __  ____             "  
echo " (  ( \ /  \(    \(  __)    _(  )/ ___)            "  
echo " /    /(  O )) D ( ) _)  _ / \) \\___ \   _  _  _  "  
echo " \_)__) \__/(____/(____)(_)\____/(____/  (_)(_)(_) "  

# install node.js version 12
curl -fsSL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
npm -v


echo "  __ _   ___  __  __ _  _  _  "
echo " (  ( \ / __)(  )(  ( \( \/ ) "
echo " /    /( (_ \ )( /    / )  (  "
echo " \_)__) \___/(__)\_)__)(_/\_) "

sudo apt install nginx -y


echo "  ____  _  _  ____          "  
echo " (  _ \( \/ )(___ \         "  
echo "  ) __// \/ \ / __/   _  _  "  
echo " (__)  \_)(_/(____)  (_)(_) "  
sudo npm install -g pm2 -y


echo "  ____   __   __ _  ____    _  _  ____  "
echo " (    \ /  \ (  ( \(  __)  ( \/ )(    \ "
echo "  ) D ((  O )/    / ) _)    )  (  ) D ( "
echo " (____/ \__/ \_)__)(____)  (_/\_)(____/ "
sudo systemctl restart nginx

ENDSSH