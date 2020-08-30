//
//  TimerScheduler.swift
//  Scheduler
//
//  Created by 李浩 on 2020/8/30.
//

import Foundation
import Disposable
import Dispatch

final public class TimerScheduler: QueueScheduler {
    
    public func schedule(after: TimeInterval, period: TimeInterval, leeway: TimeInterval, action: @escaping () -> Void) -> Disposable {
        let timer = DispatchSource.makeTimerSource(queue: self.queue)
        timer.schedule(deadline: .now()+after, repeating: period, leeway: .seconds(Int(leeway)))
        
        var cancelTimer: DispatchSourceTimer? = timer
        let cancel = ConcreteDisposable {
            cancelTimer?.cancel()
            cancelTimer = nil
        }
        
        timer.setEventHandler {
            if cancel.isDisposed {
                return
            }
            action()
        }
        return cancel
    }
}
