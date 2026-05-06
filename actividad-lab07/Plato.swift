import UIKit

class Plato: NSObject {

    var nombre: String = ""
    var region: String = ""
    var descripcion: String = ""
    var ingredientes: String = ""
    var foto: UIImage!

    init(nombre: String, region: String, descripcion: String,
         ingredientes: String, foto: UIImage!) {
        self.nombre       = nombre
        self.region       = region
        self.descripcion  = descripcion
        self.ingredientes = ingredientes
        self.foto         = foto
    }
}
