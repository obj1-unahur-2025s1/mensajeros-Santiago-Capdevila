object puenteDeBrooklyn {
  method puedePasar(unMensajero) {
    return unMensajero.peso() <= 1000
  }
}

object matrix {
  method puedePasar(unMensajero) {
    return unMensajero.puedeLlamar()
  }
}

// Paquetes

object paquete {
  var pago = 0

  method estaPago() {
    return pago >= 50
  }

  method pagarPaquete(unaCantidad) {
    pago = pago + unaCantidad
  }

  method precio() {
    return pago
  }

  method puedeEntregarse(unLugar, unMensajero) {
    return unLugar.puedePasar(unMensajero) && self.estaPago()
  }
}

object paquetito {
  method estaPago() {
    return true
  }

  method precio() {
    return 0
  }

  method puedeEntregarse(unLugar, unMensajero) {
    return unLugar.puedePasar(unMensajero)
  }
}

object paquetonViajero {
  var pago = 0

  method estaPago() {
    return pago >= 100
  }

  method pagarPaquete(unaCantidad) {
    pago = pago + unaCantidad
  }

  method precio() {
    return pago
  }

  method puedeEntregarse(unMensajero, unLugar) {
    return self.estaPago() && puenteDeBrooklyn.puedePasar(unMensajero) && matrix.puedePasar(unMensajero)
  }
}