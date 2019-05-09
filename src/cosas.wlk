object knightRider {
	method peso() = 500
	method peligrosidad() = 10
}

object bumblebee {
	var transformadoEnAuto = false
	
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

object paqueteDeLadrillos {
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
	
	method dejarMisiles() {conMisiles = true}
	method removerMisiles() {conMisiles = false}
	
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
	const contenido = [] // const contenido = [vacio], para que no tenga null y ya no necesitaria ver si esta vacio en otros metodos.
	
	method estaVacio() = contenido.isEmpty()
	
	method pesoContenido() { 
		return if ( self.estaVacio() ) 0 
			   else contenido.sum({ unaCosa => unaCosa.peso() })
	}
	
	method meter(cosa) { contenido.add(cosa)}
	method sacar(cosa) { contenido.remove(cosa)}
	method vaciar() { 
		//opcion 2 contenido = [vacio]
		//opcion 3 contenido = []
		contenido.clear() 
	} 
	
	method peso() = 100 + self.pesoContenido()
	
	method peligrosidad() {
		return if (self.estaVacio()) 0
				else self.elMasPeligroso().peligrosidad()
	}	
	
	method elMasPeligroso() = contenido.max({unaCosa => unaCosa.peligrosidad()})
}

object residuosRadioactivos {
	var property peso = 0
	method peligrosidad() = 200
}

object embalajeDeSeguridad {
	var interior = vacio
	method embalar(cosa) { interior = cosa}
	method peso() = interior.peso()
	method peligrosidad() = interior.peligrosidad() / 2
}

object vacio {
	method peso() = 0
	method peligrosidad() = 0
}