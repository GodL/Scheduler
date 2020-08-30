//
//  Scheduler.swift
//  Scheduler
//
//  Created by 李浩 on 2020/8/29.
//

import Foundation
import Dispatch
import Disposable


public protocol SchedulerType {
    func schedule(action: @escaping () -> Disposable?) -> Disposable
   
    func schedule(_ after: TimeInterval,action: @escaping () -> Disposable?) -> Disposable
}
