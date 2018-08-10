//
//  ViewController.swift
//  20180808-NishiDandekar-NYCSchools
//
//  Created by Nishigandha Dandekar on 8/8/18.
//  Copyright © 2018 Nishigandha Dandekar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var mathScoreLabel: UILabel!
    @IBOutlet weak var readingScoreLabel: UILabel!
    @IBOutlet weak var writingScoreLabel: UILabel!

    var selectedSchool: School? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolName.text = selectedSchool?.school_name ?? "No Data"
        mathScoreLabel.text = selectedSchool?.sat_math_avg_score ?? "No Data"
        readingScoreLabel.text = selectedSchool?.sat_critical_reading_avg_score ?? "No Data"
        writingScoreLabel.text = selectedSchool?.sat_writing_avg_score ?? "No Data"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

