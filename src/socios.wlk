import viajes.*

class Socio {

	const cantMaximaDeActividades
	const actividades = []
	const idiomas = [ "espaniol", "ingles" ]

	var property edad = 25

	method esAdoradorDelSol() {
		return actividades.all{ actividad => actividad.sirveParaBroncearse() }
	}

	method actividadesEsforzadas() {
		return actividades.filter{ actividad => actividad.implicaEsfuerzo() }
	}

	method registrarActividad(actividad) {
		if (actividades.size() >= cantMaximaDeActividades) {
			self.error("supera el maximo de actividades maximas")
		}
		
		actividades.add(actividad)
	}

	method leAtrae(actividad)

	method yaRealizoActividad(actividad) {
		return actividades.contains(actividad)
	}

}

class SocioTranquilo inherits Socio {

	override method leAtrae(actividad) {
		return actividad.diasDeActividad() > 4
	}

}

class SocioCoherente inherits Socio {

	override method leAtrae(actividad) {
		if (self.esAdoradorDelSol()) {
			return actividad.sirveParaBroncearse() 
		} else {
			return actividad.implicaEsfuerzo()	
		}
	}

}

class SocioRelajado inherits Socio {

	method leAtraeAlSocio(actividad) {
		return actividad.idiomas().any { idioma => idiomas.contains(idioma) }
	}

}

