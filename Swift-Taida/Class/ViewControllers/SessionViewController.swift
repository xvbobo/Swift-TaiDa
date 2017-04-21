//
//  SessionViewController.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2016/12/26.
//  Copyright © 2016年 许菠菠. All rights reserved.
//

import UIKit

class SessionViewController: BaseViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {

    var pageController = UIPageViewController()
    var viewControllers = [UIViewController]()
    var buttons = [UIButton]()
    let buttonW = ScreenWidth/3
    let buttonTitle = ["左","中","右"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "圈子"
        createUI()
        

        // Do any additional setup after loading the view.
    }
    func createUI() {
        pageController = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.view.backgroundColor = UIColor.blue
        let item1 = UIBarButtonItem.init(title: "左", style: .done, target: self, action: #selector(item1Action1))
        let item2 = UIBarButtonItem.init(title: "中", style: .done, target: self, action: #selector(item1Action2))
        let item3 = UIBarButtonItem.init(title: "右", style: .done, target: self, action: #selector(item1Action3))
        pageController .setToolbarItems([item1,item2,item3], animated: false)
        
        let leftVC = LeftViewController()
        leftVC.view.tag = 100
        let centeVC = CenterViewController()
        centeVC.view.tag = 101
        let rightVC = RightViewController()
        rightVC.view.tag = 102
        viewControllers.append(contentsOf: [leftVC,centeVC,rightVC])
        
        
        for i in 0..<3 {
            let button = UIButton.init(type: .custom)
            button.frame = CGRect.init(x: CGFloat(i) * buttonW, y: 64, width: buttonW, height: 30)
            button.tag = 200 + i
            button.layer.borderWidth = 1
            button.addTarget(self, action: #selector(buttonAction(button:)), for: .touchUpInside)
            button.layer.borderColor = UIColor.gray.cgColor
            button.setTitle(buttonTitle[i], for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.backgroundColor = UIColor.white
            buttons.append(button)
            self.view.addSubview(button)
        }
        pageController.view.frame = CGRect.init(x: 0, y: 94, width: ScreenWidth, height: ScreenHeight - 94 - 50)
        pageController .setViewControllers([viewControllers[1]], direction: .forward, animated: false, completion: nil)
        pageController.delegate = self
        pageController.dataSource = self
        self.view.addSubview(pageController.view)
        self.addChildViewController(pageController)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.view.tag == 100 {
            return nil
        }
       let viewController = viewControllers[0]
        return viewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.view.tag == 102 {
            return nil
        }

       let  viewController = viewControllers[2]
        return viewController
    }
    func buttonAction(button : UIButton) {
        print(button.tag)
        pageController .setViewControllers([viewControllers[button.tag - 200]], direction: .forward, animated: false, completion: nil)
    }
    func item1Action1()  {
        
    }
    func item1Action2()  {
        
    }
    func item1Action3()  {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
