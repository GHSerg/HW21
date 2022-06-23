import UIKit

let globalQueue = DispatchQueue.global()
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
    @IBOutlet weak var passwordLabel: UILabel!

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var passwordFiled: UITextField!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        indicatorView.isHidden = true
    }

    // MARK: - Actions

    @IBAction func onBut(_ sender: Any) {
        isBlack.toggle()
    }

    @IBAction func generate(_ sender: Any) {
        let generatePassword: String = { password.generatePassword() }()

        passwordFiled.text = generatePassword

        globalQueue.async {
            let foundPassword: String = { password.bruteForce(passwordToUnlock: generatePassword)}()

            DispatchQueue.main.async {
                self.passwordLabel.text = foundPassword
                self.indicatorView.isHidden = true
                self.generateButton.isEnabled = true
                self.passwordFiled.isSecureTextEntry = false
                self.indicatorView.stopAnimating()
            }
        }

        passwordLabel.text = ""
        indicatorView.isHidden = false
        generateButton.isEnabled = false
        indicatorView.startAnimating()
        passwordFiled.isSecureTextEntry = true
    }
}
