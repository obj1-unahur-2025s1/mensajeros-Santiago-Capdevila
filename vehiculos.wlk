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