//
//  KeyboardHelper.swift
//  MADHealth
//
//  Created by Mikita Poluektau on 13.11.21.
//

import UIKit

extension KeyboardHelper {
    enum Animation {
        case keyboardShown
        case keyboardHidden
    }

    typealias HandleBlock = (_ animation: Animation, _ keyboardFrame: CGRect, _ duration: TimeInterval) -> Void
}

class KeyboardHelper {
    
    private let handleBlock: HandleBlock
    private(set) var animation: Animation = .keyboardHidden

    init(handleBlock: @escaping HandleBlock) {
        self.handleBlock = handleBlock
        setupNotification()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func setupNotification() {
        _ = NotificationCenter.default
            .addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { [weak self] notification in
                self?.animation = .keyboardShown
                self?.handle(animation: .keyboardShown, notification: notification)
            }

        _ = NotificationCenter.default
            .addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { [weak self] notification in
                self?.animation = .keyboardHidden
                self?.handle(animation: .keyboardHidden, notification: notification)
            }
    }

    private func handle(animation: Animation, notification: Notification) {
        guard let userInfo = notification.userInfo,
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        else { return }

        handleBlock(animation, keyboardFrame, duration)
    }
}
