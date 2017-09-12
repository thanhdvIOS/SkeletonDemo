//
//  ViewController.swift
//  SkeletonDemo
//
//  Created by OminextMobile on 9/11/17.
//  Copyright © 2017 OminextMobile. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

  let cellid = "cellid"
  
  let tableView: UITableView = {
    
    let tbv = UITableView()
    tbv.translatesAutoresizingMaskIntoConstraints = false
    return tbv
    
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.barTintColor =  UIColor(red: 228/255.0, green: 50/255.0, blue: 21/255.0, alpha: 1)
    navigationItem.title = "AppName"
    setupTableView()
    
  }
  
  func setupTableView(){
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.allowsSelection = false
    tableView.separatorStyle = .none
    tableView.register(UINib(nibName: "SkeletonCell", bundle: nil), forCellReuseIdentifier: cellid)
    view.addSubview(tableView)
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tableView]))
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tableView]))
    
  }
  
}


// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! SkeletonCell
    
    cell.gradientLayers.forEach{
      
      gradientLayer in
      let baseColor = cell.titleHolderView.backgroundColor!
      gradientLayer.colors = [baseColor.cgColor,
                              baseColor.brightened(by: 0.93).cgColor,
                              baseColor.cgColor]
      
    }
    
    cell.slide(to: .right)
    
    return cell
  }

}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 0.5*UIScreen.main.bounds.height
  }
}

extension UIColor {
  
  func brightened(by factor: CGFloat) -> UIColor {
    var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
    getHue(&h, saturation: &s, brightness: &b, alpha: &a)
    return UIColor(hue: h, saturation: s, brightness: b * factor, alpha: a)
  }
}

