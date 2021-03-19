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
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            DatabaseHelper.shared.deleteCollege(college: arrCollege[indexPath.row])
            arrCollege.remove(at: indexPath.row)
            self.collegeListTable.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let collegeDetailVC = self.storyboard?.instantiateViewController(identifier: "CollegeDetailTableViewController") as! CollegeDetailTableViewController
        collegeDetailVC.college = arrCollege[indexPath.row]
        self.navigationController?.pushViewController(collegeDetailVC, animated: true)
    }
    
    //MARK:- Actions
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        let collegeForm = self.storyboard?.instantiateViewController(identifier: "CollegeFormViewController") as! CollegeFormViewController
        self.navigationController?.pushViewController(collegeForm, animated: true)
    }
    
}

