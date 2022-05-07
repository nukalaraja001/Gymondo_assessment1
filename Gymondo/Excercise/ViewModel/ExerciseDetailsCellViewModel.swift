//
//  ExerciseDetailsCellViewModel.swift
//  Gymondo
//
//  Created by Nukala, Raja | RIEPL on 01/05/22.
//

import Foundation

class ExerciseDetailsCellViewModel {
    
    var id: Int?
    var title: String?
    var description: String?
    var exerciseInfo: ExerciseInfoModel.Response.ExeriseInfo?
    var imageDataSource = [ImageCellViewModel]()
    var variations: [Int]?

    
    init(model: ExerciseInfoModel.Response.ExeriseInfo) {
        exerciseInfo = model
        configureOutput()
    }
    
    func configureOutput() {
        self.id = exerciseInfo?.id ?? nil
        self.title = exerciseInfo?.name ?? ""
        self.description = exerciseInfo?.description ?? ""
        self.variations = exerciseInfo?.variations ?? []
    }
    
    func imageCellViewModel(indexPath: IndexPath) -> (ImageCellViewModel) {
        let imageCellViewModel = imageDataSource[indexPath.row]
        return imageCellViewModel
    }
}
