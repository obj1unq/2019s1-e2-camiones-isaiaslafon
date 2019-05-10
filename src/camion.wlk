import cosas.*

object camion {
	const property cosas = []
	
	method carga() {return cosas}
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		[{unaCosa.sufriCambios()}, {}].anyOne().apply() 
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
		return if (not self.hayCarga()) true 
			   else self.carga().all({unaCosa => unaCosa.peligrosidad() <= nivelMaximoPeligrosidad})
	}
	
	//* `tieneAlgoQuePesaEntre(min, max)`: indica si el peso de alguna de las cosas que tiene el camión está en ese intervalo;
	method tieneAlgoQuePesaEntre(min, max) {
		return if (not self.hayCarga()) false 
			   else self.carga().any({unaCarga => unaCarga.peso().between(min,max)})
	}
	
	//* `cosaMasPesada()`: la cosa más pesada que tenga el camión. Ojo que lo que se pide es _la cosa_ y no su peso.
	method cosaMasPesada() {
		return self.carga().max({unaCosa => unaCosa.peso()})
	}
	
	//* `totalBultos()`: la suma de la cantidad de bultos que está transportando. KnightRider, arena a granel y residuos radioactivos son 1 bulto. Bumblebee y embalaje de seguridad son dos. Paquete de ladrillos es 1 hasta 100 ladrillos, 2 de 101 a 300, 3 301 o más. Batería antiaérea: 1 si no tiene misiles, 2 si tiene. Contenedor portuario: 1 + los bultos que tiene adentro.
	method totalBultos() {
		return if (not self.hayCarga()) 0 else self.carga().sum({unaCosa => unaCosa.bultos()})
	}
	
	//* `pesos()`: devuelve una lista con _los pesos_ de cada cosa que tiene el camión.
	method pesos() {
		return if ( not self.hayCarga()) [] else self.carga().map({unaCosa => unaCosa.peso()})
	}
}


