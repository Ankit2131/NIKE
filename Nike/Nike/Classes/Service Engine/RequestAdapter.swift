//
//  RequestAdapter.swift
//  Nike
//
//  Created by Nanu on 5/19/19.
//  Copyright © 2019 Nanu. All rights reserved.
//

import Foundation


class RequestAdapter {
    
    // MARK: - Instance Method Create the data task request with the completion handler.
    fileprivate init(withURL url: URL, responseHandler handler: @escaping DataTaskCompletion) {
        _ =  DataTask.init(withURL: url, responseHandler: handler)        
    }
}

extension RequestAdapter {
    
    // MARK: - Class Method Create the data task request with the completion handler.
    class func request(withURL url: URL, responseHandler handler: @escaping DataTaskCompletion) {
        _ = RequestAdapter.init(withURL: url, responseHandler: handler)
    }

}
