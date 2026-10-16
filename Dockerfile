
FROM node:20

# Habilitar Yarn mediante Corepack
RUN corepack enable && corepack prepare yarn@stable --activate

WORKDIR /usr/src/app

# Copiar archivos de configuración
COPY package.json yarn.lock .yarnrc.yml ./

# Instalar dependencias
RUN yarn install --immutable

# Copiar el proyecto
COPY . .

# Puerto de la aplicación
EXPOSE 3000

# Iniciar servidor
CMD ["yarn", "start"]
