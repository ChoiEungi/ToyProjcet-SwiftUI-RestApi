import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    var urlString: String
    
    init(urlString: String){
        self.urlString = urlString
        loadImageFromURL()
    }
    
    func loadImageFromURL(){
        
        guard let url = URL(string: urlString) else {return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let hasData = data else{ return}
            
            guard let loadedImage = UIImage(data: hasData) else {return}
            DispatchQueue.main.async {
                self.image = loadedImage
            }
        }.resume()
        
    }
}

struct URLImageView: View {
    @ObservedObject var loader: ImageLoader
    
    init(urlString: String){
        self.loader = ImageLoader(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: loader.image ?? UIImage(named: "placeHolderImage")!)
            .resizable()
            .frame(width: 50, height: 50)
            .aspectRatio(contentMode: .fill)
    }
}
