//
//  CollectionViewController.swift
//  UITableViewCollection
//
//  Created by MAC on 15.02.2022.
//

import UIKit

private enum Const {
    static let cellIdentifier = "Cell"
    static let heroPositionCarry = "Carry"
    static let heroPositionMid = "Midlaner"
    static let heroPositionSup = "Support"
    static let height = 40
}

struct Section<T: Hashable> {
    let name: String
    let objects: [T]
}

class CollectionViewController: UIViewController {
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                  collectionViewLayout: UICollectionViewFlowLayout())
    private var heroSection = [Section<Hero>]()
    private var heroItems = [Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        loadHero()
    }
    
    private func setupCollection() {
        collectionView.position(view: view)
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Const.cellIdentifier )
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId)
        collectionView.delegate = self
        collectionView.dataSource = self
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.minimumLineSpacing = 5
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        flowLayout.scrollDirection = .vertical
        
        view.backgroundColor = .darkGray
        collectionView.backgroundColor = .darkGray
        
    }
    
    private func loadHero() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let carryHero = Section<Hero>(name: Const.heroPositionCarry, objects: Hero.carry)
            let midHero = Section<Hero>(name: Const.heroPositionMid, objects: Hero.midlaner)
            let supHero = Section<Hero>(name: Const.heroPositionSup, objects: Hero.support)
            self.heroSection = [carryHero, midHero, supHero]
            self.collectionView.reloadData()
        }
    }
}

extension CollectionViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Const.cellIdentifier, for: indexPath) as? CollectionViewCell else { return CollectionViewCell()}
        let hero = heroSection[indexPath.section].objects[indexPath.row]
        cell.setup(hero: hero)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroSection[section].objects.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return heroSection.count
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
extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.allowsMultipleSelection = false
        let vc = ViewController()
        vc.textLabel.text = heroSection[indexPath.section].objects[indexPath.row].description
       present(vc, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
            return true
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
        return CGSize(width: collectionView.bounds.width, height: 20)
    }
}
