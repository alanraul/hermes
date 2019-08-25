# Hermes

Hermes es un servicio de mensajeria construido en elixir y pensado para reducir la impresion de tickets que no se usan, se tiran y contaminan. Ademas de que al estar construido en elixir tiene la capacidad de escalabilidad vertical ya que las caracteristicas del lenguaje le permiten ejecutar cientos de miles de procesos en una sola maquina, lo que permitiria a las sucursales de Banco Azteca enviar por medios digitales los recibos de los 10 millones de transacciones que tienen al día.

Actualmente desarrollamos el envio de mensajes de texto SMS y el envío de correos electronicos de manera simultaea.

Para el desarrollo del envio de SMS Hermes se conecta al servicio de Twilio y para el envio de correos electrónicos se conecta al servico de Sendgrid del cual toma un template donde se muestra la información de la transacción.

### Setup

#### Instalar Docker en Mac

```shell
Descargar https://download.docker.com/mac/stable/Docker.dmg
```

#### Instalar Docker en Linux

```shell
curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker $(whoami)
sudo curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

```

#### Instalar Cmake en Mac

```shell
brew install cmake
```

#### Instalar Cmake en Linux

```shell
apt-get install cmake
```

#### Clonar el repositorio por via SSH


```shell
 git clone git@github.com:alanraul/hermes.git
```

### Solicita a @el #7189 en Discord las variables de ambiente :)


### Instalar el ambiente

```shell
make bootstrap
```

### Levantar servicio

- Prueba la instalación ejecutando el entorno y entrando a **http://localhost:4000**. Puedes salir con **<kbd>Ctrl</kbd> + <kbd>c</kbd>**.

```shell
make start logs
```


### En postman haz una peticion post con un json que tenga unaestructura similar a esta:

```shell
{
	"notification": {
		"transaction": {
			"id": 1,
			"destiny": "tu@email.com",
			"account": 1234,
			"reference": 3534,
			"date": "2019-08-24",
			"name": "Erique López",
			"amount": 255,
			"to_message": "+52 tu-telefono-10-digitos",
			"from_message": "+15032129249"
		},
		"methods": ["email", "sms"] 
	}
}
```
### Hermes te regresara una estructura similar a esto: 

```shell
{
    "data": {
        "errors": [],
        "success": [
            "email",
            "sms"
        ]
    },
    "status": "success"
}
```
donde te indica los errores y cuales notificaciones fueron enviadas de manera exitosa

### Los ```methods``` son las formas en las que quieres que hermes te envie las notificaciones

### Revisa tus  SMSs y tu correo (tal vez este en spam por ser una prueba)