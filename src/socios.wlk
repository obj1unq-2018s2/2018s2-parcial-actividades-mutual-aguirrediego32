import viajes.*


class Socios{
	var property actividades =[]
	var property cantMaximaDeActividades = 2
	var property edad = 25
	var property idiomas=["espaniol","ingles"]
	var tipoDeSocio // objeto socio
	
	
	method esAdoradorDelSol(){
	return	self.actividades().all{actividad=>actividad.sirveParaBroncearse()}
	}
	
	method actividadesEsforzadas(){
		return self.actividades().filter{actividad=>actividad.implicaEsfuerzo()}
	}
	
	method registrarActividad(actividad){
		if( actividades.size() >= cantMaximaDeActividades ){
			self.error("supera el maximo de actividades maximas")}  
			else{ actividades.add(actividad)} 
	}
	
	method yaRealizoActividad(actividad){
		return actividades.contains{actividad}
	}
}

object socioTranquilo{
	method leAtraeAlSocio(actividad){
		return actividad.diasDeActividad()> 4
	}
}

object socioCoherente{
	method leAtraeAlSocio(actividad,socio){
		   return socio.esAdoradorDelSol() and actividad.sirveParaBroncearse() 
		   			or actividad.implicaEsfuerzo()
	}
}	

object socioRelajado{
	method leAtraeAlSocio(actividad,socio){
		return actividad.idiomas().any{socio.idiomas()}
	}
}


