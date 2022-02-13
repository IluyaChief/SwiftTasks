
import Foundation

struct City {
    let name: String
    let imagePath: String
    let description : String
    
    static let bestCities = [City(name: "California, USA", imagePath: "California", description:                                 "California, located in the western United States, stretches                                    along the Pacific Ocean from the border with the state of Oregon                                to the Mexican border for almost 1,400 km. Its terrain is very                                  diverse: there are cliff-ringed beaches, sequoia forests, the                                   Sierra Nevada mountains, the agricultural lands of the                                          California Valley and the Mojave Desert. The most interesting                                   area for tourists in Los Angeles is Hollywood, the capital of                                   the American film industry. The city of San Francisco has gained                                worldwide fame for the Golden Gate Bridge, Alcatraz Island and                                  the cable car"),
                             City(name: "Wien, Austria", imagePath: "Wien", description: "Vienna is the capital of Austria, located in the eastern part of the country on the Danube River. Such famous residents as V.A. Mozart, L. Beethoven and Z. Freud. Vienna is also famous for its imperial palaces, among which Schönbrunn is the summer residence of the Habsburg dynasty. And in the Museum Quarter area, in historical and modern buildings, works by artists such as E. Schiele and G. Klimt are collected"),
                             City(name: "Zuric, Switzerland", imagePath: "Zuric", description:     "Zurich is the world center of finance and banking, located north of Lake Zurich in northern Switzerland. On both sides of the river Limmat, on which the city stands, are the streets of the Altstadt (old town) from the time before the Middle Ages. The Limmatkuai Promenade and other promenades lead to the 17th century City Hall"),
                             City(name: "Munchen, Germany", imagePath: "Munchen", description:
                             "Munich is the capital of the federal state of Bavaria. This city has many museums and old buildings. It is known worldwide for its annual Oktoberfest and beer gardens, including the Hofbräuhaus, founded in 1589. Marienplatz, the city's central square, is home to a number of attractions, including the New Town Hall, an imposing neo-Gothic building. The chimes of the town hall play scenes from the city life of the 16th century"),
                             City(name: "Copenhagen, Denmark", imagePath: "Copenhagen", description:
                            "Copenhagen, the capital of Denmark, is located on the offshore islands of Zeeland and Amager and is connected to the southern Swedish city of Malmö via the resund Bridge. In Indre By, the historical center of the city, it is worth visiting the Frederiksstaden district, where you can see buildings from the 18th century. in the Rococo style and the royal palace of Amalienborg. Nearby are Christiansborg Palace and Renaissance-style Rosenborg Castle, surrounded by gardens and home to the royal jewels.")]
    
    static let coolCities = [City(name: "Moscow, Russia", imagePath: "Moscow", description:
                            "Moscow is the capital of Russia, a cosmopolitan city on the Moskva River in the western part of the country. In its historical center is the medieval fortress of the Kremlin - the residence of the Russian president. On its territory you can visit the Armory, where precious items that belonged to the royal family are exhibited. Behind the northeastern wall of the Kremlin lies Red Square, the symbolic center of Russia. Here you can see the Mausoleum of V. I. Lenin, the State Historical Museum and St. Basil's Cathedral with colorful onion domes"),
                            City(name: "Kyiv, Ukraine", imagePath: "Kyiv", description:
                            "Kiev is the capital of Ukraine, located on the Dnieper River. The city is famous for its monuments of religious architecture and historical museums. The Kiev-Pechersk Lavra of the 11th century is a monastery and a center of pilgrimage. Several churches crowned with golden domes rise on its territory. This architectural complex is famous for its underground passages leading to the tombs of Orthodox monks and a collection of gold items from Scythian times."),
                            City(name: "Minsk, Belarus", imagePath: "Minsk", description:
                            "Minsk is the capital of Belarus, the administrative center of the Minsk region and the Minsk region, which it does not belong to, since it is an independent administrative-territorial unit with a special status. The largest transport hub, political, economic, cultural and scientific center of the country"),
                            City(name: "Bucharest, Romania", imagePath: "Bucharest", description:
                            "Bucharest is the capital and commercial center of Romania, located in the south of the country. The city's main attraction is the colossal 1,100-room Parliament Palace, built during the communist period. The nearby historical district of Lipskany is popular with tourists for its lively nightlife, the small Stavropoleos Orthodox Church, and the 15th-century Princely Palace (Kurtya Domniaska), from which Vlad III the Impaler ruled the country."),
                            City(name: "Dublin, Ireland", imagePath: "Dublin", description:
                            "Dublin, the capital of the Republic of Ireland, is located on the east coast of the island of Ireland, at the mouth of the River Liffey. Among its historical buildings are Dublin Castle, built in the 13th century, and the majestic St. Patrick's Cathedral, which dates back to 1191. The city has wonderful parks, such as the picturesque St. Stephen's Park and the huge Phoenix Park. On the territory of the second is the Dublin Zoo. You can get acquainted with the history and culture of the country at the National Museum of Ireland")]
    
    static var randomCities: City {
        coolCities.randomElement()!
    }
}

extension City: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(imagePath)
        hasher.combine(description)
    }
}
