//
//  KeyboardViewController.swift
//  PhrasePadKeyboard
//
//  Created by 小野拓人 on 2024/08/03.
//

import UIKit
import SwiftUI

class KeyboardViewController: UIInputViewController {

    override func viewDidLoad() {
        setup()
    }
    
    private func setup() {
           let nextKeyboardAction = #selector(self.handleInputModeList(from:with:))
           // カスタムUIのセットアップをここで行う
           let keyboardView = PhrasePadKeyboardView(needsInputModeSwitchKey: needsInputModeSwitchKey,
                                           nextKeyboardAction: nextKeyboardAction,
                                           inputTextAction: { [weak self] text in
               guard let self else { return }
               self.textDocumentProxy.insertText(text)

           }, deleteTextAction: { [weak self] in
               guard let self,
                     self.textDocumentProxy.hasText else { return }

               self.textDocumentProxy.deleteBackward()
           })

           // keyboardViewのSuperViewのSuperView(UIHostingController)の背景を透明にする
        let hostingController = UIHostingController(rootView: keyboardView.backgroundColor(.clear, 0))

           self.addChild(hostingController)
           self.view.addSubview(hostingController.view)
           hostingController.didMove(toParent: self)

           hostingController.view.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
               hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
               hostingController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
               hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
           ])
       }

}
