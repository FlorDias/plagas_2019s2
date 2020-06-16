import elementos.*

class Plagas {
	
	var property poblacion
	
	method trasmiteEnfermedad () { return poblacion >= 10 }
	
	method efectoDeAtaque () { poblacion += (poblacion * 0.1) }
	
	method atacarElemento (unElemento) {
		unElemento.recibirAtaque(self)
		self.efectoDeAtaque()
	}
}

class Cucarachas inherits Plagas{
	
	var property pesoPromedio
	
	method nivelDeDanio () { return poblacion / 2 }
	
	override method trasmiteEnfermedad () { return super() and pesoPromedio >= 10 }
	
	override method efectoDeAtaque () {
		super()
		pesoPromedio += 2
	}
}

class Pulgas inherits Plagas {
	
	method nivelDeDanio () { return poblacion * 2 }
}

class Garrapatas inherits Plagas {
	
	method nivelDeDanio () { return poblacion * 2 }
	
	override method efectoDeAtaque () { poblacion += (poblacion * 0.2) }
}

class Mosquitos inherits Plagas {
	
	method nivelDedanio () { return poblacion }
	
	override method trasmiteEnfermedad () { return super() and (poblacion % 3 == 0)}
}