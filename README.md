# Instrucciones de uso de la plantilla Docker

Se ha creado esta plantilla con la intención de alojar cualquier aplicación web con base de datos en Mysql. 

dentro de la carpeta `dev` existe otra carpeta destinada a que se le cambie el nombre por el del proyecto, y en su interior extá preparado el docker-compose con los **Dockerfile** para la creación de las dos imágenes y sus contenedores. 

## Pasos previos a la puesta en marcha

1. Modificar el nombre de la carpeta `dev/mi_proyecto` por el nombre que queramos
2. Establecer los parámetros del archivo `dev/.env` con las variables de entorno que queramos
3. ejecutar las instrucciones

```bash 
cd dev/mi_poryecto
docker-compose up -d
```
> el *Document Root* del proyecto se ubica en la raíz de este mismo proyecto, y el archivo ejecutable (html o php) debe de estar dentro de una carpeta llamada public

4. cuando el proceso termine deberiamos poder abrir el navegador con [http://localhost:[$APP_PORT]/index.html]

```
Ejemplo 

si la variable de entorno APP_PORT=8081

http://localhost:8081/index.html

```
