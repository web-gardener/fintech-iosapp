//
//  MessageModel.swift
//  TinkoffFinance
//
//  Created by Denis Nefedov on 07/10/2018.
//  Copyright © 2018 X. All rights reserved.
//

import Foundation

class MessageModel : MessageInterface {
    
    var messageBody: String?
    
    init(messageBody: String?) {
        self.messageBody = messageBody
    }
}
