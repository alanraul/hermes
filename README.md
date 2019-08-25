# Hermes

Hermes es un servicio de mensajeria construido en elixir y pensado para reducir la impresion de tickets que no se usan, se tiran y contaminan. Ademas de que al estar construido en elixir tiene la capacidad de escalabilidad vertical ya que las caracteristicas del lenguaje le permiten ejecutar cientos de miles de procesos en una sola maquina, lo que permitiria a las sucursales de Banco Azteca enviar por medios digitales los recibos de los 10 millones de transacciones que tienen al día.

Actualmente desarrollamos el envio de mensajes de texto SMS y el envío de correos electronicos de manera simultaea.

### Setup

```shell
make bootstrap
```

### Levantar servicio

- Prueba la instalación ejecutando el entorno y entrando a **http://localhost:4000**. Puedes salir con **<kbd>Ctrl</kbd> + <kbd>c</kbd>**.

```shell
make start logs
```
