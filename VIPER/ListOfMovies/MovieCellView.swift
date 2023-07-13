//
//  MovieCellView.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 27/06/23.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class MovieCellView: UITableViewCell{
    
    let imvMovie: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let lblName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        if #available(iOS 16.0, *) {
            label.font = UIFont.systemFont(ofSize: 32, weight: .bold, width: .condensed)
        } else {
            // Fallback on earlier versions
            label.font = .systemFont(ofSize: 32)
        }
        return label
    }()
    
    let lblVote: UILabel = {
        let label = UILabel()
        if #available(iOS 16.0, *) {
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold, width: .condensed)
        } else {
            // Fallback on earlier versions
            label.font = .systemFont(ofSize: 24)
        }
        return label
    }()
    
    let pointAverage: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    let lblDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        if #available(iOS 16.0, *) {
            label.font = UIFont.systemFont(ofSize: 12, weight: .regular, width: .standard)
        } else {
            // Fallback on earlier versions
            label.font = .systemFont(ofSize: 12)
        }
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    
    
    func setupViews(){
        
        addSubview(imvMovie)
        imvMovie.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(12)
            make.height.equalTo(200)
            make.width.equalTo(100)
        }
        
        addSubview(lblVote)
        lblVote.snp.makeConstraints { make in
            make.top.equalTo(imvMovie.snp.bottom)
            make.centerX.equalTo(imvMovie)
            make.bottom.lessThanOrEqualTo(self.snp.bottom).offset(-12)
        }
        
        addSubview(pointAverage)
        pointAverage.snp.makeConstraints { make in
            make.centerY.equalTo(lblVote)
            make.leading.equalTo(lblVote.snp.trailing).offset(5)
            make.height.width.equalTo(10)
        }
        
        addSubview(lblName)
        lblName.snp.makeConstraints { make in
            make.top.equalTo(imvMovie).offset(24)
            make.leading.equalTo(imvMovie.snp.trailing).offset(18)
            make.trailing.equalToSuperview().offset(-12)
        }
        
        addSubview(lblDescription)
        lblDescription.snp.makeConstraints { make in
            make.top.equalTo(lblName.snp.bottom).offset(8)
            make.leading.equalTo(imvMovie.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.lessThanOrEqualTo(self.snp.bottom).offset(-12)
        }
    }
    
    func config(model: ViewModel){
        lblName.text = model.title
        lblVote.text = "\(model.vote)"
        pointAverage.backgroundColor = getAverageColor(vote: model.vote)
        lblDescription.text = model.overview
        imvMovie.kf.setImage(with: model.imageUrl)
    }
    
    func getAverageColor(vote: Double) -> UIColor{
        
        switch vote {
            
        case 0..<5:
            return .red
            
        case 5..<8:
            return .yellow
            
        case 8..<11:
            return .green
            
        default:
            return .black
            
        }
        
    }
}
