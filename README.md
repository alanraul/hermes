# Kolombia


## Comenzando

### Pre-requisitos

- Instalar Docker en MacOS

```shell
Descargar https://download.docker.com/mac/stable/Docker.dmg
```

- Instalar Docker en Linux

```shell
curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker $(whoami)
sudo curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

```
**NOTA:** Se deberá reiniciar o salirse de la sesión para poder tomar los cambios

- Instalar Cmake en MacOS

```shell
brew install cmake
```

- Instalar Cmake en Linux

```shell
apt-get install cmake
```

### Instalación

- Clona el repositorio de **TU FORK**, recuerda las [Guias de desarrollo](https://github.com/resuelve/guias-desarrollo)

```
git clone git@github.com:tu_usuario/la-tasa-panel.git

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