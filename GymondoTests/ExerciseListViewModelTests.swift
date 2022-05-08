//
//  ExerciseListViewModelTests.swift
//  Gymondo
//
//  Created by Nukala, Raja | RIEPL on 07/05/22.
//

import XCTest
@testable import Gymondo

class ExerciseListViewModelTests: XCTestCase {
    
    var exerciseService : ExerciseService!
    //    var exerciseInfo: ExerciseInfoModel.Response.ExeriseInfo!
    var dataSource :[ExerciseListCellViewModel]!
    var dataModel: ExercisesModel.Response.Exercises!
    
    override func setUp() {
        exerciseService = ExerciseService()
        dataSource = [ExerciseListCellViewModel]()
        
    }
    
    func testFetchExercises(){
        let expectation = self.expectation(description: "")
        exerciseService.fetchExercises(requestURL: EXERCISE_LIST_URl) { response in
            expectation.fulfill()
        } fail: { errorHandler in
            XCTFail("Fail")
        }
        self.waitForExpectations(timeout: 10)
    }
    
    func testFetchExerciseInfo(){
        let expectation = self.expectation(description: "")
        exerciseService.fetchExercises(requestURL: EXERCISE_INFO_URl + "345") { response in
            expectation.fulfill()
        } fail: { errorHandler in
            XCTFail("Fail")
        }
        self.waitForExpectations(timeout: 10)
    }
    
    
    func testgetDataModel() {
        exerciseService.fetchExercises(requestURL: EXERCISE_LIST_URl) { response in
            self.dataModel = response
            XCTAssert(self.dataModel != nil, "Data model should not nil")
            self.dataSource = self.dataModel.results!.map {  return ExerciseListCellViewModel(model: $0) }
            XCTAssert(self.dataSource != nil, "Data Source should not nil")
        } fail: { errorHandler in }
    }
    
    override func tearDown() {
        exerciseService = nil
        dataSource = nil
        dataModel = nil
    }
}
