# Kolombia

### Setup

```shell
make bootstrap
```

### Levantar servicio

- Prueba la instalación ejecutando el entorno y entrando a **http://localhost:4000**. Puedes salir con **<kbd>Ctrl</kbd> + <kbd>c</kbd>**.

```shell
make start logs
```
<<<<<<< Updated upstream
=======


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

### Te daremos una respuesta similar a esto:
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

#### Los ```methods``` son las formas en las que quieres que hermes te envie las notificaciones

#### Revisa tus  SMSs y tu correo (tal vez este en spam por ser una prueba)
>>>>>>> Stashed changes
