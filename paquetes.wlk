import destinos.*
object paquete {
  var estaPago = false
  var destino = matrix

  method estaPago() {
    return estaPago
  }

  method precio() {
    return 50
  }

  method pagarPaquete() {
    estaPago = true
  }

  method cambiarDestino(unDestino) {
    destino = unDestino
  }

  method sePuedeEntregar(unMensajero) {
    return destino.puedePasar(unMensajero) && estaPago
  }
}

object paquetito {
  var destino = matrix

  method estaPago() {
    return true
  }

  method cambiarDestino(unDestino) {
    destino = unDestino
  }

  method precio() {
    return 0
  }

  method sePuedeEntregar(unMensajero) {
    return true
  }
}

object paquetonViajero {
  const destinos = []
  var pagos = 0

  method precio() {
    return 100 * destinos.size()
  }

  method pagar(unMonto) {
    pagos = self.precio() + unMonto
  }

  method agregarDestinos(unDestino) {
    destinos.add(unDestino)
  }

  method estaPago() {
    return pagos >= self.precio()
  }

  method pueePasarPorDestinos(unMensajero) {
    return destinos.all({destino => destino.puedePasar(unMensajero)})
  }

  method sePuedeEntregar(unMensajero) {
    return destinos.all({destino => destino.puedePasar(unMensajero)}) && self.estaPago()
  }
}