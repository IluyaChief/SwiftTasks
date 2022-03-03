import UIKit
import Foundation

struct Section<T: Hashable> {
    let name: String
    let objects: [T]
}

class CollectionViewController: UIViewController {
    private enum Const {
        static let cellIdentifier = "Cell"
        static let heroPositionCarry = "Carry"
        static let heroPositionMid = "Midlaner"
        static let heroPositionSup = "Support"
        static let height :CGFloat  = 40
    }
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: UICollectionViewFlowLayout())
    private var sections = [Section<Hero>]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        loadHero()
    }
    
    private func setupCollection() {
        collectionView.position(view: view)
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Const.cellIdentifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId)
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.minimumLineSpacing = 5
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.backgroundColor = .darkGray
        collectionView.backgroundColor = .darkGray
    }
    private func loadHero() {
        let carrySection = Section<Hero>(name: Const.heroPositionCarry, objects: Hero.carry)
        let midSection = Section<Hero>(name: Const.heroPositionMid, objects: Hero.midlaner)
        let supSection = Section<Hero>(name: Const.heroPositionSup, objects: Hero.support)
        self.sections = [carrySection, supSection, midSection]
        self.collectionView.reloadData()
    }
}

extension CollectionViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].objects.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Const.cellIdentifier , for: indexPath) as? CollectionViewCell else { return CollectionViewCell()}
        let image = sections[indexPath.section].objects[indexPath.row]
        cell.configure(image: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId, for: indexPath) as! HeaderView
        switch indexPath.section {
        case 1:
            header.headLabel.text = Hero.sectionHero[1]
        case 2:
            header.headLabel.text = Hero.sectionHero[2]
        default:
            header.headLabel.text = Hero.sectionHero[0]
        }
        header.configure()
        return header
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize(width: 1, height: 1) }
        
        let numberOfCellsPerRow: CGFloat = 3
        let offset = flowLayout.sectionInset.right
            + flowLayout.sectionInset.left
            + (flowLayout.minimumInteritemSpacing * (numberOfCellsPerRow - 1))
        
        let width = (collectionView.bounds.width - offset) / numberOfCellsPerRow
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: Const.height)
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.allowsMultipleSelection = false
        let vc = ViewController()
        vc.textLabel.text = sections[indexPath.section].objects[indexPath.row].description
       present(vc, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
            return true
        }
}
