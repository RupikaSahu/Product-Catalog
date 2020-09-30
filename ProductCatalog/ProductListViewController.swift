//
//  ProductListViewController.swift
//  ProductCatalog
//
//  Created by Rupika Sahu on 28/09/20.
//  Copyright © 2020 Rupika Sahu. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var navigationCountLabel: UILabel!
    @IBOutlet weak var moreInfoImageView: UIImageView!
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var navigationViewHeightConstraint: NSLayoutConstraint!
    
    var productViewModel = ProductViewModel()
    var searchText: String = "samsung"
    var offSet: CGFloat = 80.0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.loadProductList()
    }
    
    func setupUI() {
        self.navigationTitleLabel.text = self.searchText
        self.backButton.imageView?.contentMode = .scaleAspectFit
        self.backButton.contentVerticalAlignment = .fill
        self.backButton.contentHorizontalAlignment = .fill
        self.moreInfoImageView.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/2))
        if UIDevice.current.hasTopNotch {
            navigationViewHeightConstraint.constant += 44
        }
        self.productsTableView.dataSource = self
        self.productsTableView.delegate = self
        self.productsTableView.register(UINib(nibName: ProductTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ProductTableViewCell.reuseIdentifier)
    }
    
    func loadProductList(isPaginating: Bool = false, showLoading: Bool = true) {
        if showLoading {
            self.showSpinner(withYOffset: &offSet)
        }
        self.productViewModel.getSearchResults() { status, products, message in
            self.removeSpinner()
            if status {
                DispatchQueue.main.async {
                    self.navigationCountLabel.text = String(self.productViewModel.products?.count ?? 0) + " search results"
                    self.productsTableView.reloadData()
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
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productViewModel.products != nil ? (
            self.productViewModel.products?.count ?? 0) : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productsTableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuseIdentifier, for: indexPath) as? ProductTableViewCell
        if let product = self.productViewModel.products?[indexPath.row] {
            cell?.customizeCell(product: product)
            cell?.showAlert = {
                self.showAlert(withTitle: Constant.productAddedTitle, message: Constant.productAddedMessage)
            }
        }
        return cell ?? UITableViewCell()
    }
}

extension ProductListViewController: UITableViewDelegate {
    // For pagination/infinte scrolling
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewYoffset = scrollView.contentOffset.y
        if scrollViewYoffset > productsTableView.contentSize.height - scrollView.frame.size.height - 150 {
            if !self.productViewModel.isPaginating {
                loadProductList(isPaginating: true, showLoading: false)
            }
        }
    }
}
