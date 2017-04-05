//
//  CalendarView.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/1/17.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit
let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height


class CalendarView: UIView ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var lastMonthBtn : UIButton!//上一个月
    var calendarLabel : UILabel!//显示日期时间
    var nextMonthBtn : UIButton!//下一月
    var collection : UICollectionView!//显示所有时间
    var dateArray : NSArray!
    var date0 : NSDate!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        date0 = NSDate()
        print(self.day(date: date0))
        self.createInterFace(frame: frame)
       
        dateArray = ["周日","周一","周二","周三","周四","周五","周六"]
        
//        print(self.getWeekDay(year: 2016, month: 1, day: 17))
//        let lable  = UILabel.init(frame: self.bounds)
//        lable.textColor = UIColor.black
//        let string = String(format:"%02d",self.getLastDay(year: 2017, month: 2))
//        lable.text = string;
//        lable.textAlignment = .center
//        self.addSubview(lable)
//        print(self .getLastDay(year: 2017, month: 1))
        
    }
    func createInterFace(frame:CGRect) {
        calendarLabel = UILabel.init(frame: CGRect.init(x: (frame.size.width - 100)/2, y: 5, width: 100, height: 20))
        calendarLabel.backgroundColor = UIColor.green
        
        calendarLabel.text = String(self.year(date: date0)) + "-" + String(self.month(date: date0)) + "-" + String(self.day(date: date0))
        calendarLabel.textAlignment = .center
        calendarLabel.font = UIFont.systemFont(ofSize: 14)
        
        self.addSubview(calendarLabel)
        lastMonthBtn = UIButton.init(type: .custom)
        lastMonthBtn.frame = CGRect.init(x: calendarLabel.frame.origin.x - 10 - 80, y: calendarLabel.frame.origin.y - 5, width: 80, height: 30)
        lastMonthBtn.setTitle("上一个月", for: UIControlState.normal)
        lastMonthBtn.setTitleColor(UIColor.black, for: .normal)
        lastMonthBtn.addTarget(self, action: #selector(self.lastMonthBtnAction), for: .touchUpInside)
        self.addSubview(lastMonthBtn)
        
        nextMonthBtn = UIButton.init(type: .custom)
        nextMonthBtn.frame = CGRect.init(x: calendarLabel.frame.origin.x + calendarLabel.frame.width + 10 , y: calendarLabel.frame.origin.y - 5, width: 80, height: 30)
        nextMonthBtn.setTitle("下一个月", for: UIControlState.normal)
        nextMonthBtn.setTitleColor(UIColor.black, for: .normal)
        nextMonthBtn.addTarget(self, action: #selector(self.nextMonthBtnAction), for: .touchUpInside)
        self.addSubview(nextMonthBtn)
        
        let lineView = UIImageView.init(frame: CGRect.init(x: 0, y: nextMonthBtn.frame.origin.y + nextMonthBtn.frame.height + 2, width: frame.width, height: 1))
        lineView.backgroundColor = UIColor.gray
        self.addSubview(lineView)
        
        let itemW = ScreenWidth/7 - 5
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: itemW, height: itemW)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
        collection = UICollectionView.init(frame: CGRect.init(x: 0, y: lineView.frame.origin.y + 1, width: frame.width, height: frame.height - lineView.frame.origin.y - 1), collectionViewLayout: layout)
        collection.register(CalendarCell.classForCoder(), forCellWithReuseIdentifier: "calenderCell")
         collection.register(DateCell.self, forCellWithReuseIdentifier: "dateCell")
        collection.backgroundColor = UIColor.white
        collection.delegate = self
        collection.dataSource = self
        self.addSubview(collection)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return dateArray.count
        }else{
            let daysInThisMonth = self.totalDaysInThisMonth(date: date0)
            let firstWeekDay = self.weekDay(date: date0)
            var day : NSInteger = 0
            day  = daysInThisMonth + firstWeekDay//当前月份的总天数
            return day
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateCell
            
            cell.weekLabel.text = dateArray[indexPath.item] as? String
            return cell
        }else{
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "calenderCell", for: indexPath) as! CalendarCell
            
            let daysInThisMonth = self.totalDaysInThisMonth(date: date0)
            let firstWeekDay = self.weekDay(date: date0)
            var day : NSInteger = 0
            let i = indexPath.row
            if i < firstWeekDay {
                cell.weekLabel.text = ""
            }else if (i > firstWeekDay + daysInThisMonth - 1){
                cell.weekLabel.text = ""
            }else{
                day = i - firstWeekDay + 1
                cell.weekLabel.text = String(day)
            }
            
            
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    func nextMonthBtnAction() {
        UIView.transition(with: collection, duration: 0.5, options: .transitionCurlUp, animations:
            { () -> Void in
                self.date0 = self.nextMonth(date: self.date0)
                self.calendarLabel.text = String(format:"%li - %.2ld",self.year(date: self.date0),self.month(date: self.date0))
                
        }, completion: nil)
        collection.reloadData()
        print(date0);
    }
    
    func lastMonthBtnAction() {
        UIView.transition(with: collection, duration: 0.5, options: .transitionCurlUp, animations:
            { () -> Void in
                self.date0 = self.lastMonth(date: self.date0)
                self.calendarLabel.text = String(format:"%li - %.2ld",self.year(date: self.date0),self.month(date: self.date0))
                
        }, completion: nil)
        collection.reloadData()
        print(date0);
    }

    //当天是几号
    func day (date : NSDate) -> NSInteger {
        let compontents = NSCalendar.current.dateComponents([.year,.month,.day], from: date as Date)
        return compontents.day!
    }
    
    //当月是几月
    func month (date : NSDate) -> NSInteger {
        let compontents = NSCalendar.current.dateComponents([.year,.month,.day], from: date as Date)
        return compontents.month!
    }
    
    //当年是什么年份
    func year (date : NSDate) -> NSInteger {
        let compontents = NSCalendar.current.dateComponents([.year,.month,.day], from: date as Date)
        return compontents.year!
    }
    
    //当月的第一天是星期几
    func weekDay (date : NSDate) -> NSInteger {
        var calendar  = NSCalendar.current
        calendar.firstWeekday = 1
        
        var compontents = NSCalendar.current.dateComponents([.year,.month,.day], from: date as Date)
        compontents.day = 1
        let firtDayOfWeekday = calendar.date(from: compontents)
        let firstWeekDay = calendar.ordinality(of: .weekday, in: .weekOfMonth, for: firtDayOfWeekday! as Date)
        
        
        return firstWeekDay! - 1
    }

    //当月的天数
    func totalDaysInThisMonth(date : NSDate) -> NSInteger {
        let totalDaysInMonths = NSCalendar.current.range(of: .day, in: .month, for: date as Date)
        return (totalDaysInMonths?.count)!
    }
    
    //上一个月
    func lastMonth (date : NSDate) -> NSDate {
        let compontents = NSDateComponents()
        compontents.month = -1
        let newDate = NSCalendar.current.date(byAdding: compontents as DateComponents, to: date as Date)
        return newDate! as NSDate
    }
    
    //下一个月
    func nextMonth (date : NSDate) -> NSDate {
        let compontents = NSDateComponents()
        compontents.month = +1
        let newDate = NSCalendar.current.date(byAdding: compontents as DateComponents, to: date as Date)
        return newDate! as NSDate
    }

    //获取周 周日：1 － 周六：7
    func getWeekDay(year:Int,month:Int,day:Int) ->Int{
    
        let dateFormatter:DateFormatter  = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let string = String(format:"%04d/%02d/%02d",year,month,day)
        let date:Date? = dateFormatter.date(from: string)
        if date != nil {
            let calendar: Calendar = Calendar.current
            let dateComp = calendar.dateComponents([.year,.month,.day,.weekday], from: date!)
            return dateComp.weekday!
            
        }
        return 0
    }
    //获取某个月的最后一天
    func getLastDay (year:Int , month:Int) -> Int {
        var month = month
        var year = year
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        if month == 12 {
            month = 0
            year += 1
        }
        let string = String(format:"%04d/%02d/01",year,month+1)

        let targetDate:NSDate? = dateFormatter.date(from: string) as NSDate?
        if targetDate != nil {
            let orgDate = NSDate.init(timeInterval: (24*60*60)*(-1), since: targetDate! as Date)
            let str:String = dateFormatter.string(from: orgDate as Date)
            return Int(str.components(separatedBy: "/").last!)!
        }
        return 0;
     }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
