//
//  BaseUseCase.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 03/01/2026.
//

import Foundation

// MARK: - UseCase with Future-like behavior
protocol UseCase {
    associatedtype Response
    associatedtype Param

    func execute(_ param: Param) async throws -> Response
}

// MARK: - NoParams UseCase with Future-like behavior
protocol NoParamsUseCase {
    associatedtype Response

    func execute() async throws -> Response
}

// MARK: - NoParams UseCase without async
protocol NoParamsNonFutureUseCase {
    associatedtype Response

    func execute() -> Response
}

// MARK: - Param UseCase without async
protocol NonFutureUseCase {
    associatedtype Response
    associatedtype Param

    func execute(_ param: Param) -> Response
}
