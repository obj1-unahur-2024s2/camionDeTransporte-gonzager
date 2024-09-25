object camion {
    const cosas = []
    method cargar(unaCosa) {
        cosas.add(unaCosa)
        unaCosa.consecuencia()
    }
    method descarcar(unaCosa) {
        cosas.remove(unaCosa)
    }

    method peso() {
        return 1000 + cosas.sum( { c => c.peso()})
    }

    method sonNumerosImpares() {
        return cosas.all( {c=>c.peso().odd()})
    }
    method sonNumerosImpares2() {
        return not cosas.any( {c=>c.peso().even()})
    }

    method cosaQuePesa(unValor) {
        return cosas.any({ c => c.peso()== unValor})
    }

    method nivelPeligrosidad(unNivelPeligrosidad) {
        return cosas.find( { c=>c.peligrosidad() == unNivelPeligrosidad })
    }

    method cosasQueSuperan(unNivelPeligrosidad) {
        return cosas.filter( { c=> c.peligrosidad()>unNivelPeligrosidad})
    }

   method cosasQueSuperanA(unaCosa) {
        return self.cosasQueSuperan(unaCosa.peligrosidad())
    }

    method estaExcedido() {
        return self.peso() > 2500
    }
    method puedeCircular(unNivelPeligrosidad) {
        return not self.estaExcedido() 
        and self.todasSonMenosPeligrosas(unNivelPeligrosidad)
    }

    method todasSonMenosPeligrosas(unNivelPeligrosidad) {
        return cosas.all( {c=> c.peligrosidad()< unNivelPeligrosidad })
    }


}