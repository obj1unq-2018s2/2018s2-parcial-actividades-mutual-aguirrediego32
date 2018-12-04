import socios.*

class Viaje {

	var property idiomas = [ "espaniol" ]

	method esInteresante() {
		return idiomas.size() > 1
	}

	method esRecomendada(socio) {
		return socio.leAtrae(self) 
			and self.esInteresante() 
			and not socio.yaRealizoActividad(self)
	}

}

class ViajeDePlaya inherits Viaje {

	var property largoDePlaya

	method diasDeActividad() = largoDePlaya / 500

	method implicaEsfuerzo() = largoDePlaya > 1200

	method sirveParaBroncearse() = true

}

class ExcursionAUnaCiudad inherits Viaje {

	var property cantDeAtracciones

	method diasDeActividad() {
		return cantDeAtracciones / 2
	}

	method implicaEsfuerzo() {
		return cantDeAtracciones >= 5
	}

	method sirveParaBroncearse() = false

	override method esInteresante() {
		return super() or cantDeAtracciones == 5
	}

}

class ExcursionACiudadTropical inherits ExcursionAUnaCiudad {

	override method diasDeActividad() = super() + 1

	override method sirveParaBroncearse() = true

}

class SalidaDeTrekking inherits Viaje {

	var property kilometrosDeSenderosParaRecorrer
	var property cantDeDiasDeSol

	method diasDeActividad() = kilometrosDeSenderosParaRecorrer / 50

	method implicaEsfuerzo() {
		return kilometrosDeSenderosParaRecorrer > 80
	}

	method sirveParaBroncearse() {
		return cantDeDiasDeSol > 200 or (
			cantDeDiasDeSol.between(100, 200) and 
			kilometrosDeSenderosParaRecorrer > 120
		)
	}

	override method esInteresante() {
		return super() and cantDeDiasDeSol > 140
	}

}

class Gimnasia {
	method idiomas() = [ "espaniol" ]

	method diasDeActividad() = 1

	method implicaEsfuerzo() = true
	
	method sirveParaBroncearse() = false
	
	method esRecomendada(socio) = socio.edad().between(20, 30)
}

