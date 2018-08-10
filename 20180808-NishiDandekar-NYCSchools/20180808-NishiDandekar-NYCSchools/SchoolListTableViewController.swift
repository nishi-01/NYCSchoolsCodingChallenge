//
//  SchoolListTableViewController.swift
//  20180808-NishiDandekar-NYCSchools
//
//  Created by Nishigandha Dandekar on 8/9/18.
//  Copyright © 2018 Nishigandha Dandekar. All rights reserved.
//

import UIKit

class SchoolListTableViewController: UITableViewController {

    var displaySchools: [School] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "NYC School List"
        let dataManager = DataManager()
        dataManager.getSATData { [weak self] (schools) in
            guard let schools = schools else {
                return
            }
            self?.displaySchools = schools
            DispatchQueue.main.async {
                // Switch to main queue to reload the table data
                self?.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displaySchools.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "schoolListCell", for: indexPath)
        let school = displaySchools[indexPath.row]
        cell.textLabel?.text = school.school_name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let destinationVC = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as? DetailViewController else {
            return
        }
        destinationVC.selectedSchool = displaySchools[indexPath.row]
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}
