class Suenio {
    var cumplido = false
    
    method estaPendiente() = not cumplido

    method cumplirPara(unaPersona) {
            
            self.validar(unaPersona)
            self.realizarPara(unaPersona)
            self.cumplir()
            unaPersona.aumentarFelicidad(self.felicidonios())
    }

    method validar(unaPersona)
    method realizarPara(unaPersona)
    method cumplir(){cumplido = true }
    method felicidonios()

    method esAmbisioso() = self.felicidonios() > 100 
}
class Adoptar inherits SuenioSimple{
    const hijosAAdoptar

    override method validar(unaPersona) {
        if(unaPersona.tieneHijos()){
            throw new NoSePuedeCumplirElSuenioException(message = "Esta persona ya tiene hijos")
        }
    }
    override method realizarPara(unaPersona) {
        unaPersona.adoptarHijos(hijosAAdoptar)
    }

}
class Viajar inherits SuenioSimple{
    const lugar

    override method validar(unaPersona){}
    override method realizarPara(unaPersona) {
        unaPersona.viajarA(lugar)
    }
}
class Recibirse inherits SuenioSimple{
    const carrera

    override method validar(unaPersona) {
      if(!(unaPersona.esCarreraSoniada(carrera))){
            throw new NoSePuedeCumplirElSuenioException(message = "No es la carrera soniada de la persona")
      }
      if(unaPersona.estudio(carrera)){
        throw new NoSePuedeCumplirElSuenioException(message = "La persona ya estudio esta carrera")

      }
    }
    override method realizarPara(unaPersona) {
        unaPersona.estudiar(carrera)
    }
}
class SuenioSimple inherits Suenio{
	var felicidonios = 0
	override method felicidonios() = felicidonios
}

class SuenioMultiple inherits Suenio {
	const suenios = []
	
	override method felicidonios() = suenios.sum { suenio => suenio.felicidonios() }

    override method validar(unaPersona){
        if(!(self.seValidanTodosEn(unaPersona))){
            throw new NoSePuedeCumplirElSuenioException(message = "Hay un suenio que no se cumple")
        }
    }
    override method realizarPara(unaPersona) {
        suenios.forEach({unSuenio => unSuenio.realizarPara(unaPersona)})
    }

    method seValidanTodosEn(unaPersona) = suenios.all({unSuenio => unSuenio.validar(unaPersona)}) 
}
class NoSePuedeCumplirElSuenioException inherits Exception{}