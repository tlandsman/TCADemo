//
//  TopStoriesServiceTest.swift
//  TCADemo
//
//  Created by Tanya Landsman on 5/21/25.
//

import Testing
import Foundation

@testable import TCADemo

struct TopStoriesServiceTest {
    @Test
    func test_fetchTopStories_returnsArticlesForData() async throws {
        let stubbedResult: Result<(Data, URLResponse), Error> = .success((jsonData, .any))
        let httpClient = HTTPClientStub(result: stubbedResult)
        let sut = TopStoriesService(client: httpClient)
        let result = try await sut.fetchTopStories()
        
        #expect(result.count == 2)
    }
        
    
    
}



private extension URLResponse {
    static let any = HTTPURLResponse(url: .any, statusCode: 200, httpVersion: nil, headerFields: nil)!
}

private let jsonData = """
{
"results": [
        {
            "section": "world",
            "subsection": "middleeast",
            "title": "Israel’s Allies Condemn Expansion of Gaza War",
            "abstract": "Britain, France and Canada called the Israeli plans for escalation “disproportionate” and “egregious” at a time when the U.N. is warning the population is at risk of famine.",
            "url": "https://www.nytimes.com/2025/05/20/world/middleeast/israel-allies-denounce-gaza-offensive.html",
            "uri": "nyt://article/7f648287-bf0e-50b8-907b-27a8c31b3f0d",
            "byline": "By Aaron Boxerman and Stephen Castle",
            "item_type": "Article",
            "updated_date": "2025-05-20T14:25:39-04:00",
            "created_date": "2025-05-20T07:23:46-04:00",
            "published_date": "2025-05-20T07:23:46-04:00",
            "material_type_facet": "",
            "kicker": "",
            "des_facet": [
                "Israel-Gaza War (2023- )",
                "International Relations",
                "Politics and Government",
                "Defense and Military Forces",
                "Humanitarian Aid",
                "Refugees and Displaced Persons",
                "Palestinians"
            ],
            "org_facet": [],
            "per_facet": [
                "Netanyahu, Benjamin"
            ],
            "geo_facet": [
                "Gaza Strip",
                "Canada",
                "France",
                "Great Britain",
                "Israel"
            ],
            "multimedia": [
                {
                    "url": "https://static01.nyt.com/images/2025/05/20/multimedia/20int-israel-europeans-01-wmkg/20int-israel-europeans-01-wmkg-superJumbo.jpg",
                    "format": "Super Jumbo",
                    "height": 1365,
                    "width": 2048,
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Prime Minister Benjamin Netanyahu is threatening an Israeli takeover of Gaza and the forced relocation of Palestinian civilians into designated areas.",
                    "copyright": "Jack Guez/Agence France-Presse — Getty Images"
                },
                {
                    "url": "https://static01.nyt.com/images/2025/05/20/multimedia/20int-israel-europeans-01-wmkg/20int-israel-europeans-01-wmkg-threeByTwoSmallAt2X.jpg",
                    "format": "threeByTwoSmallAt2X",
                    "height": 400,
                    "width": 600,
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Prime Minister Benjamin Netanyahu is threatening an Israeli takeover of Gaza and the forced relocation of Palestinian civilians into designated areas.",
                    "copyright": "Jack Guez/Agence France-Presse — Getty Images"
                },
                {
                    "url": "https://static01.nyt.com/images/2025/05/20/multimedia/20int-israel-europeans-01-wmkg/20int-israel-europeans-01-wmkg-thumbLarge.jpg",
                    "format": "Large Thumbnail",
                    "height": 150,
                    "width": 150,
                    "type": "image",
                    "subtype": "photo",
                    "caption": "Prime Minister Benjamin Netanyahu is threatening an Israeli takeover of Gaza and the forced relocation of Palestinian civilians into designated areas.",
                    "copyright": "Jack Guez/Agence France-Presse — Getty Images"
                }
            ],
            "short_url": ""
        },
        {
            "section": "business",
            "subsection": "dealbook",
            "title": "Investors Are Jittery as G.O.P. Bill Threatens to Swell Deficit",
            "abstract": "Investors burned by President Trump’s trade fight now have to contend with a spending megabill that risks swelling the federal deficit.",
            "url": "https://www.nytimes.com/2025/05/20/business/dealbook/markets-trump-spending-tax-cuts.html",
            "uri": "nyt://article/cd5dacdb-1c31-5ae8-b7be-50bad81bb172",
            "byline": "By Andrew Ross Sorkin, Edmund Lee, Bernhard Warner, Sarah Kessler, Michael J. de la Merced, Lauren Hirsch and Danielle Kaye",
            "item_type": "Article",
            "updated_date": "2025-05-20T11:31:41-04:00",
            "created_date": "2025-05-20T07:45:25-04:00",
            "published_date": "2025-05-20T07:45:25-04:00",
            "material_type_facet": "",
            "kicker": "DealBook Newsletter",
            "des_facet": [
                "internal-storyline-no",
                "Stocks and Bonds",
                "Federal Budget (US)",
                "National Debt (US)",
                "Credit Ratings and Credit Rating Agencies",
                "Inflation (Economics)",
                "Interest Rates",
                "Protectionism (Trade)",
                "Customs (Tariff)"
            ],
            "org_facet": [
                "Treasury Department",
                "Federal Reserve System"
            ],
            "per_facet": [
                "Trump, Donald J",
                "Dimon, James"
            ],
            "geo_facet": [],
            "multimedia": [
                {
                    "url": "https://static01.nyt.com/images/2025/05/20/multimedia/20db-capitol-pvgm/20db-capitol-pvgm-superJumbo.jpg",
                    "format": "Super Jumbo",
                    "height": 1365,
                    "width": 2048,
                    "type": "image",
                    "subtype": "photo",
                    "caption": "America’s swelling federal deficit is unnerving global investors.",
                    "copyright": "Haiyun Jiang for The New York Times"
                },
                {
                    "url": "https://static01.nyt.com/images/2025/05/20/multimedia/20db-capitol-pvgm/20db-capitol-pvgm-threeByTwoSmallAt2X.jpg",
                    "format": "threeByTwoSmallAt2X",
                    "height": 400,
                    "width": 600,
                    "type": "image",
                    "subtype": "photo",
                    "caption": "America’s swelling federal deficit is unnerving global investors.",
                    "copyright": "Haiyun Jiang for The New York Times"
                },
                {
                    "url": "https://static01.nyt.com/images/2025/05/20/multimedia/20db-capitol-pvgm/20db-capitol-pvgm-thumbLarge.jpg",
                    "format": "Large Thumbnail",
                    "height": 150,
                    "width": 150,
                    "type": "image",
                    "subtype": "photo",
                    "caption": "America’s swelling federal deficit is unnerving global investors.",
                    "copyright": "Haiyun Jiang for The New York Times"
                }
            ],
            "short_url": ""
        }
]
}
""".data(using: .utf8)!
