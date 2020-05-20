//
//  HomeViewModel.swift
//  CBALoop
//
//  Created by Jarret Hardie on 24/09/2017.
//  Copyright © 2017 Commercial Bank of Africa. All rights reserved.
//

import Foundation

class HomeViewModel: ViewControllerModel, LoadingStateDisplayer {

    var nextLaunch : Next?
    var nasaImage : NasaImage?

    var title: String {
        return "Home"
    }

    var tabBarTitle: String {
        return "Home"
    }
    
    var tabBarInactiveIconName: String {
        return "icTabHomeOff"
    }
    
    var tabBarActiveIconName: String {
        return "icTabHomeOn"
    }

    
    func fetchNextLaunch(){
          LaunchServiceImpl.next(){[weak self] (result) in
            guard self != nil else {return}
          switch result{
          case.success(let value):
          self?.nextLaunch = value
          self?.createLaunchInfo()
          case .failure( _):
          self?.didError
        }
      }
    }
    
    func fetchNasaImage(){
        NasaServiceImpl.image(){[weak self] (result) in
            guard self != nil else {return}
            switch result{
            case.success(let value):
            self?.nasaImage = value
            self?.didLoadImage?()
            case .failure( _):
            self?.didError
          }
        }
    }
    var launchInfos: [LaunchInfo] = []
    func createLaunchInfo(){
        
        var infos: [LaunchInfo] = []
       
        infos.append(LaunchInfo(name: "Launched by "+nextLaunch!.rocket.rocketName, desc: nextLaunch!.missionName, icon: "globe"))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let date = dateFormatter.date(from: nextLaunch!.launchDateUTC)

        // change to a readable time format and change to local time zone
        dateFormatter.dateFormat = "EEE, MMM d, yyyy - h:mm a"
        dateFormatter.timeZone = NSTimeZone.local
        let timeStamp = dateFormatter.string(from: date!)
        //
        //2020-05-27T20:33:00.000Z
        infos.append(LaunchInfo(name: "Launch date ", desc: "Scheduled for  "+timeStamp, icon: "date"))
        
        infos.append(LaunchInfo(name: "Launchpad ", desc: "At  "+nextLaunch!.launchSite.siteNameLong, icon: "marker"))
        
        infos.append(LaunchInfo(name: "Static Fire ", desc: "Not updated ", icon: "timer"))
        
        infos.append(LaunchInfo(name: "Static Fire ", desc: "Not updated ", icon: "capsule"))
        
        launchInfos = infos
        
        didLoadLaunch?()
    }
    // MARK: ViewControllerModel methods
    var didUpdate: (() -> Void)?
    var didError: ((Error) -> Void)?
    var didLoadImage: (() -> Void)?
    var didLoadLaunch: (() -> Void)?
    
}
