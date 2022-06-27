import UIKit

class ViewController<T: BaseCell<U>, U>:UITableViewController {
    let cellId = Const.cellId
    var item = [U]()
    private var sections = [Section<SectionName>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(T.self, forCellReuseIdentifier: cellId)
        loadSection()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].name
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BaseCell<U>
        cell.item = item[indexPath.row]
        return cell
    }
    
    private func loadSection() {
            let firstSection = Section<SectionName>(name: Const.firstSection, objects: SectionName.sectionName)
            let secondSection = Section<SectionName>(name: Const.secondSection, objects: SectionName.sectionName)
            self.sections = [firstSection, secondSection]
            self.tableView.reloadData()
        }
}

class BaseCell<U>:UITableViewCell {
    var item: U!
}

struct Cell {
    let cellInfo: String
}

class CustomCell:BaseCell<Cell> {
    override var item: Cell! {
        didSet {
            textLabel?.text = item.cellInfo
        }
    }
}

class SomeListController: ViewController<CustomCell, Cell> {
    override func viewDidLoad() {
        super.viewDidLoad()
        item = [
            Cell(cellInfo: Const.firstCell),
            Cell(cellInfo: Const.secondCell),
            Cell(cellInfo: Const.thirtyCell)
        ]
    }
}

enum Const {
    static let firstCell = "First Cell"
    static let secondCell = "Second Cell"
    static let thirtyCell = "Thirty Cell"
    static let cellId = "Cell"
    static let firstSection = "First"
    static let secondSection = "Second"
}

struct Section<T: Hashable> {
    let name: String
    let objects: [T]
}

struct SectionName: Hashable {
    var name: String
    static let sectionName = [SectionName(name: Const.firstCell),
                              SectionName(name: Const.secondCell),
                              SectionName(name: Const.thirtyCell)
    ]
}
