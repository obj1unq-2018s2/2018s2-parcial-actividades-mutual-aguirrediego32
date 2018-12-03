import socios.*
class Viajes {
	var property idiomas = ["espaniol"]
	
	// TODO Estos tres atributos no tienen utilidad, dado que cada subclase debe definir su propio criterio.
	var property implicaEsfuerzo = false
	var property sirveParaBroncearse = false
	var property diasDeActividad = 2
	
	method esInteresante(){
		return idiomas.size() > 2
	}
	
	method leAtraeAlSocio(socio){
		// TODO Esto debería devolver un booleano y está devolviendo el tipo de socio.
	return socio.tipoSocio()
	}

	method esRecomendada(socio){
		return socio.leAtraeAlSocio(self) and self.esInteresante() 
			and socio.yaRealizoActividad(self)
	}
}

class ViajesDePlaya inherits Viajes{
	var property largoDePlaya
	
	override	method diasDeActividad(){
		return largoDePlaya / 500
	}
	
	override method implicaEsfuerzo(){
		return largoDePlaya > 1200
		}		
	override method sirveParaBroncearse()= true
}

class ExcursionAUnaCiudad inherits Viajes{
	var property cantDeAtracciones
	
	override method diasDeActividad(){
		return cantDeAtracciones / 2
	}
	
	override method implicaEsfuerzo(){
		return cantDeAtracciones >= 5
	}
	
	// sirveParaBroncearse hereda de Viajes y retorna false
	
	override method esInteresante(){
	return	super() or  cantDeAtracciones == 5
	}
}

class ExcursionACiudadTropical inherits ExcursionAUnaCiudad{
	
	override method diasDeActividad()=
		super() + 1
	
	override method sirveParaBroncearse()= true
}

class SalidaDeTrekking inherits Viajes{
	var property kilometrosDeSenderosParaRecorrer = 1
	var property cantDeDiasDeSol = 1
	
	override method diasDeActividad() =
	 kilometrosDeSenderosParaRecorrer /50
	
	override method implicaEsfuerzo(){
		return kilometrosDeSenderosParaRecorrer > 80
	}
	
	override method sirveParaBroncearse(){
		return cantDeDiasDeSol > 200 or
			 (cantDeDiasDeSol.between(100,200) and kilometrosDeSenderosParaRecorrer > 120) 
	}
	
	override method esInteresante(){
	return super() and cantDeDiasDeSol > 140	
	}
}

class Gimnasia inherits Viajes{
	// Por qué acá usás una lista y en la superclase un conjunto?
	override method idiomas()= ["espaniol"]
	
	override method diasDeActividad()= 1
	
	override method implicaEsfuerzo()= true
	
	override method esRecomendada(socio){
		return socio.edad().between(20,30)
	}
	
	// hereda de viajes "sirveParaBroncearse" false
}

