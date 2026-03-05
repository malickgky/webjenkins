# Utilise l'image nginx légère
FROM nginx:alpine

# Copie le site dans le dossier web de Nginx
COPY app/ /usr/share/nginx/html/

# Expose le port 80
EXPOSE 80

# Commande par défaut pour démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]