//
//  ViewController.swift
//  Contect
//
//  Created by AlenaziHazal on 11/02/1444 AH.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseCore
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var tableViewMain: UITableView!
    @IBOutlet weak var editContectMain: UIBarButtonItem!
    var name:[String] = []
    var filterData = [""]
    
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        navigationItem.leftBarButtonItem = editButtonItem
        search.delegate = self
        readData()
        filterData = name
        tableViewMain.reloadData()
    }
    

    @IBAction func addContectMain(_ sender: Any) {
        performSegue(withIdentifier: "addContect", sender: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    func readData(){
        db.collection("contect").getDocuments { QuerySnapshot , Erorr in
            for add in QuerySnapshot!.documents{
                let data = add.data()
                guard data["firstName"] != nil else{
                    print("\(Erorr?.localizedDescription)")
                    return
                }
                self.name.append("\(data["firstName"]!)")
                print("\(data)")
                
            }
            self.filterData = self.name
            self.tableViewMain.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellMain
        cell.contectName.text = filterData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
//            toDos.remove(at: indexPath.row)
//            db.collection("contect")
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    @IBAction func unwindSave(segue:UIStoryboardSegue){
        self.tableViewMain.reloadData()
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterData = []
        
        if searchText == ""{
            filterData = name
        }
        
        for search in name{
            if (search ).uppercased().contains(searchText.uppercased())
            {
                filterData.append(search)
            }
        }
        tableViewMain.reloadData()
    }
}
