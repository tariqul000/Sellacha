//
//  DashBoardViewController.swift
//  SellAcha
//
//  Created by VinodKatta on 28/04/22.
//

import UIKit
import Charts

class DashBoardViewController: UIViewController,ChartViewDelegate {
    
    @IBOutlet weak var menubar: UIBarButtonItem!
    
    {
        didSet{
            menubar.target = self.revealViewController()
            menubar.action = #selector(SWRevealViewController.revealToggle(_:))
        }
    }
    
    
    @IBOutlet weak var PieviewChart: PieChartView!
    
    @IBOutlet weak var lineChart: LineChartView!
    
    @IBOutlet weak var secLineChart: LineChartView!
    
    @IBOutlet weak var dashImage: UIImageView!
    
     var pieChatView = PieChartView()
    
    @IBOutlet weak var DashBoardBackView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dashImage.makeRounded()
        
        PieviewChart.delegate = self
        lineChart.delegate = self
        secLineChart.delegate = self
        
        setdataPie()
        setDataLine()
        setDataSec()
       
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        DashBoardBackView.clipsToBounds = true
        DashBoardBackView.layer.cornerRadius = 50
        DashBoardBackView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        

        
       
        
    }
    
    func setdataPie()
    
    {
        var entries = [BarChartDataEntry]()
        
        for x in 0..<10
        {
            entries.append(BarChartDataEntry(x: Double(x), y: Double(x)))
        }
        
        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.joyful()
        
        let data = PieChartData(dataSet: set)
        PieviewChart.data = data
        
    }
    
    
    func setDataLine()
    
    {
        
    var lineEntries = [BarChartDataEntry]()
    
    for x in 0..<10{
        lineEntries.append(BarChartDataEntry(x: Double(x), y: Double(x)))
        
    }
    
    let set = LineChartDataSet(entries: lineEntries)
    set.colors = ChartColorTemplates.joyful()
    
    let data = LineChartData(dataSet: set)
        lineChart.data = data
    }
    
    
    
    
    func setDataSec()
    
    {
        
    var lineTwoEntries = [BarChartDataEntry]()
    
    for x in 0..<10{
        lineTwoEntries.append(BarChartDataEntry(x: Double(x), y: Double(x)))
        
    }
    
    let set = LineChartDataSet(entries: lineTwoEntries)
    set.colors = ChartColorTemplates.joyful()
    
    let data = LineChartData(dataSet: set)
        secLineChart.data = data
    }
    


    

   

}
