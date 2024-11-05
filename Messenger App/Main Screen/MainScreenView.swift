//
//  MainScreenView.swift
//  Messenger App
//
//  Created by Derek Thach on 11/4/24.
//


import UIKit

class MainScreenView: UIView {
    var buttonLogout: UIButton!
    var labelTest: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupButtonLogout()
        
        initConstraints()
    }
    
    func setupButtonLogout() {
        buttonLogout = UIButton(type: .system)
        buttonLogout.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        buttonLogout.contentHorizontalAlignment = .fill
        buttonLogout.contentVerticalAlignment = .fill
        buttonLogout.imageView?.contentMode = .scaleAspectFit
        buttonLogout.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogout)
    }
    
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            buttonLogout.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            buttonLogout.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
