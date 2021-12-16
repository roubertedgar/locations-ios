import UIKit
import MapKit

class LocationInfoView: View{
    private let workingHoursText = Label()
    private let phoneNumberText = Label()
    private let addressText = Label()
    private let workingHoursIcon = ImageView().apply { it in it.image = UIImage(named: "ic_clock")}
    private let phoneNumberIcon = ImageView().apply { it in it.image = UIImage(named: "ic_phone")}
    private let addressIcon = ImageView().apply { it in it.image = UIImage(named: "ic_pin")}
    
    override init(){
        super.init()
        
        addSubview(workingHoursText)
        addSubview(workingHoursIcon)
        
        addSubview(phoneNumberText)
        addSubview(phoneNumberIcon)
        
        addSubview(addressText)
        addSubview(addressIcon)
        
        NSLayoutConstraint.activate([
            workingHoursText.topAnchor.constraint(equalTo: topAnchor),
            workingHoursText.leadingAnchor.constraint(equalTo:workingHoursIcon.trailingAnchor, constant: 12),
            workingHoursText.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            workingHoursIcon.topAnchor.constraint(equalTo:  workingHoursText.topAnchor),
            workingHoursIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            workingHoursIcon.heightAnchor.constraint(equalToConstant: workingHoursText.font.lineHeight),
            workingHoursIcon.widthAnchor.constraint(equalToConstant: workingHoursText.font.lineHeight),
            
            phoneNumberText.topAnchor.constraint(equalTo: workingHoursText.bottomAnchor, constant: 20),
            phoneNumberText.leadingAnchor.constraint(equalTo:workingHoursText.leadingAnchor),
            phoneNumberText.trailingAnchor.constraint(equalTo: workingHoursText.trailingAnchor),
            
            phoneNumberIcon.topAnchor.constraint(equalTo:  phoneNumberText.topAnchor),
            phoneNumberIcon.leadingAnchor.constraint(equalTo: workingHoursIcon.leadingAnchor),
            phoneNumberIcon.heightAnchor.constraint(equalToConstant: phoneNumberText.font.lineHeight),
            phoneNumberIcon.widthAnchor.constraint(equalToConstant: phoneNumberText.font.lineHeight),
            
            addressText.topAnchor.constraint(equalTo: phoneNumberText.bottomAnchor, constant: 20),
            addressText.bottomAnchor.constraint(equalTo: bottomAnchor),
            addressText.leadingAnchor.constraint(equalTo:workingHoursText.leadingAnchor),
            addressText.trailingAnchor.constraint(equalTo: workingHoursText.trailingAnchor),
            
            addressIcon.topAnchor.constraint(equalTo: addressText.topAnchor),
            addressIcon.leadingAnchor.constraint(equalTo: workingHoursIcon.leadingAnchor),
            addressIcon.heightAnchor.constraint(equalToConstant: addressText.font.lineHeight),
            addressIcon.widthAnchor.constraint(equalToConstant: addressText.font.lineHeight)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func bind(info: LocationInfo){
        workingHoursText.text = info.workingHours
        phoneNumberText.text = info.phoneNumber
        addressText.text = info.address
    }
}


struct LocationInfo{
    
    let workingHours: String
    let phoneNumber: String
    let address: String
    
    init(workingHours: String,
         phoneNumber: String,
         address: String){
        
        self.workingHours = workingHours
        self.phoneNumber = phoneNumber
        self.address = address
    }
}
