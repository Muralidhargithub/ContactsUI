//
//  ViewController.swift
//  ToDoList
//
//  Created by Muralidhar reddy Kakanuru on 11/18/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var contactList: UITableView!
    
    let contacts = ["Amma","Akka1","Akka2", "Anil","Umesh","Kumar","Shailesh","Rahul"]
    let searchBar = UISearchBar()
    let recentsLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecentsLabel()
        setupSearchBar()
        contactList.delegate = self
        contactList.dataSource = self
        //view.backgroundColor = .black
    }
    private func setupRecentsLabel() {
            recentsLabel.text = "Recents"
            recentsLabel.font = UIFont.boldSystemFont(ofSize: 24)
            recentsLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(recentsLabel)
            
            // Set constraints for recentsLabel
            NSLayoutConstraint.activate([
                recentsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                recentsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                recentsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        }
        
    private func setupSearchBar() {
        searchBar.placeholder = "Search contacts"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        //searchBar.delegate = self
        view.addSubview(searchBar)
        
        // Set constraints for searchBar
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: recentsLabel.bottomAnchor, constant: 5),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? toDOCell else {
            fatalError("Unable to dequeue toDOCell")
        }

        // Get the contact name
        let contactName = contacts[indexPath.row]
        
        // Determine the call type (incoming or outgoing)
        let callType = (indexPath.row % 2 == 0) ? "Incoming" : "Outgoing"

        // Create a full string that combines both contact name and call type
        let fullText = "\(contactName)\n\(callType)"
        
        // Create an NSMutableAttributedString to style the text
        let attributedText = NSMutableAttributedString(string: fullText)
        
        // Set attributes for the contact name part
        let contactNameRange = (fullText as NSString).range(of: contactName)
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 16), range: contactNameRange)
        
        // Set attributes for the call type part
        let callTypeRange = (fullText as NSString).range(of: callType)
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 14), range: callTypeRange)
        attributedText.addAttribute(.foregroundColor, value: (callType == "Incoming") ? UIColor.systemGreen : UIColor.systemRed, range: callTypeRange)

        // Assign the attributed text to the contactNumber label
        cell.contactNumber.attributedText = attributedText
        cell.contactNumber.numberOfLines = 2 // Allow the label to wrap to two lines
        
        return cell
    }

    
    
}

