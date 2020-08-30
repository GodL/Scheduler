//
//  ImmediateScheduler.swift
//  Scheduler
//
//  Created by 李浩 on 2020/8/30.
//

import Foundation
import Disposable

final public class ImmediateScheduler: SchedulerType {
    public func schedule(action: @escaping () -> Disposable?) -> Disposable {
        let disposable = SerialDisposable()
        disposable.disposable = action()
        return disposable
    }
    
    public func schedule(_ after: TimeInterval, action: @escaping () -> Disposable?) -> Disposable {
        sleep(UInt32(after))
        return schedule(action: action)
    }
}
