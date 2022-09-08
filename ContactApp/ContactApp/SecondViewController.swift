//
//  SecondViewController.swift
//  ContactApp
//
//  Created by user on 11/02/1444 AH.
//

import UIKit
import Firebase
var array : [String] = []


class SecondViewController: UIViewController {
    let db = Firestore.firestore()
    var item: [String] = []
    var serch = false
   var array : [String] = []
    
    @IBOutlet weak var search: UISearchBar!
    
    @IBOutlet weak var MyTabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyTabelView.delegate = self
        MyTabelView.dataSource = self
        search.delegate = self
        MyTabelView.register(UINib(nibName: "CustemTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        MyTabelView.reloadData()
        item = array
        redData()

       
    }
    
    
    @IBAction func addInformationUserButton(_ sender: Any) {
    performSegue(withIdentifier: "move2", sender: nil)
        
    }

    func redData(){
        
            self.db.collection("information").getDocuments { querySnapshot , error in
                guard error == nil else{
                    print("Error\(error!.localizedDescription)")
                               return
                    }
                
            for doc in querySnapshot!.documents {
                let data = doc.data()
                
                DispatchQueue.main.async {

                    self.array.append(data["nameUser"]as! String)
                    self.item = self.array
                    self.MyTabelView.reloadData()
                }
                
            }
                
                }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "move3", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "move3"{
            if let VCus = segue.destination as? ForthViewController{
                VCus.name1 =  array[sender as! Int]
                
                
                
            }}
    }

    

    

}


extension SecondViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if serch{
            return  item.count
        }else{
            
        return array.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyTabelView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustemTableViewCell
        if serch {
            cell.nameLabel.text = ("\(item[indexPath.row])")
            
            
        }else{
            cell.nameLabel.text = array[indexPath.row]
            
        }
        return cell
        
    }
    
    
    
    
}

extension SecondViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        item = array.filter({$0.lowercased().prefix(searchText.count) == searchText})
        serch = true
        MyTabelView.reloadData()
          
    }
}




