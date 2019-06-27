ARG version=latest
FROM ubuntu:$version

# MAINTENER est obsolète
# MAINTAINER JCD "jcd717@outlook.com"

# directives stables au début
RUN \
    apt update ; \
    apt install -y curl ; \
    rm -rf /var/lib/apt/lists/*

# LABEL créé des métadonnées
LABEL maintainer="TLS <thill.llabres@gmail.com>" \
      description="test dockerfile2" \
      auteur="thill llabres"

#COPY ou ADD (ajoute dans le container de travail)
# ADD complement : mieux que le COPY, si la source est un zip ou tar il décopresse automatiquement
#
COPY heartbeat.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh ; \
    echo coucou >test.txt

ARG hbs=1
# créée varaible d'environnement dans le container
ENV HEARTBEATSTEP $hbs


# information utile des ports réseau qu'ouvre le container (facultatif)
#EXPOSE 1234/udp 4321/tcp
EXPOSE 8080/tcp

# commande exécutée au RUN du container
# si pas défini explicitement il vaut par défaut /bin/sh -c
# 
ENTRYPOINT ["/entrypoint.sh"]

# ici les arguments de ENTRYPOINT 
#
#
CMD ["battement"]

