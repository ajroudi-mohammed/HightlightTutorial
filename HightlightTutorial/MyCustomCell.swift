//
//  MyCustomCell.swift
//  HightlightTutorial
//
//  Created by Ajroudi Mohammed on 08/01/2019.
//  Copyright © 2019 Ajroudi Mohammed. All rights reserved.
//

import UIKit

class MyCustomCell: UICollectionViewCell {
   
    let containerView = UIView()
    let cornerRadius: CGFloat = 15.0
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        
        //Constructing views
        constructViews()
        
        //Adding a Long press event to the container view
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        lpgr.minimumPressDuration = 0.08
        lpgr.delaysTouchesBegan = false
        containerView.addGestureRecognizer(lpgr)
        
        
    }
    
    @objc func handleLongPress(gesture : UILongPressGestureRecognizer!) {
        print("raw value : \(gesture.state.rawValue)")
        if gesture.state.rawValue == 1 {
            highlight(true)
        }else{
            highlight(false)
        }
        
    }
    
    let imageview : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "poster")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    let smalltitle : UILabel = {
        let smalltitle = UILabel()
        smalltitle.text = "YOUTUBE"
        smalltitle.font = UIFont.systemFont(ofSize: 12)
        smalltitle.textColor = .gray
        smalltitle.translatesAutoresizingMaskIntoConstraints = false
        return smalltitle
    }()
    
    let title : UILabel = {
        let title = UILabel()
        title.text = "Like, Share, Subscribe !"
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.textColor = .black
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    func constructViews(){
        
        //Add the rounded corner black Shadow to the cell and make it transparent
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 10.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = cornerRadius
        
        //a Container view with rounded corners
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.masksToBounds = true
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false

        // pin the containerView to the edges to the view
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        //Adding the image
        containerView.addSubview(imageview)
        imageview.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        //Adding the blur effect
        let blurView = UIVisualEffectView()
        blurView.effect = UIBlurEffect(style: .regular)
        containerView.addSubview(blurView)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        blurView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        //Adding the Small Title
        containerView.addSubview(smalltitle)
        smalltitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        smalltitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        
        //Adding the title
        containerView.addSubview(title)
        title.topAnchor.constraint(equalTo: smalltitle.bottomAnchor, constant: 10).isActive = true
        title.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func highlight(_ touched: Bool) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 5.0,
                       options: [.allowUserInteraction],
                       animations: {
                        self.transform = touched ? .init(scaleX: 0.95, y: 0.95) : .identity
        }, completion: nil)
    }
    
}
