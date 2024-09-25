object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bultos() =1
    method consecuencia(){}
}

object bumblebee {
    var estado = auto
    method peso() = 800
    method peligrosidad()= estado.peligrosidad()
    method transformar(unEstado) {
        estado = unEstado
    }
    method bultos() = 2
    method consecuencia(){
        estado = robot
    }
}

object robot {
    method peligrosidad() = 30
}

object auto {
    method peligrosidad() = 15
}

object ladrillos {
    var property cantidad = 0
    method peso() = 2 * cantidad
    method peligrosidad() = 2
    method bultos(){
        if (cantidad.between(0, 100)) return 1
        if (cantidad.between(101, 300)) return 2
        return 3
    }
    method consecuencia(){
        cantidad += 12
    }
}

object arena {
    var property peso = 0
    method peligrosidad() = 1
    method bultos() =1 
    method consecuencia(){
        peso = 0.max(peso - 10)
    }
}

object bateriaAntiaerea {
    var estaCargada = false
    method peso() = if(estaCargada) 300 else 200
    method peligrosidad() = if(estaCargada) 100 else 0
    method cargar() {
        estaCargada = true
    }
    method descargar() {
        estaCargada = false
    }
    method bultos() = if(estaCargada) 2 else 1
    method consecuencia(){
        self.cargar()
    }

}

object contenedor {
    const cosas = []
    method agregarCosa(unaCosa) {
        cosas.add(unaCosa)
    }
    method peso() {
        return 100 + cosas.sum( { c => c.peso() })
    }
    method peligrosidad() {
        if (cosas.isEmpty()) return 0
        return cosas.max( { c=> c.peligrosidad()}).peligrosidad()
    }

    method bultos() {
        return 1 + cosas.sum( { c=> c.bultos()})
    }
    method consecuencia(){
        cosas.forEach({c=>c.consecuencia()})
    }
}

object residuos {
    var property peso = 0
    method peligrosidad() = 200
    method bultos() =1
    method consecuencia(){
        peso += 15
    }
}

object embalajeSeguridad {
    var property cosaEnvuelta = cosaNulleable
    method peso() = cosaEnvuelta.peso()
    method peligrosidad()= cosaEnvuelta.peligrosidad() * 0.5
    method bultos() =2
    method consecuencia(){}
}

object cosaNulleable {
    method peso()= 0
    method peligrosidad() = 0
    
}