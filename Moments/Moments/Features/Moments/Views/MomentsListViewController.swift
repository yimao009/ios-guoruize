//
//  MomentsListViewController.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import UIKit

class MomentsListViewController: BaseTableViewController {
    let trackingRepo: TrackingRepoType

    init(trackingRepo: TrackingRepoType = TrackingRepo.shared) {
        self.trackingRepo = trackingRepo
        super.init()
        self.viewModel = MomentsListViewModel(userID: UserDataStore.current.userID, momentsRepo: MomentsRepo.shared)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        trackingRepo.trackScreenviews(ScreenviewsTrackingEvent(screenName: L10n.Tracking.momentsScreen, screenClass: String(describing: self)))
    }
}
