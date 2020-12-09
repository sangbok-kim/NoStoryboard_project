//
//  VideoListVC.swift
//  NoStoryboard
//
//  Created by Wehoon on 2020/12/09.
//

import UIKit

class VideoListVC: UIViewController {
    
    var tableView = UITableView()
    var videos: [Video] = []
    
    struct Cells {
        static let videoCell = "VideoCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Available languages"
        configureTableView()
        videos = fetchData()

    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        //set delegates
        setTableViewDelegates()
        //set row height
        tableView.rowHeight = 100
        //register cells
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        //set constraints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension VideoListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell
        let video = videos[indexPath.row]
        cell.set(video: video)
                
        return cell
    }
}

extension VideoListVC {
    func fetchData() -> [Video] {
        let video1 = Video(image: Images.mandarin_simplified, title: "Simplified Mandarin")
        let video2 = Video(image: Images.mandarin_traditional, title: "Traditional Mandarin")
        let video3 = Video(image: Images.cantonese_hk, title: "Cantonese (Hong Kong)")
        let video4 = Video(image: Images.cantonese_mc, title: "Cantonese (Macau)")
        let video5 = Video(image: Images.korean, title: "Korean")
        let video6 = Video(image: Images.japanese, title: "Japanese")
        
        return [video1, video2, video3, video4, video5, video6]
    }
}
