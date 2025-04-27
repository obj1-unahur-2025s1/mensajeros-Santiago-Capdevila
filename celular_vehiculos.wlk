// Celular
object celular {
  var credito = 0

  method cargarCredito(unNumero) {
    credito += unNumero
  }

  method tieneCredito() {
    return credito > 0
  }
}

// Vehiculos
object bici {
  method peso() {
    return 5
  }
}

object camion {
  var acoplados = 0

  method peso() {
    return acoplados * 500  
  }

  method agregarAcoplado(unNumero) {
    acoplados = acoplados + unNumero
  }

  method sacarAcoplado() {
    acoplados = 0.min(acoplados - 1)
  }
}