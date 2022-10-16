//
//  EventsDetailViewController.swift
//  WP-Event-Calender_Example
//
//  Created by Wiwaltill on 16.10.22.
//

import UIKit

class EventsDetailViewController: UIViewController {
    
    var events: Event?
    var AccentColor = UIColor(named: "AccentColor")
    
    var safeArea: UILayoutGuide!
    let titleLabel = UILabel()
    let organizerLabel = UILabel()
    let dateName = UILabel()
    let dateLabel = UILabel()
    let starttimeName = UILabel()
    let starttimeLabel = UILabel()
    let descriptionLabel = UILabel()
    
    let websiteButton = UIButton()
    let downloadButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
        safeArea = view.layoutMarginsGuide
        
        let events = events
        titleLabel.text = events?.title.htmlDecoded ?? "Not available."
        organizerLabel.text = events?.organizer[0].organizer.htmlDecoded ?? "Not available."
        dateName.text = "Date:"
        dateLabel.text = events!.startDateDetails.day + "." + events!.startDateDetails.month + "." + events!.startDateDetails.year
        starttimeName.text = "Start:"
        starttimeLabel.text = events!.startDateDetails.hour + ":" + events!.startDateDetails.minutes + " Uhr"
        descriptionLabel.text = events!.eventDescription.htmlDecoded
        
        downloadButton.setTitle("Transfer to calendar", for: .normal)
        downloadButton.backgroundColor = AccentColor
        downloadButton.titleLabel?.textColor = .white
        downloadButton.layer.cornerRadius = 5
        downloadButton.clipsToBounds = true
        downloadButton.addTarget(self, action: #selector(calACN), for: UIControl.Event.touchUpInside)
        
        websiteButton.setTitle("More info", for: .normal)
        websiteButton.backgroundColor = AccentColor
        websiteButton.titleLabel?.textColor = .white
        websiteButton.layer.cornerRadius = 5
        websiteButton.clipsToBounds = true
        websiteButton.addTarget(self, action: #selector(mehrACN), for: UIControl.Event.touchUpInside)
        
        if (events!.allDay == true){
            starttimeName.isHidden = true
            starttimeLabel.isHidden = true
        }
        
        setupLabels()
        setupButtons()
    }
    
    func setupLabels(){
        view.addSubview(titleLabel)
        view.addSubview(organizerLabel)
        view.addSubview(dateName)
        view.addSubview(dateLabel)
        view.addSubview(starttimeName)
        view.addSubview(starttimeLabel)
        view.addSubview(descriptionLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        titleLabel.textColor = UIColor.label
        titleLabel.font = .boldSystemFont(ofSize: 28)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        titleLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor, constant: 20).isActive = true
        titleLabel.textAlignment = NSTextAlignment.center
        
        organizerLabel.translatesAutoresizingMaskIntoConstraints = false
        organizerLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        organizerLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        organizerLabel.textColor = UIColor.label
        organizerLabel.font = .systemFont(ofSize: 18)
        organizerLabel.numberOfLines = 0
        organizerLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        organizerLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor, constant: 20).isActive = true
        organizerLabel.textAlignment = NSTextAlignment.center
        
        dateName.translatesAutoresizingMaskIntoConstraints = false
        dateName.topAnchor.constraint(equalTo: organizerLabel.bottomAnchor, constant: 40).isActive = true
        dateName.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        dateName.textColor = UIColor.label
        dateName.font = .systemFont(ofSize: 20)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: dateName.bottomAnchor, constant: 5).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        dateLabel.textColor = UIColor.label
        dateLabel.font = .systemFont(ofSize: 28, weight: UIFont.Weight.heavy)
        
        starttimeName.translatesAutoresizingMaskIntoConstraints = false
        starttimeName.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15).isActive = true
        starttimeName.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        starttimeName.textColor = UIColor.label
        starttimeName.font = .systemFont(ofSize: 16)
        
        starttimeLabel.translatesAutoresizingMaskIntoConstraints = false
        starttimeLabel.topAnchor.constraint(equalTo: starttimeName.bottomAnchor, constant: 0).isActive = true
        starttimeLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        starttimeLabel.textColor = UIColor.label
        starttimeLabel.font = .systemFont(ofSize: 23, weight: UIFont.Weight.bold)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: starttimeLabel.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        descriptionLabel.textColor = UIColor.label
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        descriptionLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor, constant: 0).isActive = true
        descriptionLabel.textAlignment = NSTextAlignment.center
        
    }
    
    func setupButtons(){
        view.addSubview(websiteButton)
        view.addSubview(downloadButton)
        
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.bottomAnchor.constraint(equalTo: websiteButton.topAnchor, constant: -10).isActive = true
        downloadButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        downloadButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor, constant: 10).isActive = true
        downloadButton.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.08).isActive = true
        
        websiteButton.translatesAutoresizingMaskIntoConstraints = false
        websiteButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10).isActive = true
        websiteButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        websiteButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor, constant: 10).isActive = true
        websiteButton.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.08).isActive = true
    }
    
    @objc
    func mehrACN(){
        guard let url = URL(string: events!.url) else { return }
        UIApplication.shared.open(url)
    }
    
    @objc
    func calACN(){
        guard let url = URL(string: events!.url + "?ical=1") else { return }
        UIApplication.shared.open(url)
    }
}

