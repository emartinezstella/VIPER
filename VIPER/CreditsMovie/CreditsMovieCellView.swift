//
//  CreditsMovieCellView.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 29/06/23.
//

import UIKit
import SnapKit

class CreditsMovieCellView: UITableViewCell {
    
    let lblName : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    let lblJob : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupIU()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupIU(){
        addSubview(lblName)
        lblName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
        }
        
        addSubview(lblJob)
        lblJob.snp.makeConstraints { make in
            make.top.equalTo(lblName.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.lessThanOrEqualTo(-8)
        }
    }
    
    
    func config(model: CreditMovieViewModel){
        lblName.text = model.name
        lblJob.text  = model.job
    }

}
