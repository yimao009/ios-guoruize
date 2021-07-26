//
//  BaseViewController.swift
//  Moments
//
//  Created by guoruize on 2021/7/23.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    lazy var disposeBag = DisposeBag()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable, message: "We don't support init view controller from a nib.")
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable, message: "We don't support init view controller from a nib.")
    required init?(coder: NSCoder) {
        fatalError(L10n.Development.fatalErrorInitCoderNotImplemented)
    }


}
