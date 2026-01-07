//
//  Helpers.swift
//  StepCounter
//
//  Created by Muhammad Ubaid on 06/01/2026.
//

import SwiftUI

func openAppSettings() {
    if let url = URL(string: UIApplication.openSettingsURLString),
       UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
