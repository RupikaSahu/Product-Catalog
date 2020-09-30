//
//  ViewController.swift
//  ProductCatalog
//
//  Created by Rupika Sahu on 28/09/20.
//  Copyright © 2020 Rupika Sahu. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var productSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productSearchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func didTapOnCancelButton(_ sender: Any) {
        self.productSearchBar.text = ""
        self.resignFirstResponder()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.resignFirstResponder()
        let searchText = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if (searchText ?? "").isEmpty || searchText == nil {
            self.showAlert(withTitle: Constant.emptyTextTitle, message: Constant.emptyTextMessage)
        } else {
            self.showProductsListVC()
        }
    }
    
    func showProductsListVC() {
        let productListVC = (UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "productsVC") as? ProductListViewController)
        productListVC?.searchText = productSearchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "samsung"
        self.navigationController?.pushViewController(productListVC ?? UIViewController(), animated: true)
    }
}
