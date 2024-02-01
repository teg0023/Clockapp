//
//  ViewController.swift
//  Clockapp
//
//  Created by user248010 on 1/29/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var liveClockLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var timerPicker: UIDatePicker!
    @IBOutlet weak var timerBTN: UIButton!
    @IBOutlet weak var background: UIImageView!
    
    var timer = Timer()
    var timer2 = Timer()
    var totalTime = 0.0
    var dfttotalTime = 0.0
    var counter = 0
    var array: [Character] = []
    var dftdatetme = Date()
    var datetme = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timerLabel.text = ""
        liveClockLabel.text = ""
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(liveClock), userInfo: nil, repeats: true)
        timerBTN.setTitle("Start Timer", for: UIControl.State.normal)
        dfttotalTime = timerPicker.countDownDuration
        totalTime = dfttotalTime
        dftdatetme = timerPicker.date.addingTimeInterval(-21600)
        datetme = dftdatetme
        
    }

    @IBAction func timerSetup(_ sender: UIDatePicker) {
        totalTime = sender.countDownDuration
        datetme = sender.date.addingTimeInterval(-21600)
    }
    
    @IBAction func startTimerStopMusic(_ sender: UIButton) {
        if (timerBTN.title(for: UIControl.State.normal) == "Start Timer" && timer2.isValid != true)
        {
            timer2.invalidate()
            timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDownClock), userInfo: nil, repeats: true)
        }
        else if (timerBTN.title(for: UIControl.State.normal) == "Stop Music")
        {
            timerBTN.setTitle("Start Timer", for: UIControl.State.normal)
            timerLabel.text = ""
            dfttotalTime = timerPicker.countDownDuration
            totalTime = dfttotalTime
            dftdatetme = timerPicker.date.addingTimeInterval(-21600)
            datetme = dftdatetme        }
    }
    
    @objc func liveClock() {
        let currentDate = Date()
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "a"
        if (dateFormat.string(from: currentDate) == "AM")
        {
            background.image = UIImage(named: "day")
        }
        else
        {
            background.image = UIImage(named: "night")
        }
        dateFormat.dateFormat = "E, dd MMM yyyy HH:mm:ss"
        liveClockLabel.text = dateFormat.string(from: currentDate)

    }
    
    @objc func countDownClock() {
        
        if (dfttotalTime == totalTime)
        {
            if (totalTime >= 0)
            {
                let tmeclk = datetme.description
                var cld = String()
                for char in tmeclk
                {
                    if (counter >= 11 && counter <= 18)
                    {
                        array.append(char)
                    }
                    counter += 1
                }
                cld = String(array)
                timerLabel.text = cld
                datetme = datetme.addingTimeInterval(-1)
                totalTime -= 1
                array = []
                counter = 0
            }
            else
            {
                timer2.invalidate()
                timerBTN.setTitle("Stop Music", for: UIControl.State.normal)
            }
        }
        else
        {
            if (totalTime >= 0)
            {
                let tmeclk = datetme.description
                var cld = String()
                for char in tmeclk
                {
                    if (counter >= 11 && counter <= 18)
                    {
                        array.append(char)
                    }
                    counter += 1
                }
                cld = String(array)
                timerLabel.text = cld
                datetme = datetme.addingTimeInterval(-1)
                totalTime -= 1
                array = []
                counter = 0
            }
            else
            {
                timer2.invalidate()
                timerBTN.setTitle("Stop Music", for: UIControl.State.normal)
            }
        }
    }
}

