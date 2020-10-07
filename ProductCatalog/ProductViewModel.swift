//
//  ProductViewModel.swift
//  ProductCatalog
//
//  Created by Rupika Sahu on 28/09/20.
//  Copyright © 2020 Rupika Sahu. All rights reserved.
//

import Foundation
import Alamofire

class ProductViewModel {
    static var isPaginating: Bool = false
    var products: [Product]? = []
    var pageNumber: Int = 0
    
    func getSearchResults(for text: String = "samsung", completion: ((Bool, [Product]?, String?) -> Void)?) {
        ProductViewModel.isPaginating = true
        Alamofire.request(AppURLS.productSearchUrl).validate().responseJSON { response in
            if let value = response.result.value as? [String: Any] {
                if value["status"] as? String == "OK" || value["code"] as? Int == 200 {
                    if let data = value["data"] as? [String: Any] {
                        do {
                            let data = try JSONSerialization.data(withJSONObject: data["products"] ?? [], options: .fragmentsAllowed)
                            let products = try JSONDecoder().decode([Product].self, from: data)
                            self.products! += products
                            self.pageNumber += 1
                            ProductViewModel.isPaginating = false
                            completion?(true, products, "Success")
                        } catch {
                            ProductViewModel.isPaginating = false
                            debugPrint(error)
                        }
                    }
                } else if let errorDict = value["ErrorCode"] as? NSArray, errorDict.count > 0 {
                    let errorDescription = errorDict[0] as? [String: Any]
                    if let error = errorDescription?["Code"] as? String {
                        ProductViewModel.isPaginating = false
                        completion?(false, nil, error)
                    } else {
                        ProductViewModel.isPaginating = false
                        completion?(false, nil, response.error?.localizedDescription ?? Constant.failed)
                    }
                }
            } else if response.response?.statusCode != 200 {
                ProductViewModel.isPaginating = false
                completion?(false, nil, response.error?.localizedDescription ?? Constant.failed)
            }
        }
    }
}
