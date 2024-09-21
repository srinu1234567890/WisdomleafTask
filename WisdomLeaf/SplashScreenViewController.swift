//
//  ViewController.swift
//  WisdomLeaf
//
//  Created by Venkata Hanumantharao Nagendla on 9/18/24.
//

import UIKit

class SplashScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let logoImageView = UIImageView(image: UIImage(named: "AppLogo"))
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.contentMode = .scaleToFill
        view.addSubview(logoImageView)

        // Set constraints
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8), // Adjust width as needed
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 0.5) // Maintain aspect ratio
        ])

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.navigateToMainScreen()
        }
    }

    private func navigateToMainScreen() {
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen // Ensure it takes the full screen
        self.present(mainVC, animated: false)
    }
}


