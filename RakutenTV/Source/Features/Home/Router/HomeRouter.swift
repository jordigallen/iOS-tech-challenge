//
//  HomeRouter.swift
//  RakutenTV
//
//  Created by JORDI GALLEN RENAU on 30/3/21.
//

import Foundation
import UIKit

final class HomeRouter {
    var viewController: UIViewController {
        return createViewController()
    }

    private var sourceView: UIViewController?

    private func createViewController() -> UIViewController {
        let view = HomeViewController(nibName:"HomeView", bundle: Bundle.main)
        return view
    }

    func setSourceView( sourceView: UIViewController?){
        guard let view = sourceView else {
            fatalError("Error unnoukned")
        }
        self.sourceView = view
    }
}
