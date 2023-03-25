//
//  KeyboardViewController.swift
//  Non-violent Keyboard
//
//  Created by Olivia Li on 3/25/23.
//

import UIKit
import KeyboardKit

class KeyboardViewController: KeyboardInputViewController {
    override func viewWillSetupKeyboard() {
           super.viewWillSetupKeyboard()
           setup { controller in
               SystemKeyboard(
                   controller: controller,
                   autocompleteToolbar: .none
               )
           }
       }
}
