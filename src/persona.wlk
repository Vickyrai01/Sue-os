class Persona {
	const suenios = #{}
    var felicidad = 0
    var cantHijos = 0
    const lugaresVisitados = []

    const carreraSoniada
    const carrerasEstudiadas = #{}

    var tipoDePersona
	
	method cumplir(suenio) {
		if (!self.sueniosPendientes().contains(suenio)) {
			throw new ElSuenioNoEstaPendienteException(message = "El sueño " + suenio + " no está pendiente")
		}
		suenio.cumplirPara(self)
	}
	
	method sueniosPendientes() = suenios.filter { suenio => suenio.estaPendiente() }
    method aumentarFelicidad(felicidonios){felicidad + felicidonios}

    method tieneHijos() = cantHijos > 0 
    method adoptarHijos(hijosAAdoptar){
        cantHijos += hijosAAdoptar
    }
    method viajarA(lugar){
        lugaresVisitados.add(lugar)
    }

    method esCarreraSoniada(carrera) = carrera == carreraSoniada
    method estudio(carrera) = carrerasEstudiadas.contains(carrera)
    method estudiar(carrera) {
        carrerasEstudiadas.add(carrera)
    }

    method cumplirSuenioMasPreciado() {
        self.cumplir(tipoDePersona.suenioMasPreciado(self.sueniosPendientes()))
    }

    method esFeliz() = felicidad > self.felicidoniosDeSueniosPendientes()

    method felicidoniosDeSueniosPendientes() = self.sueniosPendientes().sum({unSuenio => unSuenio.felicidonios()})

    method esAmbisiosa() = self.sueniosAmbisiosos().size() > 3

    method sueniosAmbisiosos() = suenios.filter({unSuenio => unSuenio.esAmbisioso()})
}
class ElSuenioNoEstaPendienteException inherits Exception{}