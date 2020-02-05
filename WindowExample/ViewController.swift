//
//  ViewController.swift
//  WindowExample
//
//  Created by Joshua on 2020/02/05.
//  Copyright © 2020 Joshua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var window: UIWindow?

    var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle("add", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        button.addTarget(self, action: #selector(addWindow(_:)), for: .touchUpInside)
    }

    @IBAction func addWindow(_ sender: Any) {
        let windows = UIApplication.shared.connectedScenes
             .compactMap { $0 as? UIWindowScene}

        let newWindow = UIWindow(windowScene: windows[0])

        let vc = NewViewController()

        newWindow.rootViewController = vc
        newWindow.isHidden = false
        newWindow.windowLevel = .alert

        self.window = newWindow

        newWindow.makeKey()
    }

    deinit {
        print("viewController deinit")
    }
}
