//
//  UIViewController+ActivityIndicator.swift
//  Reto_Tecnico_Jose_QR
//
//  Created by Jose Leoncio Quispe Rodriguez on 3/05/22.
//


import UIKit

public extension UIViewController {
    func showLoader() {
        let activity = UIActivityIndicatorView()
        guard let window = UIApplication.shared.keyWindow else {return}
        let backgroundAlphaView = UIView(frame: window.bounds)
        backgroundAlphaView.tag = 789
        backgroundAlphaView.backgroundColor = .white
        window.addSubview(backgroundAlphaView)
        backgroundAlphaView.translatesAutoresizingMaskIntoConstraints = false
        backgroundAlphaView.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
        backgroundAlphaView.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
        backgroundAlphaView.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
        backgroundAlphaView.bottomAnchor.constraint(equalTo: window.bottomAnchor).isActive = true
        backgroundAlphaView.addSubview(activity)
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.centerXAnchor.constraint(equalTo: backgroundAlphaView.centerXAnchor).isActive = true
        activity.centerYAnchor.constraint(equalTo: backgroundAlphaView.centerYAnchor).isActive = true
        activity.style = .whiteLarge
        activity.color = .purple
        activity.hidesWhenStopped = true
        activity.isHidden = false
        activity.startAnimating()
    }

    func hideLoader() {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else {return}
            if let activity = window.viewWithTag(789) {
                activity.removeFromSuperview()
            }
        }
    }
}
