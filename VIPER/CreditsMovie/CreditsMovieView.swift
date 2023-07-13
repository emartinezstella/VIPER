//
//  CreditsMovieView.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 29/06/23.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class CreditsMovieView: UIViewController{

    private let presenter: CreditsMoviePresentable
    
    let tableView: UITableView = {
        let table = UITableView()
        table.estimatedRowHeight = 80
        table.rowHeight = UITableView.automaticDimension
        table.register(CreditsMovieCellView.self, forCellReuseIdentifier: "CreditsMovieCellView")
        return table
    }()
    
    init(presenter: CreditsMoviePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Credits"
        setupUI()
        presenter.onViewAppear()
    }
    
    func setupUI(){
        let guide = view.safeAreaLayoutGuide
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.trailing.bottom.equalTo(guide)
        }
        
        
        tableView.dataSource = self
    }
}

extension CreditsMovieView: CreditMovieUI{
    func updateUI(viewModel: [CreditMovieViewModel]) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension CreditsMovieView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreditsMovieCellView") as! CreditsMovieCellView
        cell.config(model: presenter.viewModel[indexPath.row])
        return cell
    }
    
    
}



