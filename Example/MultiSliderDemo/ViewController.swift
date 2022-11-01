//
//  ViewController.swift
//  swiftlint:disable numbers_smell
//
//  Created by Yonat Sharon on 17.11.2016.
//  Copyright © 2016 Yonat Sharon. All rights reserved.
//

import AVFoundation
import iOSMultiSlider
import UIKit

#if canImport(SwiftUI)
import SwiftUI
#endif

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let horizontalMultiSlider = MultiSlider()
        horizontalMultiSlider.tickColor = UIColor.green
        horizontalMultiSlider.numberTicks = 6
        horizontalMultiSlider.minimumValue = 0
        horizontalMultiSlider.maximumValue = 6
        horizontalMultiSlider.snapStepSize = 0.25
        horizontalMultiSlider.isHapticSnap = true
        horizontalMultiSlider.thumbViewOffset = 4 // set that before thumbCount
        horizontalMultiSlider.thumbCount = 2
        horizontalMultiSlider.orientation = .horizontal
        horizontalMultiSlider.trackCornerRadius = 4 // set before width
        horizontalMultiSlider.trackWidth = 20
        horizontalMultiSlider.distanceBetweenThumbs = 0
        horizontalMultiSlider.hasRoundTrackEnds = true
        horizontalMultiSlider.showsThumbImageShadow = false
        horizontalMultiSlider.outerTrackColor = UIColor.lightGray
        horizontalMultiSlider.outerTrackBorderColor = UIColor.red
        horizontalMultiSlider.tintColor = UIColor.blue.withAlphaComponent(0.5)
        horizontalMultiSlider.valueLabelPosition = .top
        // horizontalMultiSlider.valueLabelFont = LabelTheme.body.textStyle.scaledCustomFont()
        horizontalMultiSlider.valueLabelColor = UIColor.gray // LabelTheme.body.textColor

        horizontalMultiSlider.thumbImageSize = CGSize(width: 10.0, height: 28.0)
        horizontalMultiSlider.thumbImage = UIImage(named: "Thumb")

        view.addConstrainedSubview(horizontalMultiSlider, constrain: .leftMargin, .rightMargin, .bottomMargin)
        view.layoutMargins = UIEdgeInsets(top: 32, left: 32, bottom: 32, right: 32)

        horizontalMultiSlider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
    }

    @objc func sliderChanged(_ slider: MultiSlider) {
        print("thumb \(slider.draggedThumbIndex) moved")
        print("now thumbs are at \(slider.value)") // e.g., [1.0, 4.5, 5.0]
    }
}

extension UIImage {
    func resizedImage(boundingSize: CGSize) -> UIImage {
        let rect = AVMakeRect(aspectRatio: self.size, insideRect: CGRect(origin: .zero, size: boundingSize))
        let size = rect.size
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
