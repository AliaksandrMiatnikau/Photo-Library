
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    private var imageArray: [UIImage] = []
    private var imageUrlArray: [URL] = []
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onAddButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        let imageURL = info[.referenceURL] as! URL
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageArray.append(image)
        imageUrlArray.append(info[.referenceURL] as! URL)
        picker.dismiss(animated: true, completion: nil)
        print(imageArray)
    }
}

