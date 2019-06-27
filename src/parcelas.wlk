import semillas.*
	class Parcelas{
		var property ancho
		var property largo 
		var property horasDeSolPorDia
		var property plantas=[]
	
		method superficie(){
			return self.ancho() * self.largo()
		}
		
		method cantidadMaximaDePlantas(){
			return if(self.ancho()>self.largo()){
				self.superficie()/5
			}
			else{
				(self.superficie()/3) + self.largo()
			}
		}
		
		
		method tieneComplicaciones(){
		return plantas.any({planta=>planta.horasDeSolQueTolera()<self.horasDeSolPorDia()})
		}
		
		method plantarPlanta(planta){
		plantas.add(planta)
		if(self.cantidadDePlantasExcedidas() or self.dosHorasMasDeLasQueTolera(planta)){
			self.error("no se puede plantar esta planta")
		}
	
	
		}
			
			
	
		
		
		method cantidadDePlantasExcedidas(){
			return self.cantidadMaximaDePlantas()== plantas.size()
			
		}
		
		method dosHorasMasDeLasQueTolera(planta){
		 return planta.horasDeSolQueTolera() + 2 <= self.horasDeSolPorDia() 
		
		}
		
		
		method esEcologica(planta){
			return not self.tieneComplicaciones() and planta.parcelaIdeal(self)
			
		}
		
		method esIndustrial(planta){
			return plantas.size()<=2 and planta.esFuerte()
		}
		
		method plantasBienAsociadas(){
			return plantas.filter({planta=>planta.estaBienAsociada(self)})
		}
		
		method cantDePlantasBienAsociadas(){
		 return self.plantasBienAsociadas().size()
		}
		
		
	
	
	}
	


