import cosas.*

object camion {
	const property cosas = []
	
	method carga() {return cosas}
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	
	method pesoTara() {return 1000}
	
	//pesoTotal()`: es la suma del peso del camión vacío (tara) y su carga. La tara del camión es de 1 tonelada (1000 kilogramos);
	method pesoTotal() { 
		return if ( self.hayCarga() ) { self.carga().sum({ unaCosa => unaCosa.peso() }) + self.pesoTara() } 
				else { self.pesoTara() }
	}
	
	method hayCarga() { return not self.carga().isEmpty() }
	
	//* `excedidoDePeso()`: indica si el peso total es superior al peso máximo. El cual es de 2.5 toneladas;
	method excedidoDePeso() { 
		return self.pesoTotal() > 2500
	}
	
	//* `objetosPeligrosos(nivel)`: todos los objetos cargados que superan el nivel de peligrosidad indicados por el valor del parámetro;
	method objetosPeligrosos(nivel) { 
		return self.carga().filter({unaCosa => unaCosa.peligrosidad() > nivel})
	}
	
	//* `objetosMasPeligrososQue(cosa)`: todos los objetos cargados que son más peligrosos que la cosa;
	method objetosMasPeligrososQue(cosa) { 
		return self.carga().filter({unaCosa => unaCosa.peligrosidad() > cosa.peligrosidad()})
	}
	
	//* `puedeCircularEnRuta(nivelMaximoPeligrosidad)` Puede circular si ninguna cosa que transporta supera el `nivelMaximoPeligrosidad`.
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) { 
		return self.carga().all({unaCosa => unaCosa.peligrosidad() <= nivelMaximoPeligrosidad})
	}
}
