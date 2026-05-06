import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var listaPlatos = [
            Plato(nombre: "Ceviche",
                  region: "Lima / Costa",
                  descripcion: "El plato nacional del Perú. Trozos de pescado fresco marinados en jugo de limón (leche de tigre), mezclados con cebolla roja, ají limo y cilantro. Una explosión de sabores cítricos y picantes.",
                  ingredientes: "Pescado fresco, jugo de limón, cebolla roja, ají limo, cilantro, choclo, camote",
                  foto: UIImage(named: "ceviche")),
     
            Plato(nombre: "Lomo Saltado",
                  region: "Lima / Nacional",
                  descripcion: "Plato de la cocina chifa peruana. Tiras de lomo de res salteadas con cebolla, tomate, ají amarillo y sillao. Se acompaña con papas fritas y arroz blanco.",
                  ingredientes: "Lomo de res, cebolla roja, tomate, ají amarillo, sillao, vinagre, papas fritas, arroz",
                  foto: UIImage(named: "lomo")),
     
            Plato(nombre: "Ají de Gallina",
                  region: "Lima / Costa",
                  descripcion: "Cremoso guiso de pollo deshilachado en salsa amarilla hecha con ají amarillo, pan remojado, leche y nueces. Se sirve con papas amarillas y huevo duro.",
                  ingredientes: "Pechuga de pollo, ají amarillo, pan de molde, leche evaporada, nueces, papas amarillas",
                  foto: UIImage(named: "aji_de_gallina")),
     
            Plato(nombre: "Causa Limeña",
                  region: "Lima / Costa",
                  descripcion: "Plato frío con papa amarilla sazonada con ají amarillo y limón, rellena con atún o pollo mezclado con mayonesa. Se presenta en forma de terrina individual.",
                  ingredientes: "Papa amarilla, ají amarillo, limón, atún o pollo, mayonesa, aguacate, huevo duro",
                  foto: UIImage(named: "causa")),
     
            Plato(nombre: "Anticuchos",
                  region: "Lima / Nacional",
                  descripcion: "Brochetas de corazón de res marinadas en ají panca, vinagre, ajo y comino, asadas a las brasas. El plato más representativo de la gastronomía callejera peruana.",
                  ingredientes: "Corazón de res, ají panca, vinagre, ajo, comino, orégano, papas, choclo",
                  foto: UIImage(named: "anticuchos")),
     
            Plato(nombre: "Rocoto Relleno",
                  region: "Arequipa / Sur",
                  descripcion: "Plato emblemático arequipeño. Rocoto (pimiento andino picante) relleno con carne molida, cebolla, huevo y pasas, cubierto con queso y horneado.",
                  ingredientes: "Rocoto, carne molida, cebolla, huevo, pasas, maní, queso fresco, leche, aceitunas",
                  foto: UIImage(named: "rocoto_relleno")),
     
            Plato(nombre: "Cuy Chactado",
                  region: "Cusco / Sierra",
                  descripcion: "Plato andino tradicional con miles de años de historia. Cuy aplanado y frito hasta quedar crujiente, acompañado de papas nativas, maíz andino y salsa de ají.",
                  ingredientes: "Cuy entero, ajo, comino, sal, pimienta, aceite, papas nativas, maíz cancha",
                  foto: UIImage(named: "cuy_chactado")),
     
            Plato(nombre: "Juane",
                  region: "Loreto / Selva",
                  descripcion: "Plato representativo de la Amazonía. Arroz con pollo, huevo y aceitunas sazonado con sacha culantro, envuelto en hojas de bijao y cocido al vapor.",
                  ingredientes: "Arroz, pollo, huevo duro, aceitunas, sacha culantro, cúrcuma, hojas de bijao",
                  foto: UIImage(named: "juane")),
     
            Plato(nombre: "Pachamanca",
                  region: "Huancayo / Sierra",
                  descripcion: "Técnica ancestral de cocción bajo tierra con piedras calientes. Se cocinan carnes, papas nativas, habas y humitas. Ritual gastronómico que simboliza la conexión con la Pachamama.",
                  ingredientes: "Res, cerdo, pollo, cuy, papas nativas, habas, choclo, humitas, hierbas andinas",
                  foto: UIImage(named: "pachamanca")),
     
            Plato(nombre: "Arroz con Leche",
                  region: "Nacional / Postres",
                  descripcion: "Postre cremoso de arroz cocido en leche entera con azúcar, canela y clavo de olor. Uno de los postres más queridos en todo el Perú.",
                  ingredientes: "Arroz, leche entera, azúcar, canela, clavo de olor, cáscara de limón, leche condensada",
                  foto: UIImage(named: "arroz_con_leche"))
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // ¿Cuántas secciones tiene la tabla?
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // ¿Cuántas filas tiene cada sección?
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return listaPlatos.count
    }

    // Configurar cada celda
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Reutilizar celda con el Identifier que pusiste en el Storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPlato", for: indexPath)

        // Obtener el plato de esta fila
        let plato = listaPlatos[indexPath.row]

        // Configurar usando defaultContentConfiguration (iOS 14+)
        var config = cell.defaultContentConfiguration()
        config.text          = plato.nombre      // título principal
        config.secondaryText = "📍 \(plato.region)" // subtítulo
        config.image         = plato.foto         // imagen a la izquierda
        config.imageProperties.maximumSize = CGSize(width: 50, height: 50)
        config.imageProperties.cornerRadius = 8
        cell.contentConfiguration = config

        // Flecha indicadora al lado derecho
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    // ----------------------------------------------------------
    // MARK: - UITableViewDelegate  –  selección de celda
    // ----------------------------------------------------------
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {

        // Obtener el plato seleccionado
        let platoSeleccionado = listaPlatos[indexPath.row]

        // Instanciar la pantalla de detalle desde el Storyboard
        // El Identifier del ViewController de detalle debe llamarse "DetalleVC"
        let detalleVC = storyboard?.instantiateViewController(
                            withIdentifier: "DetalleVC") as! DetalleViewController

        // Pasar el plato seleccionado
        detalleVC.plato = platoSeleccionado

        // Navegar a la pantalla de detalle (push)
        navigationController?.pushViewController(detalleVC, animated: true)
    }
}
