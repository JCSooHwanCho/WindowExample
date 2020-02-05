//
//  NewViewController.swift
//  WindowExample
//
//  Created by Joshua on 2020/02/05.
//  Copyright © 2020 Joshua. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle("delete", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)

        view.backgroundColor = .brown
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        button.addTarget(self, action: #selector(changeRootView(_:)), for: .touchUpInside)
    }

    @objc func changeRootView(_ sender: UIButton) {
        let windows = UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene}

        let originalWindow = windows[0].windows.filter { !$0.isKeyWindow }

        print(originalWindow[0].isKeyWindow)
        
        let vc = ViewController()

        originalWindow[0].rootViewController = vc

        print(originalWindow[0].isKeyWindow)
    }

    deinit {
        print("NewViewController deinit")
    }
}
