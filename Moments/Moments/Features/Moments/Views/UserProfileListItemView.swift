//
//  UserProfileListItemView.swift
//  Moments
//
//  Created by guoruize on 2021/7/26.
//

import UIKit
import DesignKit

final class UserProfileListItemView<VM: ListItemViewModel>: UIView, ListItemView {
    typealias ViewModel = VM

    private let backgroundImageView: UIImageView = configure(UIImageView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.accessibilityIgnoresInvertColors = true
    }

    private let avatarImageView: UIImageView = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.accessibilityIgnoresInvertColors = true
        $0.clipsToBounds = true
    }

    private let nameLabel: UILabel = configure(.init()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setDynamicFont(UIFont.designKit.title3)
        $0.textColor = .white
        $0.numberOfLines = 1
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(backgroundImageView)
        addSubview(avatarImageView)
        addSubview(nameLabel)

        backgroundImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self)
            $0.bottom.equalTo(self.snp.bottom).offset(-Spacing.twoExtraLarge)
            $0.height.equalTo(backgroundImageView.snp.width).multipliedBy(0.8).priority(999)
        }

        avatarImageView.snp.makeConstraints {
            $0.right.equalTo(self.snp.right).offset(-Spacing.large)
            $0.bottom.equalTo(self.snp.bottom)
        }

        nameLabel.snp.makeConstraints {
            $0.right.equalTo(self.avatarImageView.snp.left)
            $0.centerY.equalTo(self.avatarImageView.snp.centerY)
        }
    }

    required init?(coder: NSCoder) {
        fatalError(L10n.Development.fatalErrorInitCoderNotImplemented)
    }

    func update(_ viewModel: ViewModel) {
        guard let viewModel = viewModel as? UserProfileListItemViewModel else {
            return
        }

        backgroundImageView.kf.setImage(with: viewModel.backgroundImageURL)
        avatarImageView.kf.setImage(with: viewModel.avatarURL)
        nameLabel.text = viewModel.name
    }
}
