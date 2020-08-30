//
//  QueueScheduler.swift
//  Scheduler
//
//  Created by 李浩 on 2020/8/29.
//

import Foundation
import Disposable

public protocol QueueSchedulerType: SchedulerType {
    var queue: DispatchQueue { get }
    
    func schedule(after: TimeInterval,period: TimeInterval,leeway: TimeInterval,action: @escaping () -> Void) -> Disposable
}

extension QueueSchedulerType {
    public func schedule(action: @escaping () -> Disposable?) -> Disposable {
        let disposable = SerialDisposable()
        queue.async {
            if disposable.isDisposed {
                return
            }
            disposable.disposable = action()
        }
        return disposable
    }
    
    public func schedule(_ after: TimeInterval, action: @escaping () -> Disposable?) -> Disposable {
        let disposable = SerialDisposable()
        queue.asyncAfter(deadline: .now()+after) {
            if disposable.isDisposed {
                return
            }
            disposable.disposable = action()
        }
        return disposable
    }
    
    public func schedule(after: TimeInterval, period: TimeInterval, leeway: TimeInterval, action: @escaping () -> Void) -> Disposable {
         return TimerScheduler(queue: self.queue).schedule(after: after, period: period, leeway: leeway, action: action)
    }
}

public class QueueScheduler: QueueSchedulerType {
    
    public let queue: DispatchQueue
    
    public init(queue: DispatchQueue) {
        self.queue = queue
    }
}

extension QueueScheduler {
    public convenience init(name: String) {
        let queue = DispatchQueue(label: name)
        self.init(queue:queue)
    }
}
