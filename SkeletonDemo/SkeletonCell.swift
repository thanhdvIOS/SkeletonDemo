//
//  SkeletonCell.swift
//  SkeletonDemo
//
//  Created by OminextMobile on 9/11/17.
//  Copyright © 2017 OminextMobile. All rights reserved.
//

import UIKit
import Skeleton
import Shimmer

class SkeletonCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var shimmeringView: FBShimmeringView!
  @IBOutlet weak var titleHolderView: GradientContainerView!
  @IBOutlet weak var iconHolderView: GradientContainerView!
  @IBOutlet weak var backGroundHolderView: GradientContainerView!
  @IBOutlet weak var iconImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    iconImageView.layer.cornerRadius = 25
    iconImageView.layer.masksToBounds = true
    iconHolderView.layer.cornerRadius = 25
    iconHolderView.layer.masksToBounds = true
    shimmeringView.contentView = titleLabel
    shimmeringView.isShimmering = true
    shimmeringView.shimmeringAnimationOpacity = 0.3
    shimmeringView.shimmeringPauseDuration = 0.1
    shimmeringView.shimmeringDirection = .left
    shimmeringView.shimmeringHighlightLength = 0.7
    perform(#selector(hiddenTitlePlaceHolderView), with: nil, afterDelay: 1)
    perform(#selector(hiddenIconPlaceHolderView), with: nil, afterDelay: 3)
    perform(#selector(hiddenBackGroundPlaceHolderView), with: nil, afterDelay: 4)
    perform(#selector(hiddenShimmeringView), with: nil, afterDelay: 4)
  }
  
  //MARK: - ActionLoading
  
  func hiddenBackGroundPlaceHolderView(){
    backGroundHolderView.isHidden = true
  }
  
  func hiddenIconPlaceHolderView(){
    iconHolderView.isHidden = true
  }
  
  func hiddenTitlePlaceHolderView(){
    titleHolderView.isHidden = true
  }
  
  func hiddenShimmeringView(){
    shimmeringView.isShimmering = false
  }
  
}

extension SkeletonCell: GradientsOwner {
  
  var gradientLayers: [CAGradientLayer] {
    return [titleHolderView.gradientLayer, iconHolderView.gradientLayer,backGroundHolderView.gradientLayer]
  }
}
