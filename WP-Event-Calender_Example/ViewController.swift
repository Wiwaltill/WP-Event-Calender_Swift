//
//  ViewController.swift
//  WP-Event-Calender_Example
//
//  Created by Wiwaltill on 16.10.22.
//

import UIKit

class ViewController: UITableViewController {
    
    var events = [Event]()
    
    let spinner = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchAPIData()

        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        spinner.startAnimating()
        spinner.hidesWhenStopped = true
        tableView.backgroundView = spinner
    }
    
    func fetchAPIData(){
        
        //Insert your address here instead of URL.
        
        guard let url = URL(string: "https://URL.com/wp-json/tribe/events/v1/events/?per_page=100")else{return}
            let task = URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
            guard let data = data , error == nil else{return}
            var dataResult: Events?
            do{
                dataResult = try JSONDecoder().decode(Events.self, from: data)
            }catch{
                print(error)
            }
            guard let finalDataResult = dataResult else{return}
            self.events = finalDataResult.events
            DispatchQueue.main.asyncAfter(deadline: .now() + 0){
                self.tableView.refreshControl?.endRefreshing()
                self.tableView.reloadData()
                self.spinner.isHidden = true
            }
        })
        task.resume()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let events = self.events[indexPath.row]
        let eventsDetailVC = EventsDetailViewController()
        eventsDetailVC.events = events
        self.navigationController?.pushViewController(eventsDetailVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventCell
        
        let events = events[indexPath.row]
        cell.title?.text = events.title.htmlDecoded
        cell.detail?.text = events.organizer[0].organizer.htmlDecoded
        cell.date?.text = events.startDateDetails.day + "." + events.startDateDetails.month + "."
        
        return cell
    }
    
    @objc
    func refresh(){
        fetchAPIData()

        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
}


