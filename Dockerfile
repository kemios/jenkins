# --------------- DÉBUT COUCHE OS -------------------
FROM debian:stable-slim
# --------------- FIN COUCHE OS ---------------------

# MÉTADONNÉES DE L'IMAGE
LABEL version="1.0" maintainer="Daleche OSSENGUE <dossengue@gmail.com>"

# VARIABLES TEMPORAIRES
ARG APT_FLAGS="-q -y"
ARG DOCUMENTROOT="/var/www/html"

# --------------- DÉBUT COUCHE NGINX ---------------
RUN apt update -y && \
    apt install ${APT_FLAGS} --no-install-recommends nginx && \
    apt autoclean ${APT_FLAGS}
# --------------- FIN COUCHE NGINX -----------------


# --------------- DÉBUT COUCHE NGINX ---------------
RUN apt update -y && \
    apt install ${APT_FLAGS} --no-install-recommends php && \
    apt autoclean ${APT_FLAGS}
# --------------- FIN COUCHE NGINX -----------------

#RUN apt install ${APT_FLAGS} \
#
#COPY app/nginx.conf /etc/nginx/conf.d/default.conf
#COPY app ${DOCUMENTROOT}
# --------------- FIN COUCHE PHP --------------------

# OUVERTURE DU PORT HTTP
EXPOSE 80

# RÉPERTOIRE DE TRAVAIL
WORKDIR  ${DOCUMENTROOT}

# DÉMARRAGE DES SERVICES LORS DE L'EXÉCUTION DE L'IMAGE
CMD ["nginx", "-g", "daemon off;"]