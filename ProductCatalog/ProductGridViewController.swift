//
//  ProductGridViewController.swift
//  ProductCatalog
//
//  Created by Rupika Sahu on 06/10/20.
//  Copyright © 2020 Rupika Sahu. All rights reserved.
//

import UIKit

class ProductGridViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var navigationCountLabel: UILabel!
    @IBOutlet weak var moreInfoImageView: UIImageView!
    @IBOutlet weak var bagCountLabel: UILabel!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var navigationViewHeightConstraint: NSLayoutConstraint!
    
    let productViewModel = ProductViewModel()
    static var searchText: String = Constant.samsung
    var offSet: CGFloat = 80.0
    var bagCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.loadProductList()
    }
    
    func setupUI() {
        self.navigationTitleLabel.text = ProductListViewController.searchText
        self.backButton.imageView?.contentMode = .scaleAspectFit
        self.backButton.contentVerticalAlignment = .fill
        self.backButton.contentHorizontalAlignment = .fill
        self.bagCountLabel.isHidden = true
        self.moreInfoImageView.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/2))
        if UIDevice.current.hasTopNotch {
            navigationViewHeightConstraint.constant += 44
        }
        self.productsCollectionView.dataSource = self
        self.productsCollectionView.delegate = self
        self.productsCollectionView.register(UINib(nibName: ProductCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: ProductCollectionViewCell.reuseIdentifier)
    }
    
    func loadProductList(showLoading: Bool = true) {
        if showLoading {
            self.showSpinner(withYOffset: &offSet)
        }
        self.productViewModel.getSearchResults() { status, products, message in
            self.removeSpinner()
            if status {
                DispatchQueue.main.async {
                    self.navigationCountLabel.text = String(self.productViewModel.products?.count ?? 0) + Constant.searchResults
                    self.productsCollectionView.reloadData()
                }
            } else {
                self.showAlert(withTitle: Constant.error, message: message ?? Constant.failed) { _ in
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
       
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

    @IBAction func didTapOnBackButton(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

extension ProductGridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productViewModel.products != nil ? (
        self.productViewModel.products?.count ?? 0) : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productsCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.reuseIdentifier, for: indexPath) as? ProductCollectionViewCell
        if let product = self.productViewModel.products?[indexPath.row] {
            cell?.customizeCell(product: product)
            cell?.addToBag = {
                self.showAlertToAddProducts(withTitle: Constant.productAddedTitle, message: Constant.productAddedMessage, okAction: { _ in
                    self.bagCount += 1
                    self.bagCountLabel.text = String(self.bagCount)
                    self.bagCountLabel.isHidden = false
                })
            }
        }
        return cell ?? UICollectionViewCell()
    }
}

extension ProductGridViewController: UICollectionViewDelegate {
    // For pagination/infinte scrolling
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewYoffset = scrollView.contentOffset.y
        if scrollViewYoffset > productsCollectionView.contentSize.height - scrollView.frame.size.height - 150 {
            if !ProductViewModel.isPaginating {
                loadProductList(showLoading: false)
            }
        }
    }
}

extension ProductGridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((self.productsCollectionView.bounds.width - 2)/2.0) , height: 380)
    }
    
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
