import paquetes.*
object empresa {
  const mensajeros = []
  var peso = 0
  const paquetesPendientes = []
  var facturacion = 0

  method mensajeros() {
    return mensajeros
  }

  method contratarMensajero(unMensajero) {
    mensajeros.add(unMensajero)
  }

  method despedirMensajero(unMensajero) {
    mensajeros.remove(unMensajero)
  }

  method despedirAMensajeros() {
    mensajeros.clear()
  }

  method esGrande() {
    return mensajeros.size() > 2
  }

  method puedeSerEntregadoPorElPrimero(unPaquete, unLugar) {
    return unLugar.puedePasar(mensajeros.first()) && unPaquete.sePuedeEntregar() 
  }

  method pesoUltimoMensajero() {
    return mensajeros.last().peso()
  }

  method puedeSerEntregadoPorUnMensajero(unPaquete, unLugar) {
    return mensajeros.any({mensajero => unPaquete.sePuedeEntregar() && unLugar.puedePasar(mensajero)})
  }

  method obtenerTodosLosMensajeros(unPaquete, unLugar) {
    return mensajeros.filter({mensajero => unPaquete.sePuedeEntregar() && unLugar.puedePasar(mensajero)})
  }

  method peso() {
    return mensajeros.forEach({mensajero => peso = peso + mensajero.peso()})
  }

  method tieneSobrepeso() {
    return peso > 500
  }

  method enviarUnPaquete(unPaquete, unLugar) {
    if (self.puedeSerEntregadoPorUnMensajero(unPaquete, unLugar)) {
      facturacion = facturacion + unPaquete.precio() * 100 / 20
    }
    else {
      paquetesPendientes.add(unPaquete)
    }
  }

  method facturacion() {
    return facturacion
  }

  method enviarPaquetes(paquetes, unLugar) {
    paquetes.forEach({paquete => self.enviarUnPaquete(paquete, unLugar)})
  }

  method paquetePendienteMasCaro() {
    var paqueteMasCaro = paquetesPendientes.first()
    paquetesPendientes.forEach({paquete => if (paquete.precio() > paqueteMasCaro) {paqueteMasCaro = paquete}})
    return paqueteMasCaro
  }

  method enviarPaquetePendienteCaro(unLugar) {
    self.enviarUnPaquete(self.paquetePendienteMasCaro(), unLugar)
    paquetesPendientes.remove(self.paquetePendienteMasCaro())
  }
}