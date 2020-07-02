//
//  BMChineseSort.swift
//  
//
//  Created by Baymax on 2018/10/29.
//  Copyright © 2018 Baymax. All rights reserved.
//

import Foundation

/// 开放的两个方法
public protocol BMChineseSortProtocol {
    
    /// 中文对应拼音  eg:"Ad钙奶" -> "Ad gai nai"  结果英文不变 拼音小写
    ///
    /// - Parameter word: 中文字符串
    /// - Returns: 拼音
    static func transformChinese(_ word:String) -> String
    
    /// 排序
    ///
    /// - Parameters:
    ///   - objectArray: 需要排序的数组
    ///   - key: 需要排序的字段，字符串数组传nil
    ///   - finish: 排序后回调
    static func sortAndGroup<T>( objectArray:Array<T>?,
                                 key:String?,
                                 finish: @escaping (_ success:Bool, _ unGroupedArr:Array<T>, _ sectionTitleArr:Array<String>, _ sortedObjArr:Array<Array<T>>) ->() )
}

/// 排序的拼音比较类型枚举
public enum BMChineseSortType {
    /// 全拼音
    case fullPinyin
    /// 拼音首字母
    case initial
}

/// 默认属性修改 通过BMChineseSort.share().property = ** 修改
public class BMChineseSort {
    
    //    sortMode = 1 使用原生CFStringTransform 方法转换，比较耗时。全拼音必须使用此设置！
    //    sortMode = 2 使用汉字码表对应的首字母码表 通过编码顺序查找 比较快
    //    码表来源于网络 不保证准确性（除了多音字没发现有错误），可以码表配合polyphoneMapping手动修改想要的映射
    /// 转拼音的方式 默认 用码表
    public var sortMode:Int = 2
    
    /// 默认比较首字母 如果用 fullPinyin sortMode强制为1 因为码表仅为首字母
    public var compareTpye:BMChineseSortType = .initial

    /// 是否打印所用时间
    public var logEable:Bool = true
    
    /// 特殊字符最后单独分组所用的 分组名称
    public var specialCharSectionTitle:String = "#"
    
    /// 特殊字符所在 位置 YES = 开头，NO = 结尾
    public var specialCharPositionIsFront:Bool = true
    
    /// 剔除 特定字符开头的对象，不出现在最终结果集中 不要与 specialCharSectionTitle 冲突
    /// eg: 过滤所有数字开的对象  ignoreModelWithPrefix = "0123456789"
    public var ignoreModelWithPrefix:String = ""
    
    /// 手动映射多音字，key = 中文，value = 对应首字母
    public var polyphoneMapping = ["重庆":"CQ",
                            "厦门":"XM",
                            "长":"C",
                            "沈":"S",]
    
    public static var share: BMChineseSort = BMChineseSort()
    
    // 信号量
    var semaphore = DispatchSemaphore(value: 1)
}




