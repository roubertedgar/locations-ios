internal extension Dimens {
    var headerImageHeight : Double{
        switch scale {
        case 1.0 : return 150
        case 2.0 : return 190
        default : return 220
        }
    }
}

extension Dimens {
    var reviewPictureWidth : Double{
        switch scale {
        case 1.0 : return 45.0
        case 2.0 : return 55.0
        default : return 65.0
        }
    }
}


