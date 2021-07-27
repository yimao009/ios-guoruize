//
//  MomentsListViewController.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import UIKit

class MomentsListViewController: BaseTableViewController {
    override init() {
        super.init()

        // The `userID` is hardcoded for now
        self.viewModel = MomentsListViewModel(userID: "1", momentsRepo: MomentsRepo.shared)
    }
}
