import UIKit

class TableViewController: UIViewController {
    private let tableView = UITableView()
    private var cities = [City]()
    private var expandedCities = Set<City>()
    private lazy var refreshControl = UIRefreshControl(frame: .zero, primaryAction: UIAction(handler: refreshHandler))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.change(view: view)
        setupTableView()
        loadCities()
        setupNavBar()
        tableView.refreshControl = refreshControl
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: Const.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Const.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadCities() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        self.cities = City.bestCities
        self.tableView.reloadData()
        }
    }
    
    private func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Const.buttonTitle, style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc private func addTapped() {
        cities.append(City.randomCities)
        tableView.insertRows(at: [IndexPath(row: cities.count - 1, section: 0)], with: .left)
    }
    
    private func refreshHandler (action: UIAction) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let countBefore = self.cities.count - 1
            self.cities.append(contentsOf: City.coolCities)
            let countAfter = self.cities.count - 1
            let indecies = (countBefore..<countAfter).map({IndexPath(row: $0, section: 0)})
            self.tableView.insertRows(at: indecies, with: .automatic)
            self.refreshControl.endRefreshing()
        }
    }
}
extension TableViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cities.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Const.identifier, for: indexPath) as? CityCell else {
            return UITableViewCell()
        }
        let city = cities[indexPath.row]
        cell.setup(city: city, visible: expandedCities.contains(city))
        cell.expandCallback = { [weak self] in
            guard let self = self else { return }
            if self.expandedCities.contains(city) {
                self.expandedCities.remove(city)
            } else {
                self.expandedCities.insert(city)
            }
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Const.header
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return Const.footer
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController()
        vc.textLabel.text = cities[indexPath.row].description
        navigationController?.pushViewController(vc, animated: true)
    }
}
