import  UIKit

typealias UserDataSource = UITableViewDiffableDataSource<Section<City>,City>
typealias UserSnapshot = NSDiffableDataSourceSnapshot<Section<City>, City>

struct Section<T: Hashable>: Hashable {
    let name: String
    let object: [T]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(object)
    }
}

class TableViewController: UIViewController {
    private let tableView = UITableView(frame: .zero, style: .grouped)
    var section = [Section<City>]()
    private var cities = [City]()
    lazy var dataSource = DiffableDataSource(tableView: tableView) { (tableView, indexPath, city) -> UITableViewCell? in
        let cell = tableView.dequeueReusableCell(withIdentifier: Const.identifier, for: indexPath) as? CityCell
        cell?.setup(city: city)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.change(view: view)
        view.backgroundColor = .white
        setupTableView()
        loadCities()
        setupNavBar()
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: Const.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Const.identifier)
        dataSource.defaultRowAnimation = .fade
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    private func loadCities() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let bestCitiSection = Section<City>(name: Const.sectionCity, object: City.bestCities)
            self.section = [bestCitiSection]
            self.applySnapshot()
        }
    }
    
    private func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Const.buttonTitle, style: .plain, target: self, action: #selector(addTapped))
    }
    
    private func applySnapshot() {
        var snapshot = UserSnapshot()
        section.forEach { section in
            snapshot.appendSections([section])
            snapshot.appendItems(section.object)
        }
        dataSource.apply(snapshot)
    }
    
    @objc private func addTapped() {
        var snapshot = dataSource.snapshot()
        snapshot.appendItems([City.randomCities])
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController()
        let snapshot = dataSource.snapshot()
        vc.textLabel.text = snapshot.itemIdentifiers[indexPath.row].description
        navigationController?.pushViewController(vc, animated: true)
    }
}

class DiffableDataSource: UserDataSource {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return snapshot().sectionIdentifiers[section].name
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var snapshot = self.snapshot()
            if let item = itemIdentifier(for: indexPath) {
                snapshot.deleteItems([item])
                apply(snapshot, animatingDifferences: true)
            }
        }
    }
}
