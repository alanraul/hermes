# Kolombia


- Instalar Cmake en MacOS

```shell
brew install cmake
```

- Instalar Cmake en Linux

```shell
apt-get install cmake
```


- Si tienes problemas para clonar el repositorio via ssh, sigue la guia para [Crear tu ssh key](https://help.github.com/en/enterprise/2.16/user/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

- Ejecuta el script para instalar el ambiente y las dependencias necesarias.

```shell
make bootstrap ecto.setup npm.install
```

- Prueba la instalación ejecutando el entorno y entrando a **http://localhost**. Puedes salir con **<kbd>Ctrl</kbd> + <kbd>c</kbd>**.

```shell
make start
```