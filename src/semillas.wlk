import parcelas.*
class Plantas{
	var property anioDeObtencion
	var property altura
	var property espacioQueOcupa
	method horasDeSolQueTolera()
 	method daSemillas() // bool
	method esFuerte(){
		return self.horasDeSolQueTolera()>10
	}
	method parcelaIdeal(parcela)
	
	method estaBienAsociada(parcela){
		return parcela.esEcologica(self) or parcela.esIndustrial(self)
	}
	
}


class Menta	inherits Plantas{
	 
	
 override method horasDeSolQueTolera(){
		return 6
	}
	
	override method parcelaIdeal(parcela){
		
		return parcela.superficie()>6
		
		
	}
	
	
	override method daSemillas(){
		return self.esFuerte() or self.condicionAlternativa()
	}
	
	
	
	method condicionAlternativa(){
		
		return self.altura()>0.4
		
	}
	
	override method espacioQueOcupa(){
		return self.altura()*3
	}
		
	}
	
	class Soja inherits Plantas {
		
		override method parcelaIdeal(parcela){
			return parcela.horasDeSolPorDia() == self.horasDeSolQueTolera()
		}
		
		override method horasDeSolQueTolera(){
			return if(self.altura()<0.5){
				6
			}
			else if(self.altura().between(0.5,1)){
				7
			}
	
		else{
			9
		}
	}
	

	
	override method daSemillas(){
		return self.esFuerte() or  self.condicionAlternativa()
	}	
	
	method condicionAlternativa(){
		return self.anioDeObtencion()>2007 and self.altura() > 1
	}
	
	override method espacioQueOcupa(){
		return self.altura() / 2
	}
	
	
	
	
	
	}
	
	class Quinoa inherits Plantas {
		var property numeroDeHorasDeSol
		
		override method horasDeSolQueTolera(){
			return numeroDeHorasDeSol
		}
		
		override method espacioQueOcupa(){
			return 0.5
			
		}
		
		
		
		override method parcelaIdeal(parcela){
			return parcela.plantas().all({planta=> planta.altura()< 1.5})
		}
		
		override method daSemillas(){
			return self.esFuerte() or self.condicionAlternativa()
		}
		
		
		method condicionAlternativa(){
			return self.anioDeObtencion()<2005
		}
	}
	
	
	class SojaTransgenica inherits Soja {
		override method daSemillas(){
			return false
		}
		override method parcelaIdeal(parcela){
			return parcela.cantidadMaximaDePlantas()==1
		}
		
	}
	
	class HierbaBuena inherits Menta{
		override method espacioQueOcupa(){
			return (self.altura()*3)*2
		}
		
	}
	
	









