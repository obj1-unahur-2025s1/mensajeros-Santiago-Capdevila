import paquetes.*
object empresa {
  const mensajeros = []
  const paquetesPendientes = []
  const paquetesEnviados = []
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

  method puedeSerEntregadoPorElPrimero() {
    return paquete.sePuedeEntregar(mensajeros.first())
  }

  method pesoUltimoMensajero() {
    return mensajeros.last().peso()
  }

  method puedeSerEntregadoPorUnMensajero(unPaquete) {
    return mensajeros.any({mensajero => unPaquete.sePuedeEntregar(mensajero)})
  }

  method obtenerTodosLosMensajeros(unPaquete) {
    return mensajeros.filter({mensajero => unPaquete.sePuedeEntregar(mensajero)})
  }

  method peso() {
    return mensajeros.sum({mensajero => mensajero.peso()})
  }

  method tieneSobrepeso() {
    return self.peso() / mensajeros.size() > 500
  }

  method enviarUnPaquete(unPaquete) {
    if (self.puedeSerEntregadoPorUnMensajero(unPaquete)) {
      paquetesEnviados.add(unPaquete)
    }
    else {
      paquetesPendientes.add(unPaquete)
    }
  }

  method facturacion() {
    return paquetesEnviados.sum({paquete => paquete.precio()})
  }

  method enviarPaquetes(paquetes) {
    paquetes.forEach({paquete => self.enviarUnPaquete(paquete)})
  }

  method paquetePendienteMasCaro() {
    // var paqueteMasCaro = paquetesPendientes.first()
    // paquetesPendientes.forEach({paquete => if (paquete.precio() > paqueteMasCaro) {paqueteMasCaro = paquete}})
    return paquetesPendientes.max({paquete => paquete.precio()})
  }

  method enviarPaquetePendienteCaro() {
    // self.enviarUnPaquete(self.paquetePendienteMasCaro())
    // paquetesPendientes.remove(self.paquetePendienteMasCaro())
    if (self.puedeSerEntregadoPorUnMensajero(self.paquetePendienteMasCaro())) {
      self.enviarUnPaquete(self.paquetePendienteMasCaro())
      paquetesPendientes.remove(self.paquetePendienteMasCaro())
    }
  }
}