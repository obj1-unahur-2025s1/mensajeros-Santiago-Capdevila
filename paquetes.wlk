object paquete {
  var estaPago = false

  method estaPago() {
    return estaPago
  }

  method precio() {
    return 50
  }

  method pagarPaquete() {
    estaPago = true
  }

  method sePuedeEntregar() {
    return self.estaPago()
  }
}

object paquetito {
  method estaPago() {
    return true
  }

  method precio() {
    return 0
  }

  method sePuedeEntregar() {
    return self.estaPago()
  }
}

object paquetonViajero {
  const destinos = []
  const precio = 100 * destinos.size()
  var pagos = 0

  method pagar(unMonto) {
    pagos = pagos + unMonto
  }

  method precio() {
    return precio
  }

  method agregarDestinos(unDestino) {
    destinos.add(unDestino)
  }

  method estaPago() {
    return pagos == precio
  }

  method sePuedeEntregar() {
    return self.estaPago()
  }
}