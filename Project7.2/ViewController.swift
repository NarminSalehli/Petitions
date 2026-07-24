//
//  ViewController.swift
//  Project7.2
//
//  Created by Nərmin Salehli on 23.07.26.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()
    var filteredPetitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(creditTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(filterPetitions))
        
        
        let urlString: String
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return

            }
        }
        showError()
    }
    
    
    @objc func filterPetitions() {
        let ac = UIAlertController(title: "Filter", message: "Enter a keyword", preferredStyle: .alert)
        ac.addTextField()
        
        let submit = UIAlertAction(title: "Search", style: .default) { [weak self, weak ac]_ in
            guard let searchText = ac?.textFields?[0].text?.lowercased() else {return}
            self?.applyFilter(searchText)
        }
        ac.addAction(submit)
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
        
    }
    
    func applyFilter(_ text: String) {
        if text.isEmpty {
            filteredPetitions = petitions
        } else {
            filteredPetitions = petitions.filter {
                $0.title.lowercased().contains(text) ||
                $0.body.lowercased().contains(text)
            }
        }
        tableView.reloadData()
    }
    
    @objc func creditTapped() {
        let ac = UIAlertController(title: "Important", message: "This data comes from the White House's We The People API.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
    
    func showError() {
        let ac = UIAlertController(title: "Error", message: "There was a problem loadin the feed, pleasr check your connection and try again", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            filteredPetitions = petitions
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPetitions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = filteredPetitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = filteredPetitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }

}

