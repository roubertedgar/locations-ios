extension Dimens {
    var pictureWidth : Double{
        switch scale {
        case 1.0 : return 45.0
        case 2.0 : return 55.0
        default : return 75.0
        }
    }
    
}
