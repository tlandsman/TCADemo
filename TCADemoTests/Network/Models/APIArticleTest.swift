import Foundation
import Testing

@testable import TCADemo

struct APIArticleTest {
    
    @Test func test_APIArticle_Decoding() async throws {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        let result = try jsonDecoder.decode(APIArticle.self, from: jsonData)
        
        
        let expectedDateComponents = DateComponents(
            calendar: Calendar(identifier: .gregorian),
            timeZone: TimeZone(secondsFromGMT: -4 * 3600),
            year: 2025,
            month: 5,
            day: 20,
            hour: 7,
            minute: 23,
            second: 46
        )

        let expectedDate = expectedDateComponents.date!
        
        #expect(result.title == "Israel’s Allies Condemn Expansion of Gaza War")
        #expect(result.byline == "By Aaron Boxerman and Stephen Castle")
        #expect(result.createdDate == expectedDate)
    }
}

private let jsonData = """
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
        }
    """.data(using: .utf8)!
