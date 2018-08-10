//
//  SchoolDataModel.swift
//  20180808-NishiDandekar-NYCSchools
//
//  Created by Nishigandha Dandekar on 8/9/18.
//  Copyright © 2018 Nishigandha Dandekar. All rights reserved.
//

import Foundation

struct School: Codable {
    let school_name: String?
    let sat_critical_reading_avg_score: String?
    let sat_math_avg_score: String?
    let sat_writing_avg_score: String?
}
