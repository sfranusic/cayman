//
//  RoundedLight.swift
//  StopLight
//
//  Created by Sammy Franusic on 10/5/20.
//  Copyright © 2020 sf. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedLight: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        //
        self.layer.cornerRadius = bounds.size.width * 0.5
    }

}
