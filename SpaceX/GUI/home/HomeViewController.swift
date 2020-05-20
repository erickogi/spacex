//
//  HomeViewController.swift
//  CBALoop
//
//  Created by Jarret Hardie on 24/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewController:  BindableViewController<HomeViewModel> {

    
    @IBOutlet weak var tableView: UITableView!
    var tableController: TableViewController<LaunchInfoCell, PickerFieldItem<LaunchInfo>>?
    override var viewModel: HomeViewModel! {
           didSet {
               tabBarItem = UITabBarItem(title: viewModel.tabBarTitle,
                                         image: UIImage(named: viewModel.tabBarInactiveIconName),
                                         selectedImage: UIImage(named: viewModel.tabBarActiveIconName))
               bind()
           }
       }

    @IBOutlet weak var nasaImageView: UIImageView!
    //    required init?(coder aDecoder: NSCoder) {
//       // fatalError()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 900
        viewModel.fetchNextLaunch()
        viewModel.fetchNasaImage()
        setupTable()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    private func setupTable() {
        let cellDescriptord = TableCellDescriptor<LaunchInfoCell, PickerFieldItem<LaunchInfo>>(reuseIdentifier: "LaunchInfoCell", nibName: "LaunchInfoCell") { [weak self] cell, item in
            cell.titleLable.text = item.item.name
            cell.descLabel.text = item.item.desc
            cell.iconView.image = UIImage(named: item.item.icon)
        }
        
        tableController = TableViewController<LaunchInfoCell, PickerFieldItem<LaunchInfo>>(tableView: tableView, items: [], cellDescriptor: cellDescriptord, initialSelection: nil)
            
            
        self.tableController?.didSelect = { [weak self] selected in
           // self?.didSelectBiller?(selected.item)
        }
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (navigationController as? NavigationController)?.progressView.isHidden = true
        
        
    }
    
    override func bind() {
        super.bind()
        viewModel.didLoadImage = loadImage
        viewModel.didLoadLaunch = loadLaunch
    }
    
    func loadImage(){
        let image: NasaImage = viewModel.nasaImage!
        let url = URL(string:  image.hdurl)
        self.nasaImageView.kf.setImage(with: url)
    }
    
    func loadLaunch(){
        let infos = viewModel.launchInfos.map({ PickerFieldItem<LaunchInfo>(item: $0, displayText: { $0.name }) })
        tableController?.items = infos
        
    }

    func reset() {
       
    }
    
    override func didUpdate() {
       
    }

    

    override func didError(_ error: Error) {
        super.didError(error)
       
    }

    deinit {
          viewModel.didLoadImage = nil
          viewModel.didLoadLaunch = nil
      }

}
