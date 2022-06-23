import UIKit

var password = Password()

class ViewController: UIViewController {
    
    var isBlack: Bool = false {
        didSet {
            if isBlack {
                self.view.backgroundColor = .black
            } else {
                self.view.backgroundColor = .white
            }
        }
    }
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var passwordFiled: UITextField!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicatorView.isHidden = true
        //self.bruteForce(passwordToUnlock: "1!gr")

    }
    
    //MARK: - Actions
    
    @IBAction func onBut(_ sender: Any) {
        isBlack.toggle()
    }
    
    @IBAction func generate(_ sender: Any) {
        print (password.generatePassword())
        indicatorView.isHidden = false
        generateButton.isEnabled = false
        indicatorView.startAnimating()
    }
}




