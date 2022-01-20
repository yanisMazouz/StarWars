//
//  InfoViewController.swift
//  starWars
//
//  Created by etudiant on 19/01/2022.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var InfosTableView: UITableView!
    @IBOutlet weak var goToPlanetBtn: UIButton!
    @IBAction func GoToTabAction(_ sender: Any) {
        if let people = starWarsObject as? People, let url =  people.homeworld{
            NetworkManager.fechPlanet(url: url) {[weak self] planet in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "InfoViewId") as? InfoViewController
                        vc?.starWarsObject = planet
                        if let vc = vc {
                            self?.navigationController?.pushViewController(vc, animated: true)
                        }
            }
        }
    }
    
    public var starWarsObject : StarWarsObject?
    override func viewDidLoad() {
        super.viewDidLoad()
        InfosTableView.dataSource = self
        InfosTableView.delegate = self
        if !(starWarsObject is People) {
            goToPlanetBtn.isHidden = true
        }

        // Do any additional setup after loading the view.
    }
    
}

extension InfoViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension InfoViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        (starWarsObject?.getListInfos().count) ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = starWarsObject?.getListInfos()[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCellId", for: indexPath) as? InfoTableViewCell
        if let info = info,let  cell = cell {
            cell.title.text =  "\( info.0) : "
            cell.info.text = info.1
            return cell
        }
         return InfoTableViewCell()
       
    }
}
