import celular_vehiculos.*
object roberto {
  var vehiculo = bici

  method peso() {
    return 90 + vehiculo.peso()
  }

  method cambiarVehiculo(unVehiculo) {
    vehiculo = unVehiculo
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
  const dispositivo = celular 

  method peso() {
    return 0
  }

  method dispositivo() {
    return dispositivo
  }

  method puedeLlamar() {
    return dispositivo.tieneCredito()
  }
}