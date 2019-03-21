FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.com

# VARIABLES
ENV USER maltego \
LANG fr_FR.UTF-8 \
OPENJDK openjdk-8-jre

# INSTALLATION DES PREREQUIS
RUN apt-get update && apt-get install --no-install-recommends -y \
ca-certificates \
locales \
apt-transport-https \
sudo \
tor \
privoxy \
xpdf \
gnupg \
pgpgpg \
dirmngr \
apt-utils \
xz-utils \
firefox-esr \
firefox-esr-l10n-fr \
wget && \

# SELECTION DE LA LANGUE FRANCAISE
echo ${LANG} > /etc/locale.gen && locale-gen && \

# MODIFICATION DU FICHIER /etc/apt/sources.list AVEC LES REPOS kali-rolling contrib non-free
echo 'deb https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb-src https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add && \

# INSTALLATION DE L'APPLICATION
mkdir -p /usr/share/man/man1 && \
apt-get update && apt-get install --no-install-recommends -y --allow-unauthenticated \
${OPENJDK} \
${OPENJDK}-headless \
ca-certificates-java \
maltego && \

# AJOUT UTILISATEUR
useradd -d /home/${USER} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

# SELECTION UTILISATEUR
USER ${USER}

# SELECTION ESPACE DE TRAVAIL
WORKDIR /home/${USER}

# CONFIGURATION DE TOR & PRIVOXY
RUN sudo rm -f /etc/privoxy/config && \
sudo rm -f /etc/tor/torcc && \
echo "listen-address localhost:8118" | sudo tee -a /etc/privoxy/config && \
echo "forward-socks5 / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "forward-socks4 / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "forward-socks4a / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "SOCKSPort localhost:9050" | sudo tee -a /etc/tor/torcc && \

# NETTOYAGE
sudo apt-get --purge autoremove -y \
wget && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

# COMMANDE AU DEMARRAGE DU CONTENEUR
CMD sudo service tor start && sudo service privoxy start && maltego
