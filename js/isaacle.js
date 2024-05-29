document.addEventListener("DOMContentLoaded", function() {
	var searchInput = document.getElementById("input");
	var div = document.getElementById("objects");

	searchInput.addEventListener("click", function() {
		// Mostrar el div
		div.style.display = "block";
	});

	//SI BUSCO COSAS POR EL INPUT TYPE TEXT (LA BARRA DE BUSQUEDA) MOSTRARE RESULTADOS PARECIDOS
	searchInput.addEventListener("input", function() {
		var searchText = this.value;
		if (searchText.length > 0) {
			var xhr = new XMLHttpRequest();
			xhr.open('POST', '/controlador/controlador_busqueda.php', true);
			xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			xhr.onreadystatechange = function() {
				if (xhr.readyState === XMLHttpRequest.DONE) {
					if (xhr.status === 200) {
						div.innerHTML = "";
						var suggestions = JSON.parse(xhr.responseText);
						suggestions.forEach(function(suggestion) {
							var hijo = document.createElement("a");
							hijo.id = suggestion[0];
							hijo.className = "hijo";
							var nombre = document.createElement("label");
							var img = document.createElement("img");
							img.id = "imagenSelect";
							img.src = suggestion[1];
							img.alt = suggestion[0];
							nombre.innerHTML = suggestion[0];
							nombre.id = "texto";
							hijo.appendChild(img);
							hijo.appendChild(nombre);
							div.appendChild(hijo);
							hijo.addEventListener("click", function(event) {
								var id = this.id; // Obtener el ID del elemento "a"
								enviarIDAlServidor(id); // Enviar el ID al servidor
							});
						});
					} else {
						console.error("Error al obtener sugerencias:", xhr.status);
					}
				}
			};
			xhr.send('busqueda=' + searchText);
		} else {
			// Si el campo de búsqueda está vacío, limpiar el datalist
			div.innerHTML = "";
		}
	});
	document.addEventListener("click", function(event) {
		// Verificar si el clic ocurrió fuera del input y del div
		if (event.target !== searchInput && event.target !== div && !div.contains(event.target)) {
			// Ocultar el div
			div.style.display = "none";
		}
	});
	//FUNCION QUE HACE QUE ENVIA EL ID AL SERVIDOR DEL OBJETO QUE HEMOS BUSCADO
	function enviarIDAlServidor(id) {
		var contenedor = document.getElementById("contenedor");
		var description = document.getElementById("description");
		var contenedorImagen = document.getElementById("imagenContenedor");
		var xhr = new XMLHttpRequest();
		xhr.open('POST', '/controlador/controlador_busqueda.php', true); // Cambia 'tu_archivo_php.php' por la URL de tu archivo PHP
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.onreadystatechange = function() {
			if (xhr.readyState === XMLHttpRequest.DONE) {
				if (xhr.status === 200) {
					contenedorImagen.style.display = "";
					//VACIO EL CONTENEDOR, LA DESCRIPTION, EL BUSCADOR Y EL DIV
					contenedor.innerHTML = "";
					description.innerHTML = "";
					searchInput.value = "";
					div.innerHTML = "";
					//ARRAY QUE RECIBE DEL SERVIDOR
					var array = JSON.parse(xhr.responseText);
					var informacion = array[0];
					var descripcion = array[1];
					//RECORRO EL ARRAY DE INFORMACION QUE RECIBE DEL SERVIDOR
					informacion.forEach(function(suggestion) {
						//CREO TODOS LOS ELEMENTOS QUE VOY A USAR DENTRO DEL HTML
						var nombre = document.createElement("label");
						var type = document.createElement("label");
						//var labelInfo = document.createElement("label");
						var labelId = document.createElement("label");
						var labelPool = document.createElement("label");
						var labelRealice = document.createElement("label");
						var labelCalidad = document.createElement("label");
						var contenedorImagen = document.createElement("div");
						var divNombre = document.createElement("div");
						var divType = document.createElement("div");
						var divInformacion = document.createElement("div");
						//var divInfo = document.createElement("div");
						var divIdentificador = document.createElement("div");
						var divCalidad = document.createElement("div");
						var divPool = document.createElement("div");
						var divRealice = document.createElement("div");
						var textoType = document.createElement("span");
						var textoId = document.createElement("span");
						var textoCalidad = document.createElement("span");
						var textoPool = document.createElement("span");
						var textoRealice = document.createElement("span");
						var img = document.createElement("img");
						var pedestal = document.createElement("img");
						var dance = document.createElement("img");
						var easteregg = document.createElement("img");
						var labelDescripcion = document.createElement("label");
						var imagenPersonaje = document.createElement("img");
						var labelImagen = document.createElement("label");
						var textoDescripcion = document.createElement("span");
						var divImagenPersonaje = document.createElement("div");
						var divImagenPersonaje2 = document.createElement("div");
						var br = document.createElement("br");

						//LE DOY IDS A TODOS LOS ELEMENTOS QUE HE CREADO
						divNombre.id = "divNombre";
						divType.id = "divType";
						divInformacion.id = "divInformacion";
						//divInfo.id = "divInfo";
						divIdentificador.id = "divId";
						divCalidad.id = "divCalidad";
						divPool.id = "divPool";
						divRealice.id = "divRealice";
						contenedorImagen.id = "divPedestal";
						nombre.id = "nombreObjeto";
						//labelInfo.id = "info";
						type.id = "typeObjeto";
						img.id = "imagen";
						pedestal.id = "pedestal";
						labelId.id = "labelId";
						labelCalidad.id = "labelCalidad";
						labelPool.id = "labelPool";
						labelRealice.id = "labelRealice";
						dance.id = "persona4";
						easteregg.id = "lazymattman";
						divImagenPersonaje.id = "divImagenPersonaje";
						divImagenPersonaje2.id = "divImagenPersonaje2";
						imagenPersonaje.id = "personaje";

						//LE DOY VALORES A LOS LABELS
						nombre.innerHTML = suggestion[2];
						//labelInfo.innerHTML = "INFORMATION";
						type.innerHTML = suggestion[1];
						labelId.innerHTML = suggestion[0];
						labelCalidad.innerHTML = suggestion[4];
						var pool = suggestion[5].split(",");
						pool.forEach((element) => labelPool.innerHTML += element+"<br/>");
						labelRealice.innerHTML = suggestion[8];
						textoType.innerHTML = "Type object:";
						textoId.innerHTML = "Id:";
						textoCalidad.innerHTML = "Quality:";
						textoPool.innerHTML = "Item Pool:";
						textoRealice.innerHTML = "Realice:";
						labelImagen.innerHTML = "CHARACTER APPEARANCE";
						textoDescripcion.innerHTML = "DESCRIPTION";
						labelDescripcion.innerHTML = descripcion;

						//LE DOY VALOR A LOS SRC DE LAS IMAGENES
						img.src = "/photos/The Binding of Isaac HD Items"+suggestion[3]+".png";
						pedestal.src = "/photos/pedestal.png";
						imagenPersonaje.src = "/photos/ropa"+suggestion[3]+".png";

						//DEPENDIENDO DE LA CALIDAD DEL OBJETO TENDRA UN BACKGROUND COLOR U OTRO
						switch(suggestion[4]){
							//QUALITY 0
							case 0:
								labelCalidad.style.color = "grey";
								break;
							//QUALITY 1
							case 1:
								labelCalidad.style.color = "#9BCD61";
								break;
							//QUALITY 2
							case 2:
								labelCalidad.style.color = "#7AB1C4";
								break;
							//QUALITY 3
							case 3:
								labelCalidad.style.color = "#CB60B7";
								break;
							//QUALITY 4
							case 4:
								labelCalidad.style.color = "#CDB42F";
								break;
						}

						//SI EL OBJETO QUE HEMOS BUSCADO HACE QUE EL PERSONAJE CAMBIE DE ASPECTO
						imagenPersonaje.onload = cargarImagen;

						//FUNCION QUE MUESTRA LA IMAGEN DEL PERSONAJE SI ES QUE TIENE
						function cargarImagen(e){
							contenedor.appendChild(divImagenPersonaje);
							divImagenPersonaje.appendChild(labelImagen);
							contenedor.appendChild(divImagenPersonaje2);
							divImagenPersonaje2.appendChild(imagenPersonaje);
						}

						//GENERO EL CONTENEDOR DONDE SE MUESTRA LA INFORMACION DEL OBJETO
						contenedor.appendChild(divNombre);
						contenedor.appendChild(contenedorImagen);
						contenedor.appendChild(divInformacion);
						divNombre.appendChild(nombre);
						contenedorImagen.appendChild(img);
						contenedorImagen.appendChild(pedestal);
						//divInformacion.appendChild(divInfo);
						//divInfo.appendChild(labelInfo);
						divInformacion.appendChild(divType);
						divType.appendChild(textoType);
						divType.appendChild(type);
						divInformacion.appendChild(divIdentificador);
						divIdentificador.appendChild(textoId);
						divIdentificador.appendChild(labelId);
						divInformacion.appendChild(divCalidad);
						divCalidad.appendChild(textoCalidad);
						divCalidad.appendChild(labelCalidad);
						divInformacion.appendChild(divPool);
						divPool.appendChild(textoPool);
						divPool.appendChild(labelPool);
						divInformacion.appendChild(divRealice);
						divRealice.appendChild(textoRealice);
						divRealice.appendChild(labelRealice);
						//contenedor.style.border = "1px solid black";

						//GENERO LA DESCRIPCION DEL OBJETO
						description.appendChild(textoDescripcion);
						description.appendChild(br);
						description.appendChild(labelDescripcion);

						//DEPENDIENDO DE LA QUALITY DEL OBJETO HARÁ LO SIGUIENTE
						switch(suggestion[4]){
							//MUESTRO EL POG DE ISAAC
							case 3:
								dance.src = "/photos/pog.png";
								dance.style.transform = "scaleX(-1)";
								dance.style.width = "100px";
								description.appendChild(dance);
								break;
							//MUESTRO EL GIF DE ISAAC BAILANDO, EL POG DE LAZYMATTMAN Y PONGO EL AUDIO DEL PERSONA 4 DANCE 
							case 4:
								var audio = document.createElement("audio");
								var source = document.createElement("source");
								audio.volume = 0.2;
								source.src = "/sounds/persona4.mp3";
								source.type = "audio/mp3";
								description.appendChild(audio);
								audio.appendChild(source);
								audio.play();
								dance.src = "/photos/dance.gif";
								dance.style.width = "250px";
								easteregg.src = "/photos/lazy-mattman-mattman.gif";
								description.appendChild(dance);
								description.appendChild(br);
								description.appendChild(easteregg);
								break;
						}
					});
					console.log(xhr.responseText);
				} else {
					console.error("Error al enviar el ID al servidor:", xhr.status);
				}
			}
		};
		xhr.send('id=' + id); // Enviar el ID al servidor
	}
});