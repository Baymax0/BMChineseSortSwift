# BMChineseSort的Swift版本
- `BMChineseSort`是一个为模型、字典、字符串数组。对于多音字的问题，开放了一个映射属性，可手动修改个别多音字或你想要的映射关系。
- 支持SPM导入

### 目录
- [模型分组排序](#0)
- [普通排序（不分组）](#1)
- [汉字转拼音](#2)
- [参数设置](#3)

<h2 id="0"> </h2>

### 模型分组排序

现有Person对象数组，name为需要排序的比较字段

```swift
class Person: NSObject {
    var name:String!
    var number:Int!
}
```

对模型数组dataArr进行分组排序
```swift
BMChineseSort.sortAndGroup(objectArray: dataArr, key: "name") { (isSuccess, _, titleArr, objArr) in
    if isSuccess{
        self.firstLetterArray = titleArr
        self.sortedModelArr = objArr
        self.tableView.reloadData()
    }
}
```

使用排序结果
```swift
// MARK: - Table view data source
func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return firstLetterArray[section]
}
func numberOfSections(in tableView: UITableView) -> Int {
    return firstLetterArray.count
}
func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    return firstLetterArray
}
func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
    return index
}
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.sortedModelArr[section].count
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    let p = self.sortedModelArr[indexPath.section][indexPath.row]
    cell!.textLabel?.text = p.name
    return cell!
}
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let p = self.sortedModelArr[indexPath.section][indexPath.row]
    print(p.name ?? "", p.number ?? "")
}
```



<h2 id="1"> </h2>

### 普通排序（不分组）
通过sortAndGroup方法的回调中的 unGroupedArr 获得未分组的结果


<h2 id="2"> </h2>

### 汉字转拼音

中文对应拼音，保留英文的大小写，拼音转化的字母为小写
```swift
// 返回“Ad gai nai”
let string = BMChineseSort.transformChinese("Ad钙奶")
```


<h2 id="3"> </h2>

### 排序中参数设置
设置修改方式

```swift
//为多音字手动映射
BMChineseSort.share.polyphoneMapping["长安"] = "CA"
```
提供设置的属性列表

属性|默认值|描述
-|-|-
sortMode| 2 | 排序所用方法，1 使用CFStringTransform，2使用汉字码表
compareTpye| .initial | 拼音比对方式。(全拼音 和 首字母)，默认首字母，全拼模式sortMode会强制=1
logEable| YES |是否开启打印
specialCharSectionTitle| “#” |特殊字符最后单独分组所用的分组名称
specialCharPositionIsFront| YES |特殊字符所在位置 YES = 开头，NO = 结尾
ignoreModelWithPrefix| “” |剔除 特定字符开头的对象
polyphoneMapping| 字典 | 多音字手动映射



