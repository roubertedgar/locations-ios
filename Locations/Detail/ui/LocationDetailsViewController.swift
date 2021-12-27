import UIKit

class LocationDetailsViewController : UIViewController {
    
    private let locationDetailsView = LocationDetailsView()
    
    override func loadView() {
        super.loadView()
        
        locationDetailsView.topbarHeight = topBarHeight
        
        view.addSubview(locationDetailsView)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            locationDetailsView.topAnchor.constraint(equalTo: view.topAnchor),
            locationDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            locationDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationDetailsView.image.loadImage("https://images.pexels.com/photos/1124960/pexels-photo-1124960.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
        locationDetailsView.aboutText.text = "Se você curte um pão fresquinho, ou uma sobremesa caprichada, você precisa incluir uma visitinha a Padaria Pelicano no seu roteiro por BH. A fila é gigantesca, mas os quitutes estão sem dúvida entre os melhores da cidade."
        
        let locationInfo = LocationInfo(workingHours: "Seg a sex: 7h às 23h\nsáb e dom: 8h às",
                                        phoneNumber: "+55 37 991429601",
                                        address: "Rua do ouro, 297 - Serra\nBelo Horizonte - MG")
        locationDetailsView.locationDetailInfo.bind ( info: locationInfo)
        locationDetailsView.reviews = [Review(author: "Edgarrr"),Review(author: "Edgarrr"),Review(author: "Edgarrr")]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewWillDisappear(animated)
    }
}
