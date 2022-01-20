//
//  ViewController.swift
//  starWars
//
//  Created by etudiant on 18/01/2022.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    let headers : [String] = ["Personnages","Planètes","Vaisseaux","Espèce","Véhicules","Films"]
    var dataSource : [Int:[StarWarsObject]] = [:]
    var suggestion : [String] = []
    @IBOutlet weak var SuggestionTableView: UITableView!
    @IBOutlet weak var ResultTableView: UITableView!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var searchTxt: UITextField!
    @IBAction func searchBtn(_ sender: Any) {
        
        SuggestionTableView.isHidden = true
        
        dataSource = [:]
        let taskGroup = DispatchGroup()
        taskGroup.enter()
        NetworkManager.fechPeople(text: searchTxt.text ?? "") {[weak self] peoples in
            self?.dataSource[0] = (peoples ?? []) as [StarWarsObject]
            taskGroup.leave()
        }
        taskGroup.enter()
        NetworkManager.fechPlanets(text: searchTxt.text ?? "") {[weak self] planets in
            self?.dataSource[1] = (planets ?? []) as [StarWarsObject]
            taskGroup.leave()
        }
        taskGroup.enter()
        NetworkManager.fechStarships(text: searchTxt.text ?? "") {[weak self] starships in
            self?.dataSource[2] = (starships ?? []) as [StarWarsObject]
            taskGroup.leave()
        }
        taskGroup.enter()
        NetworkManager.fechSpecies(text: searchTxt.text ?? "") {[weak self] species in
            self?.dataSource[3] = (species ?? []) as [StarWarsObject]
            taskGroup.leave()
        }
        taskGroup.enter()
        NetworkManager.fechVehicles(text: searchTxt.text ?? "") {[weak self] vehicles in
            self?.dataSource[4] = (vehicles ?? []) as [StarWarsObject]
            taskGroup.leave()
        }
        taskGroup.enter()
        NetworkManager.fechFilms(text: searchTxt.text ?? "") {[weak self] films in
            self?.dataSource[5] = (films ?? []) as [StarWarsObject]
            taskGroup.leave()
        }
        
        taskGroup.notify(queue: .main){
            self.ResultTableView.reloadData()
            if let text = self.searchTxt.text{
                self.storeToUserDefaults(valueToStore: text)
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ResultTableView.dataSource = self
        ResultTableView.delegate = self
        searchTxt.delegate = self
        SuggestionTableView.dataSource = self
        SuggestionTableView.delegate = self
        
        searchBtn.layer.cornerRadius = 10.0
        SuggestionTableView.layer.cornerRadius = 10.0
        SuggestionTableView.isHidden = true
    }
    
    private func storeToUserDefaults(valueToStore value: String) {
            let ud = UserDefaults.standard
            var arrSaved = getFromUserDefaults() ?? []
            if !(arrSaved.contains(value) || value.isEmpty) {
                arrSaved.append(value)
                ud.set(arrSaved, forKey: "stored_value")
            }
        }

        private func getFromUserDefaults() -> [String]? {
            let ud = UserDefaults.standard
            let arrSaved = ud.array(forKey: "stored_value")
            return arrSaved as? [String]
        }
}

extension ViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let suggestionList = getFromUserDefaults(), let text = searchTxt.text{
            suggestion = suggestionList.filter{ word in
                return word.contains(text)
            }
            if !(suggestion.isEmpty){
                SuggestionTableView.isHidden = false
            }
            
            SuggestionTableView.reloadData()
            tableViewHeightConstraint.constant = CGFloat(suggestion.count * 40)
        }
        
        return true
    }
}

extension ViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == SuggestionTableView{
            return 40
        }else{
            return 80
        }
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == SuggestionTableView{
            return suggestion.count
        }else{
            return dataSource[section]?.count ?? 0
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == SuggestionTableView{
            return 1
        }else{
            return dataSource.count
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == SuggestionTableView{
            return ""
        }
        return headers[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == SuggestionTableView{
            return 0
        }else if let list = dataSource[section]{
            return list.isEmpty ? 0 : 40
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == SuggestionTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SuggestionCellId", for: indexPath)
            cell.textLabel?.text = suggestion[indexPath.row]
            
            return cell
            
        }else{
            let starWarsObject = dataSource[indexPath.section]?[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCellId", for: indexPath) as? SearchResultTableViewCell
            cell?.name.text = starWarsObject?.name
            
            return cell ?? SearchResultTableViewCell()
        }
        
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == SuggestionTableView {
            searchTxt.text = suggestion[indexPath.row]
            SuggestionTableView.isHidden = true
            
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "InfoViewId") as? InfoViewController
                    vc?.starWarsObject = dataSource[indexPath.section]?[indexPath.row]
                    if let vc = vc {
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
        }
       
    }
}

