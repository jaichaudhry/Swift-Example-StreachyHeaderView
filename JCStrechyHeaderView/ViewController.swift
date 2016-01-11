//
//  ViewController.swift
//  JCStrechyHeaderView
//
//  Created by Jai Chaudhry on 11/01/16.
//  Copyright © 2016 jc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var imageHeaderView: ImageHeaderView?
    
    private var kCellReusableIdentifier = "kCellReusableIdentifier"
    
    private var kHeaderViewHeight: CGFloat = 300;
    
    // MARK - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: kCellReusableIdentifier)
        view.addSubview(tableView)
    
        addStreachyImageViewWithImage(UIImage(named: "marvel")!)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let viewSize = self.view.frame.size
        tableView.frame = CGRectMake(0, 0, viewSize.width, viewSize.height)
    }
    
    // MARK- Public methods
    
    func addStreachyImageViewWithImage(image: UIImage) {
        imageHeaderView = ImageHeaderView(image: image)
        let viewSize = self.view.frame.size
        imageHeaderView?.frame = CGRectMake(0, 0, viewSize.width, kHeaderViewHeight)
        tableView.tableHeaderView = imageHeaderView
    }
    
    // MARK - UITableViewDelegate methods
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        imageHeaderView?.layoutSubviewsWithContentOffset(tableView.contentOffset)
    }
    
    // MARK - UITableViewDataSource methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kCellReusableIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = "Cell Text" + " \(indexPath.row)"
        return cell
    }
}

