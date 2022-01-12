
struct Review {
    
    let title : String
    let review : String
    let author : String
    let rating : Double
    
    init(
        title : String,
        review : String,
        author : String,
        rating : Double){
            self.title = title
            self.review = review
            self.author = author
            self.rating = rating
        }
}
