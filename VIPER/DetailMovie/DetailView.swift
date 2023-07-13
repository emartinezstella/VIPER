//
//  DetailView.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 28/06/23.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class DetailView: UIViewController{
    
    private let presenter : DetailPresentable
    
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
    
    let btnCredits: UIButton = {
      let button = UIButton()
        button.setTitle("Credits".uppercased(), for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    init(presenter: DetailPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Review"
        setupView()
        presenter.onViewAppear()
    }
    
    func setupView(){
        
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(imvMovie)
        imvMovie.snp.makeConstraints { make in
            make.top.equalTo(guide).offset(20)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(200)
        }
        
        view.addSubview(lblName)
        lblName.snp.makeConstraints { make in
            make.top.equalTo(imvMovie.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
        }
        
        view.addSubview(lblDescription)
        lblDescription.snp.makeConstraints { make in
            make.top.equalTo(lblName.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
        }
        
        view.addSubview(btnCredits)
        btnCredits.snp.makeConstraints { make in
            make.top.equalTo(lblDescription.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(44)
        }
        
        btnCredits.addTarget(self, action: #selector(btnCreditsOnTap), for: .touchUpInside)
    }
    
    @objc func btnCreditsOnTap(){
        presenter.showCredits(withMovieId: presenter.movieId)
    }
}

extension DetailView: DetialPresenterUI{
    func updateUI(viewModel: DetailMovieViewModel) {
        lblName.text = viewModel.title
        lblDescription.text = viewModel.overview
        imvMovie.kf.setImage(with: viewModel.backdropPath)
    }
    
}
