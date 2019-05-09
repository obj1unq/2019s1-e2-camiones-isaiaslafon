object knightRider {
	method peso() = 500
	method peligrosidad() = 10
}

object bumblebee {
	
	var transformadoEnAuto = true
	
	method transformadoEnAuto() = transformadoEnAuto
	method peso() = 800
	method peligrosidad() { 
		return if (self.transformadoEnAuto()) 15 
			   else 30
	}
	//se podría haber puesto un var property, pero le podría decir de esa manera que se transforme en auto aunque ya esté en auto.
	//con esta forma queda como un switch, que al estar en una posicion la unica opción para que tenga efecto es cambiarlo a la contraria.
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object ladrillos {
	
	var property cantidad = 0
	
	method peso() = cantidad * 2
	method peligrosidad() = 2
}

object arenaAGranel {
	var property peso = 0
	method peligrosidad() = 1
}

object bateriaAntiaerea {
	var conMisiles
	
	method conMisiles() = conMisiles
	
	method vaConMisiles() {conMisiles = true}
	method vaSinMisiles() {conMisiles = false}
	
	method peso() { 
		return if (self.conMisiles()) 300 
			   else 200
	}
	
	method peligrosidad() {
		return if (self.conMisiles()) 100 
			   else 0
	}	
}

object contenedorPortuario {
	const contenido = []
	
	method contenedorVacio() = contenido.isEmpty()
	
	method pesoContenido() { 
		return if ( self.contenedorVacio() ) 0 
			   else contenido.sum({ unaCosa => unaCosa.peso() })
	}
	
	method peso() = 100 + self.pesoContenido()
	
	method peligrosidad() {
		return if (self.contenedorVacio()) 0
				else contenido.max({unaCosa => unaCosa.peligrosidad()})
	}	
}

object residuosRadioactivos {
	var property peso = 0
	method peligrosidad() = 200
}

/*	
	* Embalaje de seguridad: es una cobertura que envuelve a cualquier otra cosa. 
		-El peso es el peso de la cosa que tenga adentro. 
		-El nivel de peligrosidad es la mitad del nivel de peligrosidad de lo que envuelve.
*/