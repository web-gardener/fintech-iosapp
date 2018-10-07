//
//  ConversationListViewController.swift
//  TinkoffFinance
//
//  Created by Denis Nefedov on 07/10/2018.
//  Copyright © 2018 X. All rights reserved.
//

import Foundation
import UIKit

class ConversationViewController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noMessagesLabel: UILabel!
    
    /* Properties */
    var conversationModel: ConversationModel? {
        didSet {
            if let model = conversationModel {
                self.configureView(with: model)
            }
        }
    }
    
    var messageModels: [MessageModel]?
    
    /* private methods */
    private func configureView(with data: ConversationModel) {
        self.navigationItem.title = data.name ?? "Unnamed"
        if let lastMessage = data.message {
            self.messageModels = ConversationsBuilder.getConversation()
            self.messageModels!.append(MessageModel(messageText: lastMessage))
            self.messageModels!.reverse()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        if conversationModel?.message == nil {
            self.tableView.isHidden = true
        }
    }
}


extension ConversationViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MessageViewCell
        if indexPath.row % 2 == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "OutgoingMessage", for: indexPath) as! MessageViewCell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "IncomingMessage", for: indexPath) as! MessageViewCell
        }
        cell.messageText = messageModels![indexPath.row].messageText
        cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
        return cell
    }
    
}
