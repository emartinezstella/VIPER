//
//  ListOfMoviesView.swift
//  VIPER
//
//  Created by Eduardo Martinez Ibarra on 26/06/23.
//

import Foundation
import UIKit
import SnapKit

class ListOfMoviesView: UIViewController{
    
    private var moviesTableView: UITableView = {
       let table = UITableView()
        table.estimatedRowHeight = 120
        table.rowHeight = UITableView.automaticDimension
        table.register(MovieCellView.self, forCellReuseIdentifier: "MovieCellView")
        return table
    }()
    
    private let presenter : ListOfMoviesPresentable
    
    init(presenter: ListOfMoviesPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Popular movies".uppercased()
        setupTableView()
        presenter.onViewAppear()
    }
    
    private func setupTableView(){
        
        view.addSubview(moviesTableView)
        moviesTableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
    }
}

extension ListOfMoviesView: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTapCell(atIndex: indexPath.row)
    }
}

extension ListOfMoviesView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        presenter.viewModels.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellView", for: indexPath) as! MovieCellView
        
        cell.config(model: presenter.viewModels[indexPath.row])
               
        return cell
        
    }
    
    
}

extension ListOfMoviesView: ListOfMoviesUI{
    func update(movies: [ViewModel]) {
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
}
