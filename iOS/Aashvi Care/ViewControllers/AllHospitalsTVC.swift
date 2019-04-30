//
//  AllHospitalsTVC.swift
//  Aashvi Care
//
//  Created by Bishal Ghimire on 4/30/19.
//  Copyright © 2019 Bishal Ghimire. All rights reserved.
//

import UIKit

class AllHospitalsTVC: UITableViewController {
    
    var hospitalData: [Hospital] {
        get {
            return HospitalDataHelper.getData()
        }
        set {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hospitalCell = UINib.init(nibName: "HospitalCell", bundle: nil)
        tableView.register(hospitalCell, forCellReuseIdentifier: "HospitalCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hospitalData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HospitalCell", for: indexPath) as! HospitalCell
        let hospital = hospitalData[indexPath.row]
        cell.idLabel.text = hospital.id + "."
        cell.titleLabel.text = hospital.name
        return cell
    }

}