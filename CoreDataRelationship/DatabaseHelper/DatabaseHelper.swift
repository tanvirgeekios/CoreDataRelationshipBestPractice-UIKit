//
//  DatabaseHelper.swift
//  CoreDataRelationship
//
//  Created by MD Tanvir Alam on 18/3/21.
//

import UIKit
import CoreData
class DatabaseHelper: NSObject {
    
    static let shared = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveCollegeToCoreData(college:CollegeModel){
        let newCollege = College(context: context)
        newCollege.name = college.collegeName
        newCollege.city = college.collegeCity
        newCollege.university = college.collegeUniversity
        newCollege.address = college.collegeAddress
        
        do {
            try context.save()
            print("Success Saving Data")
        } catch {
            print("Error Saving Data: \(error.localizedDescription)")
        }
    }
    
    func getAllCollegeData()->[College]{
        var arrCollege = [College]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        do{
            arrCollege = try context.fetch(fetchRequest) as! [College]
        }catch{
            print("Error fetching college data")
        }
        return arrCollege
    }
}
