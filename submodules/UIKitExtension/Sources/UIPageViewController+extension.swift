//
//  UIPageViewController+extension.swift
//
//  Copyright 2022 Pepe Unlimited
//  Licensed under the MIT license, see associated LICENSE file for terms.
//  See AUTHORS file for the list of project authors.
//

import UIKit

public extension UIPageViewController {

  var pageControl: UIPageControl {
    UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
  }
}
