import celular_vehiculos.*
object roberto {
  var transporte = bici

  method peso() {
    return 90 + transporte.peso()
  }

  method cambiarTransporte(unTransporte) {
    transporte = unTransporte
  }

  method puedeLlamar() {
    return false
  }
}

object chuckNorris {
  method peso() {
    return 80
  }

  method puedeLlamar() {
    return true
  }
}

object neo {
  var tieneCredito = true

  method peso() {
    return 0
  }

  method cargarCredito() {
    tieneCredito = true
  }

  method agotarCredito() {
    tieneCredito = false
  }

  method puedeLlamar() {
    return tieneCredito
  }
}