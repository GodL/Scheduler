//
//  MainScheduler.swift
//  Scheduler
//
//  Created by 李浩 on 2020/8/30.
//

import Foundation

final public class MainScheduler: QueueScheduleable {
    public var queue: DispatchQueue = .main
    
    public static let instance = MainScheduler()
}
