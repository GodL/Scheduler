//
//  OperationQeueuScheduler.swift
//  Scheduler
//
//  Created by 李浩 on 2020/8/30.
//

import Foundation
import Disposable
import Dispatch

public protocol OperationQueueSchedulerType: SchedulerType {
    var queue: OperationQueue { get }
}

extension OperationQueueSchedulerType {
    public func schedule(action: @escaping () -> Disposable?) -> Disposable {
        let disposable = SerialDisposable()
        
        let operation = BlockOperation {
            if disposable.isDisposed {
                return
            }
            disposable.disposable = action()
        }
        queue.addOperation(operation)
        return disposable
    }
    
    public func schedule(_ after: TimeInterval, action: @escaping () -> Disposable?) -> Disposable {
        let disposable = SerialDisposable()
        let operation = BlockOperation {
            sleep(UInt32(after))
            if disposable.isDisposed {
                return
            }
            disposable.disposable = action()
        }
        queue.addOperation(operation)
        return disposable
    }
}

public class OperationQueueScheduler: OperationQueueSchedulerType {
    public let queue: OperationQueue
    
    public init(queue: OperationQueue) {
        self.queue = queue
    }
}
