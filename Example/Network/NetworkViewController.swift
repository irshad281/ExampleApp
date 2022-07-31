//
//  NetworkViewController.swift
//  Example
//
//  Created by Irshad Ahmad on 23/04/22.
//

import UIKit
import UtilityPackage
import LayoutKit
import NetworkInterface

final class NetworkViewController: UITableViewController, XibLoadable {
    
    private let viewModel: NetworkViewModel
    
    required init(viewModel: NetworkViewModel = NetworkViewModel()) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = .zero
        }
        viewModel.model.sink { [weak self] _ in
            self?.tableView.reloadData()
        }.store(in: &disposable)
        
        NetworkInterface.enableNetworkLogs(true)
    }
}

extension NetworkViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.model.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellForRow(at: indexPath)
    }
    
    private func cellForRow(at indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let name = viewModel.model.value[indexPath.row].firstName
        let email = viewModel.model.value[indexPath.row].email
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = email
        return cell
    }
}
