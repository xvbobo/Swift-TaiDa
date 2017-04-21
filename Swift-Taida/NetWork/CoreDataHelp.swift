//
//  CoreDataHelp.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/4/18.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit
import CoreData
class CoreDataHelp: NSObject {
    func addData() {
        let context = NSEntityDescription.insertNewObject(forEntityName: "Dog", into: managedObjectContext) as! Dog
        context.age = "12"
        saveContext()
    }
    func search() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init()//查询对象
        let entity = NSEntityDescription.entity(forEntityName: "Dog", in: managedObjectContext)//生成一个要查询表的对象
        fetchRequest.entity = entity
        //判断查询对象是否为空，防止崩溃
        if entity != nil {
            do {
                //成功
                let manger:[AnyObject]? = try managedObjectContext.fetch(fetchRequest)
                for info:Dog in manger as![Dog] {
                    print(info.age)
                }
            } catch  {
                //失败
                fatalError("查询失败")
            }
        }
        
        
    }
}
