//
//  MovieAppTabBarController.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

class MovieAppTabBarController: UITabBarController {
    
    private let homeVC = HomeRouter.createModule()
    private let movieVC = MovieRouter.createModule()
    private let tvShowsVC = TVShowsRouter.createModule()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        setupTabs()
        setupNavBarAppearance()
        setupTabBarAppearance()
        self.viewControllers = [UINavigationController(rootViewController: homeVC), UINavigationController(rootViewController: movieVC), UINavigationController(rootViewController: tvShowsVC)]
        self.tabBar.tintColor = .red
        self.tabBar.unselectedItemTintColor = .white
    }
    
    func setupTabs() {
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "Home"), selectedImage: UIImage(named: "Home"))

        movieVC.tabBarItem = UITabBarItem(title: "Movie", image: UIImage(named: "Movie"), selectedImage: UIImage(named: "Movie"))

        tvShowsVC.tabBarItem = UITabBarItem(title: "TV Shows", image: UIImage(named: "TVShows"), selectedImage: UIImage(named: "TVShows"))
    }
    
    func setupNavBarAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navBarAppearance.backgroundColor = UIColor.black
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
    
    func setupTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.black
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().standardAppearance = tabBarAppearance
        self.tabBar.backgroundColor = .black
    }
}
