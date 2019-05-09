object knightRider {
	method peso() { return 500 }
	method peligrosidad() { return 10 }
}

object bumblebee {
	
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method peligrosidad() { return if (transformadoEnAuto) 15 else 30  }

	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object ladrillos {
	
	var property cantidad = 0
	
	method peso() { return cantidad * 2 }
	method peligrosidad() { return 2 }
}

object arenaAGranel {
	
}
/*	* Paquete de ladrillos: 
		-cada ladrillo pesa 2 kilos, 
		-cantidad de ladrillos que tiene puede variar. 
		-peligrosidad es 2.
	* Arena a granel: 
		-peso es variable, 
		-peligrosidad es 1.
	* Batería antiaérea : 
		-peso es 300 kilos si está con los misiles o 200 en otro caso. 
		-conMisiles
		-En cuanto a la peligrosidad es 100 si está con los misiles y 0 en otro caso.
	* Contenedor portuario: 
		-puede tener otras cosas adentro. 
		-El peso es 100 + la suma de todas las cosas que estén adentro. 
		-Es tan peligroso como el objeto más peligroso que contiene. Si está vacío, su peligrosidad es 0.
		-si esta Vacio
	* Residuos radioactivos: 
		-peso es variable
		-peligrosidad es 200.
	* Embalaje de seguridad: es una cobertura que envuelve a cualquier otra cosa. 
		-El peso es el peso de la cosa que tenga adentro. 
		-El nivel de peligrosidad es la mitad del nivel de peligrosidad de lo que envuelve.
*/