
import LocalAuthentication
import UIKit
import FirebaseAuth
import GoogleSignIn

var brain = AppBrain()

class userViewController: UIViewController {
  
    @IBOutlet weak var userType: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       userImage.layer.cornerRadius = userImage.frame.size.width/2
        userImage.clipsToBounds = true
        navigationController?.title = "Profile"
        // To get shake gesture
        self.becomeFirstResponder()
    }
    
    // Willing to become first responder to get shake motion
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    // table view sections
  
    
    
    
    
    
    
    
    // Enable detection of shake motion
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let rateUsMenu = UIAlertController(title: nil, message: "Thank You for using Yellow Bus", preferredStyle: .actionSheet)

            let rateUsAction = UIAlertAction(title: "Rate Us", style: .default, handler: { action in self.rateUS()})
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
           rateUsMenu.addAction(rateUsAction)
            rateUsMenu.addAction(cancelAction)
            self.present(rateUsMenu, animated: true, completion: nil)

        }
    }
    
    @IBAction func signOut(_ sender: UIButton) {
    
    }
    func rateUS(){
        print("User want to rate us")
    }
    func showSignOut(){
        let signOutMenu = UIAlertController(title: nil, message: "Thank You for using Yellow Bus", preferredStyle: .actionSheet)
            
            let signOutAction = UIAlertAction(title: "Sign Out", style: .destructive, handler: { action in self.signOut()})
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            signOutMenu.addAction(signOutAction)
          signOutMenu.addAction(cancelAction)
            self.present(signOutMenu, animated: true, completion: nil)
          
    }
    func signOut(){
        brain.navFeedback()
              do{
                  try GIDSignIn.sharedInstance().signOut()
                navigationController?.popToRootViewController(animated: true)
              }
              catch let err{
                  print(err.localizedDescription)
              }
    }
}
