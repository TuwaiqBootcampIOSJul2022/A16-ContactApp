//
//  ViewController.swift
//  ContesAp
//
//  Created by Hessa on 12/02/1444 AH.
//

import UIKit

class ViewController: UIViewController , ViewControllerDelegate,UISearchBarDelegate {

    
    func sendDataToFirstViewController(ListArr: [Contents]) {
        contactsname = ListArr
        tabelview.reloadData()
    }
    
    @IBOutlet weak var tabelview: UITableView!
    
    @IBOutlet weak var searchcontects: UISearchBar!
    
    
   
    
    var contactsname = [Contents]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

   
    



    @IBAction func AddTo(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        let navController = UINavigationController(rootViewController: vc)
        vc.contactsname = self.contactsname
        vc.delegate = self
        present(navController, animated: true)
    }
    
    }

    
    extension ViewController: UITableViewDelegate, UITableViewDataSource {
        
        
//        func numberOfSections(in tableView: UITableView) -> Int {
//            return 1
//        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return contactsname.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            let data = contactsname[indexPath.row]
            cell.setupcell(firstname: data.Firstname)
            cell.named.text = contactsname[indexPath.row].Firstname
//            cell.named.text = contactsname[indexPath.row].Lastname
            return cell
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "seq", sender: self)
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? ViewController3 {
                destination.contactsdisplay = contactsname[(tabelview.indexPathForSelectedRow?.row)!]
                tabelview.deselectRow(at: tabelview.indexPathForSelectedRow!, animated: true)

    
            }
    }
        
    }
    struct Contents {
        var Firstname : String
        var Lastname :String
        var phonenumber:String
        var conteactNote:String
    }

