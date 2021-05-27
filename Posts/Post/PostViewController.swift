//
//  ViewController.swift
//  Posts
//
//  Created by Employee1 on 5/26/21.
//

import UIKit

class PostViewController: UIViewController {

    //MARK: Properties
    var viewModel: PostViewModel?
    var coordinator: PostFlow?
        
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getPosts()
    }
    
    //MARK: Helper metthods
    func getPosts()  {
        viewModel?.getPosts { (error) in
            if let error = error {
                DispatchQueue.main.async {
                    self.showErrorAlert(title: "Error", errorMessage: error)
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
        tableView.rowHeight = UITableView.automaticDimension
    }
}

//MARK: Extensions
extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.posts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postCell, for: indexPath) as? PostsTableViewCell
        cell?.configureCell(titleText: viewModel?.posts[indexPath.row].title ?? "", bodyText: viewModel?.posts[indexPath.row].body ?? "")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.coordinateToDetailView()
    }
    
}

extension PostViewController {
    struct Constants {
        static let postCell = "postCell"
    }
}
