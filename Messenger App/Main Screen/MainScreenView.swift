//
//  MainScreenView.swift
//  Messenger App
//
//  Created by Derek Thach on 11/4/24.
//


import UIKit

class MainScreenView: UIView {
    var labelTest: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        
        setupLabelTest()
        
        initConstraints()
    }
    
    func setupLabelTest() {
        labelTest = UILabel()
        labelTest.text = "Test"
        labelTest.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelTest)
    }
    
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            labelTest.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            labelTest.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
