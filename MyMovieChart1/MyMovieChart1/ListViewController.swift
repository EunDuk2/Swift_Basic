import UIKit
class ListViewController: UITableViewController {
    var dataset = [
        ("다크나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다", "2008-09-04", 8.95, "darknight.jpg"),
        ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31, "rain.jpg"),
        ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19, "secret.jpg")
    ]
    
    // 테이블 뷰를 구성할 리스트 데이터
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        for (title, desc, opendate, rating, thumbnail) in self.dataset {
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating
            mvo.thumnail = thumbnail
            
            datalist.append(mvo)
        }
        return datalist
    }()

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 주어진 행에 맞는 데이터 소스를 읽어온다.
        let row = self.list[indexPath.row]
        // 테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
////        cell.textLabel?.text = row.title
////
////        // 1 추가사항 : 서브타이틀에 데이터 연결
////        cell.detailTextLabel?.text = row.description
//
//        // 커스텀 셀 태그버전
//        // 영화제목이 표시될 레이블을 title 변수로 받음
//        let title = cell.viewWithTag(101) as? UILabel
//        // 영화요약이 표시될 레이블을 desc 변수로 받음
//        let desc = cell.viewWithTag(102) as? UILabel
//        // 영화 개봉일이 표시될 레이블을 opendate 변수로 받음
//        let opendate = cell.viewWithTag(103) as? UILabel
//        // 영화 별점이 표시될 레이블을 rating 변수로 받음
//        let rating = cell.viewWithTag(104) as? UILabel
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        // 데이터 소스에 저장된 값을 값 레이블 변수에 할당
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        cell.thumbnail.image = UIImage(named: row.thumnail!)
        NSLog("gd")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
    
    
}
