import mensajeros.*
import destinos.*


object mensajeria {
  const mensajeros = []
  const paquetesPendientes = []
  var totalFacturado = 0

  method mensajeros() {
    return mensajeros
  }

  method totalFacturado() {
    return totalFacturado
  }

  method cantidadDeMensajeros() {
    return mensajeros.size()
  }

  method contratar(unMensajero) {
    mensajeros.add(unMensajero)
  }

  method despedir(unMensajero) {
    mensajeros.remove(unMensajero)
  }

  method despedirATodos() {
    mensajeros.clear()
  }  

  method esGrande() {
    return mensajeros.size() > 2
  }

  method puedeSerEntregadoPorElPrimero(unPaquete, unLugar) {
    return unPaquete.puedeEntregarse(unLugar, mensajeros.first())
  }

  method pesoUltimoMensajero() {
    return mensajeros.last().peso()
  }

  method puedeSerEntregadoAlMenosPorUno(unPaquete, unLugar) {
    return self.mensajeros().any({mensajero => unPaquete.puedeEntregarse(unLugar, mensajero)})
  }

  method cantidadDeMensajerosQuePuedenLlevar(unPaquete, unLugar) {
    return self.mensajeros().filter({mensajero => unPaquete.puedeEntregarse(unLugar, mensajero)})
  }

  method peso() {
    var pesoTotal = 0 
    mensajeros.forEach({mensajero => pesoTotal = pesoTotal + mensajero.peso()})
    return pesoTotal / mensajeros.size()
  }

  method enviarPaquete(unPaquete, unLugar) {
    if (self.puedeSerEntregadoAlMenosPorUno(unPaquete, unLugar)) {
      totalFacturado = totalFacturado + unPaquete.precio()
    }
    else {
      paquetesPendientes.add(unPaquete)
    }
  }

  method enviarPaquetes(paquetes, unLugar) {
    paquetes.forEach({paquete => self.enviarPaquete(paquete, unLugar)})
  }

  method paquetePendienteCaro() {
    var paqueteCaro = paquetesPendientes.first()

    paquetesPendientes.forEach({paquete => if (paquete.precio() > paqueteCaro.precio()) {paqueteCaro = paquete}})

    return paqueteCaro
  }

  method enviarPaquetePendienteCaro(unLugar) {
    paquetesPendientes.remove(self.paquetePendienteCaro())
    totalFacturado = totalFacturado + self.paquetePendienteCaro().precio()
  }
}