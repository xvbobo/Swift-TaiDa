//
//  SessionListCell.swift
//  Swift-Taida
//
//  Created by 许菠菠 on 2017/5/18.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit
import AlamofireImage

class SessionListCell: UITableViewCell {
    
    var headerImageView = UIImageView()
    var nameLable = UILabel()
    var timeLable = UILabel()
    var titleLable = UILabel()
    var contentLable = UILabel()
    var imagesView = CustomerImagesView()
    var imageURL = [String]()

    required init(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    override init(style:UITableViewCellStyle ,reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.createSessionList()
        
    }
    
    func createSessionList() {
        
        let imageLine = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width:ScreenWidth, height: 0.5))
        imageLine.backgroundColor = UIColor.gray
        self.addSubview(imageLine)
        
        headerImageView = UIImageView.init(frame: CGRect.init(x: 10, y: 10, width: 40, height: 40))
        headerImageView.image = UIImage.init(named: "header")
        headerImageView.layer.masksToBounds = true
        headerImageView.layer.cornerRadius = 5
        self.addSubview(headerImageView)
        
        nameLable = UILabel.init(frame: CGRect.init(x: headerImageView.frame.maxX + 10, y: headerImageView.frame.minY, width: 200, height: 20))
        nameLable.text = "苍井空"
        nameLable.font = UIFont.systemFont(ofSize: 12)
        nameLable.textColor = UIColor.darkText
        self.addSubview(nameLable)
        
        timeLable = UILabel.init(frame: CGRect.init(x: headerImageView.frame.maxX + 10, y: nameLable.frame.midY + 7, width: 200, height: 20))
        timeLable.text = "刚刚"
        timeLable.font = UIFont.systemFont(ofSize: 10)
        timeLable.textColor = UIColor.darkGray
        self.addSubview(timeLable)
        
        titleLable = UILabel.init(frame: CGRect.init(x: 10, y: headerImageView.frame.maxY + 5, width: ScreenWidth - 20 , height: 20))
        titleLable.font = UIFont.systemFont(ofSize: 14)
        titleLable.textColor = UIColor.darkText
        self.addSubview(titleLable)
        
        contentLable = UILabel.init(frame: CGRect.init(x: 10, y: titleLable.frame.maxY + 5, width: ScreenWidth - 20 , height: 20))
        contentLable.font = UIFont.systemFont(ofSize: 12)
        contentLable.textColor = UIColor.darkGray
        contentLable.numberOfLines = 2
        self.addSubview(contentLable)
        
        imagesView = CustomerImagesView.init(frame: CGRect.init(x: 10, y: contentLable.frame.maxY + 5, width: ScreenWidth - 20, height: 50))
        imagesView.backgroundColor = UIColor.white
        imagesView.isHidden = true

        self.addSubview(imagesView)



    }
    
    func updateSessionLiseCell(model:SessionTopicModel) {
        self.imageURL.removeAll()
        
        let userDict = model.user! as NSDictionary
        nameLable.text = userDict["nickName"] as? String
        let headUrl = NSURL.init(string: (userDict["avatar"] as? String)!)
        headerImageView.af_setImage(withURL: headUrl as! URL)
        titleLable.text = model.title
        contentLable.frame = CGRect.init(x: contentLable.frame.origin.x, y: contentLable.frame.origin.y, width: contentLable.frame.width, height: self.getContentLabelHeight(contentString: model.content!))
       imagesView.frame = CGRect.init(x: 10, y: contentLable.frame.maxY + 5, width: ScreenWidth - 20, height: 50)
        contentLable.text = model.content
        if (model.imageList?.count)! > 0 {
            imagesView.isHidden = false
            for (_,value) in (model.imageList?.enumerated())! {
                let dict  = value as! NSDictionary
                let imageUrlString = dict["fileUrl"] as? String ?? ""
                self.imageURL.append(imageUrlString)

            }
            imagesView.updateImagsView(imagesUrl: imageURL)

        }else{
            imagesView.isHidden = true
        }

    }
    
    func getSessionListCellHeight(model:SessionTopicModel) -> CGFloat {
        var height = 0
        if (model.imageList?.count)! > 0 {
            height = 120
        }
        let contentString = model.content
        
        return CGFloat(height) + self.getContentLabelHeight(contentString: contentString!)
    }
    
    func getContentLabelHeight(contentString:String) -> CGFloat {
        let string1 = contentString as NSString
        let size = string1.size(attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 12)])
        let contentLableHeight = Int(size.width)/Int(contentLable.frame.width)
        if contentLableHeight > 1 {
            return CGFloat(2 * 20)
        }else{
            return CGFloat((contentLableHeight + 1) * 20)

        }
    }

}
