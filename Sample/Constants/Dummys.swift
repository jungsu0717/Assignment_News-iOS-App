//
//  Dummys.swift
//  Sample
//
//  Created by Julian on 5/27/24.
//

import Foundation

struct Dummys {
    static let itemDetailDummy = ItemDetail(
        source: Source.getDummy(),
        author: "홍길동",
        title: "스팀 통계로 살펴보는, 현세대 PC 평균 스펙 - 게임메카",
        description: "PC 게이머들이 애용하는 스팀은 방대한 유저...",
        url: "https://www.gamemeca.com/view.php?gid=1749199",
        urlToImage: "https://cdn.gamemeca.com/gmdata/0001/749/199/gm234699_pc_sn.jpg",
        publishedAt: "2024-05-23T08:37:07Z",
        content: "내용"
    )
    
    static let itemModelDummy = ItemModel(status: "ok", totalCnt: 34, items: [ItemDetail.getDummy()])
    
    static let dummyImgUrl = "https://cdn.gamemeca.com/gmdata/0001/749/199/gm234699_pc_sn.jpg"
}
