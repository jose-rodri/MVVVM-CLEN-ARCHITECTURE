//
//  HomeViewDataSource.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 30/05/22.
//

import Foundation
import UIKit

final class HomeViewDataSource: NSObject, UITableViewDataSource {

    var data: [Result]?
 
    convenience init(data: [Result]) {
        self.init()
        self.data = data
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = data?.count {
            return list
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.cellType, for: indexPath) as!  HomeTableViewCell
        let dataCell = data?[indexPath.row]
        
        cell.imageMovie.load(urlString: ConstantsPrivate.baseImage + dataCell!.posterPath )
        cell.titleMovie.text = dataCell?.title
        cell.descriptionM.text = dataCell?.releaseDate
    
        return cell
    }
}
