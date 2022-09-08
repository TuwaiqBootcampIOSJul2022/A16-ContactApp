//
//  ViewController2.swift
//  ContesAp
//
//  Created by Hessa on 12/02/1444 AH.
//

import UIKit

    protocol ViewControllerDelegate {
    func sendDataToFirstViewController(ListArr: [Contents])
}


class ViewController2: UIViewController {

    @IBOutlet weak var selectimage: UIImageView!
    
    @IBOutlet weak var firstname: UITextField!
    
    @IBOutlet weak var lastname: UITextField!
    
    @IBOutlet weak var phonenumber: UITextField!
    
    @IBOutlet weak var note: UITextField!
    
    
    
    var contactsname = [Contents]()
    var delegate: ViewControllerDelegate! = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()

        selectimage.image = UIImage(named: "profile")!
        
    }
    func configureViewController() {
        view.backgroundColor = .systemBackground
        let AddButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(DismissVC))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        
        self.navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = AddButton
        self.title = "New Contact"
        
    
    }
    
    @objc func DismissVC()
    {
        contactsname.append(Contents(Firstname: firstname.text ?? "d", Lastname: lastname.text!, phonenumber: phonenumber.text!, conteactNote: note.text ?? ""))
        self.delegate.sendDataToFirstViewController(ListArr: contactsname)
        dismiss(animated: true)

    }
    
    @objc func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }
}
