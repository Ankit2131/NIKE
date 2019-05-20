//
//  TaskOperation.swift
//  Nike
//
//  Created by Nanu on 5/19/19.
//  Copyright © 2019 Nanu. All rights reserved.
//

import UIKit

class TaskOperation: Operation {
    let task: URLSessionTask
    
    init(task: URLSessionTask) {
        self.task = task
        
        // Start the task
        task.resume()
        super.init()
    }

}
