//
//  CoordinatorFactoryProtocols.swift
//  ConciertosChile
//
//  Created by Daniel Romero on 30-01-24.
//

protocol EventCoordinatorFactory: EventViewFactory {}

protocol FavouriteCoordinatorFactory: FavouriteViewFactory {}

protocol LiveCoordinatorFactory: LiveViewFactory {}

protocol NewsCoordinatorFactory: NewsViewFactory {}
