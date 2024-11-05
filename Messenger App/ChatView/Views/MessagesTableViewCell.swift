//
//  MessagesTableViewCell.swift
//  Messenger App
//
//  Created by Jack Huang on 11/4/24.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {

    var labelName: UILabel!
    var labelText: UILabel!
    var labelDateTime: UILabel!
    var isCurrentUserMessage: Bool = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLabelName()
        setupLabelText()
        setupLabelDateTime()
        
        initConstraints();
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 14)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelName)
    }
    
    func setupLabelText() {
        labelText = UILabel()
        labelText.font = UIFont.systemFont(ofSize: 16)
        labelText.numberOfLines = 0
        labelText.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelText)
    }
    
    func setupLabelDateTime() {
        labelDateTime = UILabel()
        labelDateTime.font = UIFont.systemFont(ofSize: 12)
        labelDateTime.textColor = .gray
        labelDateTime.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelDateTime)
    }
    
    func initConstraints() {
        if isCurrentUserMessage {
            NSLayoutConstraint.activate([
                labelName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                labelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                
                labelText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                labelText.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 5),
                labelText.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 60),
                
                labelDateTime.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                labelDateTime.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 5),
                labelDateTime.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            ])
            labelText.textAlignment = .right
        } else {
            NSLayoutConstraint.activate([
                labelName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                labelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                
                labelText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                labelText.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 5),
                labelText.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -60),
                
                labelDateTime.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                labelDateTime.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 5),
                labelDateTime.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            ])
            labelText.textAlignment = .left
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
