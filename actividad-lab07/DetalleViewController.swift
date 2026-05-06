import UIKit

class DetalleViewController: UIViewController {

    
    @IBOutlet weak var imgPlato: UIImageView!
    
    @IBOutlet weak var lblNombre: UILabel!
    
    @IBOutlet weak var txtDescripcion: UITextView!
    
    @IBOutlet weak var lblRegion: UILabel!
    
    @IBOutlet weak var lblIngredientes: UITextView!
    
        
    var plato : Plato?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        imgPlato.layer.cornerRadius = 12
        imgPlato.clipsToBounds      = true
        imgPlato.contentMode        = .scaleAspectFill
         
        mostrarDatos()

    }
    
    private func mostrarDatos() {
            guard let p = plato else { return }
     
            title = p.nombre                            // titulo en la barra de navegacion
     
            imgPlato.image      = p.foto
            lblNombre.text       = p.nombre
            lblRegion.text       = p.region
            txtDescripcion.text  = p.descripcion
            lblIngredientes.text = p.ingredientes
        }


}
