//
//  ViewController.swift
//  Example
//
//  Created by Irshad Ahmad on 23/04/22.
//

import UIKit
import Combine

final class ViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Privates
    private var examples = Example.allCases
    private typealias DataSource = UITableViewDiffableDataSource<Int, String>
    private typealias SnapShot = NSDiffableDataSourceSnapshot<Int, String>
    private lazy var dataSource = makeDataSource()
    
    var passThrough = PassthroughSubject<Int, Never>()
    
    private enum Example: String, CaseIterable {
        case network = "Network"
        case imagePicker = "Image Picker"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        refreshTable()
        
        let x: String?? = .some(nil)
        let outputX = (x ?? "inner") ?? "outer"
        let y: String?? = nil
        let outputY = (y ?? "inner") ?? "outer"
        print("\(x) \(y) \(outputX) \(outputY)")
        
        var dict: [String: Int?] = [
            "one": 1,
            "two": 2,
            "none": nil
        ]
        
        var otherDict: [String: Int?] = [
            "one": 1,
            "two": 2,
            "none": nil
        ]
        
        let Dicts = dict
        dict["two"] = nil
        dict["none"] = nil
        print("\(dict.count) \(y) \(Dicts.count) \(otherDict.count)")

    }

    private func makeDataSource() -> DataSource {
        DataSource(tableView: tableView) { tableView, indexPath, itemIdentifier in
            return self.cellForRow(at: indexPath)
        }
    }
    
    private func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = examples[indexPath.row].rawValue
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    private func refreshTable() {
        var snapshot = SnapShot()
        snapshot.appendSections([0])
        snapshot.appendItems(examples.compactMap({ $0.rawValue }), toSection: 0)
        dataSource.apply(snapshot)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch examples[indexPath.row] {
        case .network:
            self.push(NetworkViewController())
        case .imagePicker:
            self.push(ImagePickerExampleController())
        }
    }
}

class Starship {
    var type: String = "John"
    var age: Int = 10
}


struct Size {
    var width, height: Int
    
    init(size: CGSize) {
        self.width = Int(size.width)
        self.height = Int(size.height)
        
        if size.width == 50 {
            self.width = 25
        }
    }
}
