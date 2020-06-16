import plagas.*

class Hogar {
	
	var property mugre = 0
	var property nivelConfort = 0
	
	method esBueno () { return mugre <= (nivelConfort / 2) }
	
	method recibirAtaque (unaPlaga) { mugre += unaPlaga.nivelDeDanio() }
}

class Huerta {
	
	var property capacidadProduccion = 0
	var property nivelDeProduccion = 5
	
	method esBueno () { return capacidadProduccion > nivelDeProduccion}
	
	method recibirAtaque (unaPlaga) { capacidadProduccion += (unaPlaga.nivelDeDanio() * 0.1)
		if (unaPlaga.trasmiteEnfermedad()) { capacidadProduccion += 10 } 
	}
}

class Mascota {
	
	var property nivelDeSalud = 0
	
	method esBueno () { return nivelDeSalud > 250 }
	
	method recibirAtaque (unaPlaga) { if(unaPlaga.trasmiteEnfermedad()){ nivelDeSalud -= unaPlaga.nivelDeDanio() } }
}

class Barrio {
	
	const property elementos = []
	
	method addElemento (unElemento) { elementos.add(unElemento) }
	
	method sacarElemento(unElemento){ elementos.remove(unElemento) }
	
	method cantidadElementosBuenos () { return elementos.count ({elemento => elemento.esBueno()})}
	
	method cantidadElementosMalos () { return elementos.count ({elemento => not(elemento.esBueno())})}
	
	method esCopado () { return self.cantidadElementosBuenos() > self.cantidadElementosMalos() }

}
