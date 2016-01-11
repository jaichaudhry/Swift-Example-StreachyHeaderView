//
//  ImageHeaderView.swift
//  JCStrechyHeaderView
//
//  Created by Jai Chaudhry on 11/01/16.
//  Copyright © 2016 jc. All rights reserved.
//

import Foundation
import UIKit

class ImageHeaderView: UIView {
    
    private var imageView: UIImageView?
    private var image: UIImage!
    private var isFirstTime: Bool?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(image: UIImage) {
        super.init(frame:CGRectZero)
        self.image = image
        self.isFirstTime = true
        setupSubviews()
    }
    
    // MARK - Public
    
    func layoutSubviewsWithContentOffset(offset: CGPoint) {
        let viewSize = self.frame.size
        var imageViewRect = CGRectMake(0, 0, viewSize.width, viewSize.height)
        var delta: CGFloat = 0
        if offset.y < 0 {
            delta = fabs(min(0, offset.y))
        }
        imageViewRect.origin.y -= delta
        imageViewRect.size.height += delta
        imageView?.frame = imageViewRect
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if isFirstTime! {
            let viewSize = self.frame.size
            imageView?.frame = CGRectMake(0, 0, viewSize.width, viewSize.height)
            isFirstTime = false
        }
    }
    
    // MARK - Private
    
    private func setupSubviews() {
        imageView = UIImageView(image: image)
        imageView?.contentMode = .ScaleAspectFill
        addSubview(imageView!)
    }
    
}