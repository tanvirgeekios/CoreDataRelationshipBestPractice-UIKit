//
//  ViewController.swift
//  CoreDataRelationship
//
//  Created by MD Tanvir Alam on 18/3/21.
//

import UIKit

class CollegeListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var arrCollege = [College]()
    //MARK:- Outlets
    @IBOutlet weak var collegeListTable: UITableView!
    
    //MARK:- lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arrCollege = DatabaseHelper.shared.getAllCollegeData()
        collegeListTable.delegate = self
        collegeListTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.arrCollege = DatabaseHelper.shared.getAllCollegeData()
        collegeListTable.reloadData()
    }
    
    //MARK:- TableViewDelegateMethods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrCollege.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "collegeCell", for: indexPath) as! CollegeCell
        cell.collegeNameTxt.text = arrCollege[indexPath.row].name ?? "No Name"
        cell.collegeCityTxt.text = arrCollege[indexPath.row].city ?? "No City"
        cell.collegeUniversityTxt.text = arrCollege[indexPath.row].university ?? "No University"
        cell.collegeAddressTxt.text = arrCollege[indexPath.row].address ?? "No Address"
        return cell
    }
    
    //MARK:- Actions
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        let collegeForm = self.storyboard?.instantiateViewController(identifier: "CollegeFormViewController") as! CollegeFormViewController
        self.navigationController?.pushViewController(collegeForm, animated: true)
    }
    
}

