object knightRider {
	method peso() = 500
	method peligrosidad() = 10
	method bultos() = 1
	method sufriCambios() { }	
}

object bumblebee {
	var transformadoEnAuto = false
	
	method transformadoEnAuto() = transformadoEnAuto
	method peso() = 800
	method peligrosidad() { 
		return if (self.transformadoEnAuto()) 15 
			   else 30
	}
	method bultos() = 2	
	//se podría haber puesto un var property, pero le podría decir de esa manera que se transforme en auto aunque ya esté en auto.
	//con esta forma queda como un switch, que al estar en una posicion la unica opción para que tenga efecto es cambiarlo a la contraria.
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method sufriCambios() { transformadoEnAuto = false}
}

object paqueteDeLadrillos {
	var property cantidad = 0
	
	method peso() = cantidad * 2
	method peligrosidad() = 2
	method bultos() {
		//Paquete de ladrillos es 1 hasta 100 ladrillos, 2 de 101 a 300, 3 301 o más
	 return if (cantidad <= 100) 1 
	 		else if (cantidad.between(101,300)) 2 
	 			else 3 	
	}
	method sufriCambios() { cantidad += 12 }	
}

object arenaAGranel {
	var property peso = 0
	method peligrosidad() = 1
	method bultos() = 1	
	method sufriCambios() { peso += 20 }	
}

object bateriaAntiaerea {
	var conMisiles
	
	method conMisiles() = conMisiles
	
	method cargaMisiles() {conMisiles = true}
	method descargaMisiles() {conMisiles = false}
	
	method peso() { 
		return if (self.conMisiles()) 300 
			   else 200
	}
	
	method peligrosidad() {
		return if (self.conMisiles()) 100 
			   else 0
	}
	
	method bultos() {
		return if (self.conMisiles()) 2 else 1
	}	
	
	method sufriCambios() { self.cargaMisiles() }		
}

object contenedorPortuario {
	const contenido = [] // const contenido = [vacio], para que no tenga null y ya no necesitaria ver si esta vacio en otros metodos.
	
	method estaVacio() = contenido.isEmpty()
	
	method pesoContenido() { 
		return if ( self.estaVacio() ) 0 
			   else contenido.sum({ unaCosa => unaCosa.peso() })
	}
	
	method sufriCambios() { contenido.forEach({unaCosa => unaCosa.sufriCambios()}) }	
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
	
	method bultos() {
		return if (self.estaVacio()) 1 
				else 1 + contenido.sum({unaCosa => unaCosa.bultos()})
	}	
	
	method elMasPeligroso() = contenido.max({unaCosa => unaCosa.peligrosidad()})
}

object residuosRadioactivos {
	var property peso = 0
	method peligrosidad() = 200
	method bultos() = 1	
	method sufriCambios() { peso += 15 }	
}

object embalajeDeSeguridad {
	var interior = vacio //se deberian manejar los errores y dejarlo sin asignar, lo dejo para mas adelante.
	method embalar(cosa) { interior = cosa}
	method peso() = interior.peso()
	method peligrosidad() = interior.peligrosidad() / 2
	method bultos() = 2	
	method sufriCambios() { }	
}

object vacio {
	method peso() = 0
	method peligrosidad() = 0
	method bultos() = 0
	method sufriCambios() { }	
}