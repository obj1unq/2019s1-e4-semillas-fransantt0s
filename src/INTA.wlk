import parcelas.*
import semillas.*

object iNTA {
	const property parcelas=[]
	//Metodo para testear 
	method agregarParcela(parcela){
		parcelas.add(parcela)
	}
	
	method promedioDePlantas(){
		return self.cantDePlantas() / parcelas.size()
	}
	
	method cantDePlantas(){
		return parcelas.sum({parcela=>parcela.plantas().size()})
	}
	
	method masAutoSustentable(){
		return self.parcelasConMasDe4Plantas().max({parcela=>parcela.cantDePlantasBienAsociadas() })
	}
	
	
	method parcelasConMasDe4Plantas(){
		return parcelas.filter({parcela=>parcela.plantas().size()>4})
	}
	
	
	
}
