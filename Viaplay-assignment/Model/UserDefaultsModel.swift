//
//  UserDefaultsModel.swift
//  Viaplay-assignment
//
//  Created by Jonas Bergström on 2022-11-11.
//

import Foundation

extension UserDefaults {
    func get(forKey defaultName: String) -> ViaplayResponse? {
        guard let data = data(forKey: defaultName) else { return nil }
        do {
            return try JSONDecoder().decode(ViaplayResponse.self, from: data)
        } catch { print(error); return nil }
    }

    func set(_ value: ViaplayResponse, forKey defaultName: String) {
        let data = try? JSONEncoder().encode(value)
        set(data, forKey: defaultName)
    }
}
