object realista {
    method suenioMasPreciado(unosSuenios) = unosSuenios.max({unSuenio => unSuenio.felicidonios()}) 
}
object alocado{
    method suenioMasPreciado(unosSuenios) = unosSuenios.anyOne() 
}
object obsesivo{
    method suenioMasPreciado(unosSuenios) = unosSuenios.first() 
}