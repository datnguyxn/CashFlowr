//
//  LoadingOverlay.swift
//  CashFlowr
//
//  Created by Dat Nguyen on 3/6/25.
//

import UIKit
import SwiftUI

class LoadingOverlay {
    static let shared = LoadingOverlay()
    
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView(style: .large)

    func show(over view: UIView) {
        // Configure the overlay
        overlayView.frame = view.bounds
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        overlayView.isUserInteractionEnabled = true // same as dismissible: false

        // Configure the loading indicator
        activityIndicator.color = .blue
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        overlayView.addSubview(activityIndicator)
        
        // Center the indicator
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor)
        ])
        
        activityIndicator.startAnimating()
        view.addSubview(overlayView)
    }

    func hide() {
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
}

struct LoadingOverlayPresenter: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        DispatchQueue.main.async {
            if let rootView = vc.view {
                LoadingOverlay.shared.show(over: rootView)
            }
        }
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
