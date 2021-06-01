//
//  ViewController.swift
//  Posts
//
//  Created by Sargis Kocharyan on 5/31/21.
//

import UIKit

class PostsViewController: UIViewController {
    
    struct Constants {
        static let postCell = "postCell"
    }

    //MARK: Properties
    var viewModel: PostsViewModel?
    var coordinator: PostsFlow?
        
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        self.getPosts()
        self.title = "posts".localized()
        self.navigationController?.navigationBar.barTintColor = UIColor.appBlue
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    //MARK: Helper methods
    func getPosts()  {
        viewModel?.getPosts { (error) in
            if let error = error {
                DispatchQueue.main.async {
                    self.showErrorAlert(title: "error".localized(), errorMessage: error)
                }
            } else {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func configureTableView()  {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.darkGray
        tableView.rowHeight = UITableView.automaticDimension
    }
}

//MARK: Tableview Delegate and Datasource methods
extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.posts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postCell, for: indexPath) as? PostsTableViewCell
        cell?.configureCell(titleText: viewModel?.posts[indexPath.row].title ?? "", bodyText: viewModel?.posts[indexPath.row].body ?? "")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let id = viewModel?.posts[indexPath.row].userId {
            coordinator?.goToDetailView(userId: id, body: viewModel?.posts[indexPath.row].body ?? "", title: viewModel?.posts[indexPath.row].title ?? "")
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
