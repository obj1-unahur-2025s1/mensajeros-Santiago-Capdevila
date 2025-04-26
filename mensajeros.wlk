object roberto {
  var vehiculo = camion

  method peso() {
    return 90 + vehiculo.peso()
  }

  method vehiculo(unVehiculo) {
    vehiculo = unVehiculo
  }

  method puedeLlamar() {
    return false
  }
}

object chuckNorris {
  var vehiculo = null

  method peso() {
    return 80
  }

  method vehiculo(unVehiculo) {
    vehiculo = unVehiculo
  }

  method puedeLlamar() {
    return true
  }
}

object neo {
  var vehiculo = null
  const dispositivo = celular

  method peso() {
    return 0
  }

  method vehiculo(unVehiculo) {
    vehiculo = unVehiculo
  }

  method puedeLlamar() {
    return dispositivo.tieneCredito()
  }
}

// Vehiculos

object bici {
  method peso() {
    return 5
  }
}

object camion {
  var acoplados = 1

  method peso() {
    return 500 * acoplados
  }

  method agregarAcoplado(unNumero) {
    acoplados =+ unNumero
  }

  method sacarAcoplado(unNumero) {
    acoplados = 0.min(acoplados - unNumero)
  }
}

// Otros

object celular {
  var credito = 5

  method tieneCredito() {
    return credito > 0 
  }

  method llamar() {
    credito = 0.min(credito - 1)
  }

  method cargarCredito(unNumero) {
    credito =+ unNumero
  }
}