# Contact Tracing - FIUBA
Repositorio que agrupa todos los microservicios y aplicaciones


## Contribución

### Setup
Para clonar este repositorio junto a todos los otros del proyecto, se debe correr:

	git clone --recursive git@github.com:ct-fiuba/contact-tracing

Una vez clonado, si hubo cambios en el repositorio y en los submodulos, actualizar con los siguientes comandos (**CUIDADO**: hacer esto reseteará los submodulos, procurar stashear/commitear todos los cambios que se encuentren presentes):

	git pull
	git submodule update --init --recursive


Consideraciones:

- Los submodulos estarán apuntando a algún commit en particular, recordar hacer `checkout` y `pull` de lo último a la hora de trabajar sobre ellos.
- El clone se hará mediante `ssh`, por lo que deberá configurarla, de no tenerla.
- Para versiones anteriores de Git, es posible que al clonar deba hacerse además: `git submodule update --init --recursive`

### Adición de módulos
Para añadir un nuevo módulo, ejecutar el comando:

    git submodule add [-b <branch] <url> <name>

### Modificacion de servicios
Si se desea realizar algun cambio en el sistema (ej: agregar algun servicio), o modificar alguno de los servicios (ej: cambiar alguna variable de entorno), modificar el archivo `docker-compose.yml`. Para mas información, leer la documentación de Docker Compose.

### Actualizacion de submodulos
En caso de querer ejecutar comandos de `git` para todos los submodulos (por ejemplo, stashear lo desarrollado y pullear), utilizar ciertas funciones utiles en `tools.sh`. Un ejemplo de ejecución:

	./tools.sh checkout_all
	./tools.sh pull_all

En caso de identificar otros comandos útiles, sumarlos al script.


## Corrida

### Levantar los servicios
Para correr todos los servicios, buildear todas las imagenes y ejecutar luego:

	./run.sh

Si se quiere buildear imagenes con lo ultimo en cada subdirectorio, ejecutar con el flag de `-b`:

	./run.sh -b


## Makefile utils

* `update-repos`: Checkoutea master en todos los submodulos y hace un pull
* `run`: levanta el sistema (backend)
* `test-whole [features=features/visits.feature]`: levanta el sistema para testear con Docker, corre los `e2e-test` y lo baja. Se puede especificar que feature correr para agilizar el testeo.
* `run-fresh [users=100 establishments=10]`: levanata un nuevo sistema sin datos previos, y en el caso de pasar los argumentos users y establishments, agrega esa cantidad de datos al sistema.
* `stop-fresh`: baja el sistema levantado con el comando `run-fresh`, perdiendo todos los datos que el mismo almacena.
