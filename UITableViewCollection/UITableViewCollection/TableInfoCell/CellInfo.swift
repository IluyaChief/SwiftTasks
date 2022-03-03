
import Foundation

struct Hero {
    var name: String
    var imagePath: String
    var description: String
    var urlString: String
    static var sectionHero = ["Best Carry", "Best Midlaner", "Best Support"]
    static let midlaner = [
        Hero(name: "Windranger", imagePath: "Windranger", description: "Windranger is a ranged hero whose main attribute is the Intelligence attribute. She has four abilities, each of which is active. The first ability, Shackleshot, binds the target to an enemy creature or tree behind",
             urlString: "http://dota2-i.ru/assets/images/resources/1607/wr-(9).jpg"),
        Hero(name: "Invoker", imagePath: "Invoker", description: "Invoker is a ranged attack type hero whose main attribute is the Intelligence attribute. This is the only hero in the game with 10 abilities plus 3 orbs and an ultimate ability.",
             urlString: "http://dota2-i.ru/assets/images/resources/1597/inv-(10).jpg"
        ),
        Hero(name: "Lina", imagePath: "Lina", description: "Lina is a ranged hero whose main attribute is the Intelligence attribute. This hero is great for causing considerable damage to the enemy, because thanks to her abilities, Lina can both stun the enemy and deal devastating damage.",
             urlString: "http://dota2-i.ru/assets/images/resources/1619/ln-(13).jpg"),
        Hero(name: "Zeus", imagePath: "Zeus", description: "Zeus is a ranged hero whose main attribute is the Intelligence attribute. He has four abilities, three of which are active and one is passive. His first ability, Arc Lightning, throws lightning that jumps from one enemy to another, dealing damage to each enemy hit. Lightning Bolt's second ability strikes the enemy with lightning, dealing damage and briefly stunning.",
             urlString: "http://dota2-i.ru/assets/images/resources/1695/1920x1080-2040203-zeus-dota-2-wallpaper-hd.jpg")]
    static let carry = [
        Hero(name: "Ursa", imagePath: "Ursa", description: "Ursa is a melee hero whose main attribute is Agility attribute Agility. With her first ability, Earthshock, Ursa slams into the ground, damaging all nearby enemy units and slowing them down. The second ability, Overpower, Ursa increases attack speed for the next few attacks. The passive ability, Fury Swipes, allows Ursa to deal increased damage with each successive attack.",
             urlString: "http://dota2-i.ru/assets/images/resources/1687/1600x900-2042526-ursa-dota-2-wallpaper-hd.jpg"),
        Hero(name: "Sniper", imagePath: "Sniper", description: "Sniper is a ranged attack type hero whose main attribute is Agility attribute. His first ability, Shrapnel, uses a burst of shrapnel, raining explosive shot at the target area. Enemies below it are slowed down and damaged.",
             urlString: "http://dota2-i.ru/assets/images/resources/1676/2560x1440-2042340-sniper-dota-2-wallpaper-hd.jpg"),
        Hero(name: "Medusa", imagePath: "Medusa", description: "Medusa is a ranged hero whose main attribute is Agility attribute. The first ability, Split Shot, splits Medusa's shot into several arrows. These arrows deal less damage compared to her basic attack. Secondary targets are not affected by attack effects (such as critical damage) or unique attack modifiers. The second ability, Mystic Snake, Medusa throws a snake that jumps from target to target, dealing damage and stealing mana.",
             urlString: "http://dota2-i.ru/assets/images/resources/1652/1366x768-2042807-medusa-dota-2-wallpaper-hd.jpg"),
        Hero(name: "Phantom Lancer", imagePath: "Phantom", description: "Phantom Lancer is a melee hero whose main attribute is Agility attribute. His first ability, Spirit Lance, hurls a magical spear at the enemy that damages and slows the target, and creates an allied illusion that attacks them. The second ability, Doppelganger, causes Phantom Lancer to briefly disappear from the battlefield. After a second, he, all his illusions nearby, and two new illusions appear at random points in the specified area.",
             urlString: "http://dota2-i.ru/assets/images/resources/1663/1920x1080-2041666-phantom-lancer-dota-2-wallpaper.jpg")]
    static let support = [
        Hero(name: "Silencer", imagePath: "Silencer", description: "Silencer is a ranged attack type hero whose main attribute is the Intelligence attribute. This hero is the only hero that steals intelligence when killing an enemy. Theft of intelligence is an integral part of the hero. Arcane Curse causes the enemy hero to lose health for a fairly short amount of time, but it increases with each ability used and pauses when the target is silenced.",
             urlString: "http://dota2-i.ru/assets/images/resources/1673/1600x900-2041530-silencer-dota-2-wallpaper-hd.jpg"),
        Hero(name: "Lion", imagePath: "Lion", description: "Lion is a ranged hero whose main attribute is the Intelligence attribute. The first ability, Earth Spike, shoots stone spikes from the ground in front of you. Enemies will be knocked into the air and then stunned and take fall damage",
             urlString: "http://dota2-i.ru/assets/images/resources/1648/81.jpg"),
        Hero(name: "Jakiro", imagePath: "Jakiro", description: "Jakiro is a ranged hero whose main attribute is the Intelligence attribute. The hero with his abilities can quickly deal a lot of damage in the early and mid game. With Dual Breath, the hero first emits an icy breath, which slows the enemy, and then a fiery one, which in turn deals damage.",
             urlString: "http://dota2-i.ru/assets/images/resources/1643/10.jpg"),
        Hero(name: "Rubick", imagePath: "Rubick", description: "Rubick - Great Mage, a hero with a ranged attack type, whose main attribute is Intelligence attribute intelligence. He gained his fame thanks to his specific special ability, which steals the last used spell of an enemy hero. This gives him the opportunity to be a very versatile hero.",
             urlString: "http://dota2-i.ru/assets/images/resources/1668/1600x900-2041195-rubick-dota-2-wallpaper-hd.jpg")
    ]
}
extension Hero: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(imagePath)
        hasher.combine(description)
    }
}
