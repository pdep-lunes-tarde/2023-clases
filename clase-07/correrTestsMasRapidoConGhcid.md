# Corriendo los tests más rápido con Ghcid

## ¿Para qué?

Como se puede leer [acá](https://github.com/pdep-utn/enunciados-miercoles-noche/blob/master/pages/haskell/trabajo.md#pruebas-automatizadas), la forma más fácil de correr los tests del proyecto es simplemente usando el comando:

```bash
stack test
```

Y en el mismo apunte se menciona que una forma más cómoda de hacer que los tests corran solos cada vez que hacemos cambios en los archivos es:

```bash
stack test --file-watch
```

Eso es suficiente en muchos casos. Sin embargo, cada vez que corre stack test lleva algo de tiempo porque tiene que volver compilar el proyecto entero antes de correr los tests.

Una forma diferente de correr los tests en el proyecto es abrir el intérprete con

```bash
stack ghci
```

y evaluar `correrTests`, esto funciona porque al igual que lo que nosotros escribimos, los tests son código haskell. Ahora, si hicimos cambios y queremos correr los tests con el código nuevo, tenemos que hacer lo siguiente **dentro de ghci**:

```haskell
:r
correrTests
```

Hacer `:r` primero es necesario porque es un comando que le dice a `ghci` que tiene que traerse los cambios.

Esto tarda menos que stack test porque `ghci` no necesita volver a compilar todo.

El tema ahora es que tenemos que estar escribiendo `:r` y `correrTests` todo el tiempo, ¿cómo puedo hacer que eso pase solo cuando cambio algo en un archivo? Esto es lo que hace **ghcid**.

## Okay, ¿cómo lo uso?

1. En la raíz del proyecto (misma carpeta donde hacés `stack test`), ejecuta esto:
    ```bash
    stack install ghcid
    ```
    Una vez eso termina de compilar, va a decirte que copió el ejecutable `ghcid` a una cierta carpeta con un mensaje similar a:
    ```bash
    Copied executables to /home/yo/.local/bin:
    - ghcid
    ```

2. Tenés que agregar la dirección la carpeta donde se guardó `ghcid` al `PATH`.
   
   El `PATH` es una variable del sistema operativo que tiene una lista de direcciones a carpetas.

   Cada vez que escribis un comando en la consola y apretas enter, lo que hace el sistema operativo es buscar un programa con el nombre del comando que escribiste en el `PATH`.

   Como agregar una dirección al `PATH` depende del sistema operativo que estés usando, así que esta parte te toca buscar cómo se hace.

3. ¡Ya debería estar instalado!, probá abrir una terminal nueva (si es una que ya tenías abierta no te va a andar), moverte hasta la carpeta del proyecto y corré:
    ```bash
    ghcid --run=correrTests
    ```
    Va a tardar un ratito compilando y te va a dar el resultado de los tests. Y ahora, ¡cada vez que hagas un cambio en los archivos se va actualizar!

    También podes usar una forma más corta del mismo comando con el mismo resultado:
    ```bash
    ghcid -r
    ```
