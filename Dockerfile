# use lightwight alpine image
FROM nginx:alpine

#copy project file
COPY index.html /urs/share/nginx/html/index.html
COPY style.css /urs/share/nginx/html/style.css
COPY script.js /urs/share/nginx/html/script.js

#expose port 80

EXPOSE 80

#start nginx 
CMD ["nginx","-g","daemon off;"]