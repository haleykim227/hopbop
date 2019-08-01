//
//  RankingTableViewController.swift
//  hop&bop
//
//  Created by Amy Sywe on 8/1/19.
//  Copyright © 2019 Haley Kim. All rights reserved.
//

import UIKit

class RankingTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return number of events OR return a max number.
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Get array of event ID's in ranking order from DatabaseHandler
        // Loop through array to create cell for each event.
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventRankingCell", for: indexPath) as! EventRankingCell
        cell.eventID = "12345"
        cell.eventIDLabel.text = "12345"

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let eventInfoVC = storyboard.instantiateViewController(withIdentifier: "eventInfoVC") as! EventInfoViewController
        let cell = self.tableView(tableView, cellForRowAt: indexPath) as! EventRankingCell
        eventInfoVC.eventID = cell.eventID
        navigationController?.pushViewController(eventInfoVC, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
