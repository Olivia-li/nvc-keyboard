//
//  EmojiCategory.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-05-05.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This enum contains the emoji categories that the native iOS
 emoji keyboard currently has.
 
 In native iOS keyboards, emojis flow from top to bottom and
 from leading to trailing. These lists use this flow as well. 
 
 Since the `frequent` category should list the most frequent
 emojis, you can now register a static `recentEmojiProvider`.
 By default, a `MostRecentEmojiProvider` will be used.
*/
public enum EmojiCategory: String, CaseIterable, Codable, EmojiProvider, Identifiable, Equatable {

    case
    frequent,
    smileys,
    animals,
    foods,
    activities,
    travels,
    objects,
    symbols,
    flags
    
    public static var frequentEmojiProvider: FrequentEmojiProvider = MostRecentEmojiProvider()
}

public extension EmojiCategory {

    /**
     An ordered list of all available categories.
     */
    static var all: [EmojiCategory] { allCases }
}

public extension Collection where Element == EmojiCategory {

    /**
     An ordered list of all available categories.
     */
    static var all: [EmojiCategory] { EmojiCategory.allCases }

}

public extension EmojiCategory {
    
    /**
     The category's unique identifier.
     */
    var id: String { rawValue }
    
    /**
     An ordered list with all emojis in the category.
     */
    var emojis: [Emoji] {
        emojisString
            .replacingOccurrences(of: "\n", with: "")
            .compactMap { Emoji(String($0)) }
    }
    
    /**
     An ordered string with all emojis in the category.
     */
    var emojisString: String {
        switch self {
        case .frequent: return Self.frequentEmojiProvider.emojis.map { $0.char }.joined(separator: "")
        case .smileys: return """
😀😃😄😁😆🥹😅😂🤣🥲
☺️😊😇🙂🙃😉😌😍🥰😘
😗😙😚😋😛😝😜🤪🤨🧐
🤓😎🥸🤩🥳😏😒😞😔😟
😕🙁☹️😣😖😫😩🥺😢😭
😤😠😡🤬🤯😳🥵🥶😶‍🌫️😱
😨😰😥😓🤗🤔🫣🤭🫢🫡
🤫🫠🤥😶🫥😐🫤😑😬🙄
😯😦😧😮😲🥱😴🤤😪😮‍💨
😵😵‍💫🤐🥴🤢🤮🤧😷🤒🤕
🤑🤠😈👿👹👺🤡💩👻💀
☠️👽👾🤖🎃😺😸😹😻😼
😽🙀😿😾🫶🤲👐🙌👏🤝
👍👎👊✊🤛🤜🤞✌️🫰🤟
🤘👌🤌🤏🫳🫴👈👉👆👇
☝️✋🤚🖐🖖👋🤙🫲🫱💪
🦾🖕✍️🙏🫵🦶🦵🦿💄💋
👄🫦🦷👅👂🦻👃👣👁👀
🫀🫁🧠🗣👤👥🫂👶👧🧒
👦👩🧑👨👩‍🦱🧑‍🦱👨‍🦱👩‍🦰🧑‍🦰👨‍🦰
👱‍♀️👱👱‍♂️👩‍🦳🧑‍🦳👨‍🦳👩‍🦲🧑‍🦲👨‍🦲🧔‍♀️
🧔🧔‍♂️👵🧓👴👲👳‍♀️👳👳‍♂️🧕
👮‍♀️👮👮‍♂️👷‍♀️👷👷‍♂️💂‍♀️💂💂‍♂️🕵️‍♀️
🕵️🕵️‍♂️👩‍⚕️🧑‍⚕️👨‍⚕️👩‍🌾🧑‍🌾👨‍🌾👩‍🍳🧑‍🍳
👨‍🍳👩‍🎓🧑‍🎓👨‍🎓👩‍🎤🧑‍🎤👨‍🎤👩‍🏫🧑‍🏫👨‍🏫
👩‍🏭🧑‍🏭👨‍🏭👩‍💻🧑‍💻👨‍💻👩‍💼🧑‍💼👨‍💼👩‍🔧
🧑‍🔧👨‍🔧👩‍🔬🧑‍🔬👨‍🔬👩‍🎨🧑‍🎨👨‍🎨👩‍🚒🧑‍🚒
👨‍🚒👩‍✈️🧑‍✈️👨‍✈️👩‍🚀🧑‍🚀👨‍🚀👩‍⚖️🧑‍⚖️👨‍⚖️
👰‍♀️👰👰‍♂️🤵‍♀️🤵🤵‍♂️👸🫅🤴🥷
🦸‍♀️🦸🦸‍♂️🦹‍♀️🦹🦹‍♂️🤶🧑‍🎄🎅🧙‍♀️
🧙🧙‍♂️🧝‍♀️🧝🧝‍♂️🧌🧛‍♀️🧛🧛‍♂️🧟‍♀️
🧟🧟‍♂️🧞‍♀️🧞🧞‍♂️🧜‍♀️🧜🧜‍♂️🧚‍♀️🧚
🧚‍♂️👼🤰🫄🫃🤱👩‍🍼🧑‍🍼👨‍🍼🙇‍♀️
🙇🙇‍♂️💁‍♀️💁💁‍♂️🙅‍♀️🙅🙅‍♂️🙆‍♀️🙆
🙆‍♂️🙋‍♀️🙋🙋‍♂️🧏‍♀️🧏🧏‍♂️🤦‍♀️🤦🤦‍♂️
🤷‍♀️🤷🤷‍♂️🙎‍♀️🙎🙎‍♂️🙍‍♀️🙍🙍‍♂️💇‍♀️
💇💇‍♂️💆‍♀️💆💆‍♂️🧖‍♀️🧖🧖‍♂️💅🤳
💃🕺👯‍♀️👯👯‍♂️🕴👩‍🦽🧑‍🦽👨‍🦽👩‍🦼
🧑‍🦼👨‍🦼🚶‍♀️🚶🚶‍♂️👩‍🦯🧑‍🦯👨‍🦯🧎‍♀️🧎
🧎‍♂️🏃‍♀️🏃🏃‍♂️🧍‍♀️🧍🧍‍♂️👫👭👬
👩‍❤️‍👨👩‍❤️‍👩💑👨‍❤️‍👨👩‍❤️‍💋‍👨👩‍❤️‍💋‍👩💏👨‍❤️‍💋‍👨👨‍👩‍👦👨‍👩‍👧
👨‍👩‍👧‍👦👨‍👩‍👦‍👦👨‍👩‍👧‍👧👩‍👩‍👦👩‍👩‍👧👩‍👩‍👧‍👦👩‍👩‍👦‍👦👩‍👩‍👧‍👧👨‍👨‍👦👨‍👨‍👧
👨‍👨‍👧‍👦👨‍👨‍👦‍👦👨‍👨‍👧‍👧👩‍👦👩‍👧👩‍👧‍👦👩‍👦‍👦👩‍👧‍👧👨‍👦👨‍👧
👨‍👧‍👦👨‍👦‍👦👨‍👧‍👧🪢🧶🧵🪡🧥🥼🦺
👚👕👖🩲🩳👔👗👙🩱👘
🥻🩴🥿👠👡👢👞👟🥾🧦
🧤🧣🎩🧢👒🎓⛑🪖👑💍
👝👛👜💼🎒🧳👓🕶🥽🌂
"""
        case .animals: return """
🐶🐱🐭🐹🐰🦊🐻🐼🐻‍❄️🐨
🐯🦁🐮🐷🐽🐸🐵🙈🙉🙊
🐒🐔🐧🐦🐤🐣🐥🦆🦅🦉
🦇🐺🐗🐴🦄🐝🪱🐛🦋🐌
🐞🐜🪰🪲🪳🦟🦗🕷🕸🦂
🐢🐍🦎🦖🦕🐙🦑🦐🦞🦀
🐡🐠🐟🐬🐳🐋🦈🦭🐊🐅
🐆🦓🦍🦧🦣🐘🦛🦏🐪🐫
🦒🦘🦬🐃🐂🐄🐎🐖🐏🐑
🦙🐐🦌🐕🐩🦮🐕‍🦺🐈🐈‍⬛🪶
🐓🦃🦤🦚🦜🦢🦩🕊🐇🦝
🦨🦡🦫🦦🦥🐁🐀🐿🦔🐾
🐉🐲🌵🎄🌲🌳🌴🪵🌱🌿
☘️🍀🎍🪴🎋🍃🍂🍁🪺🪹
🍄🐚🪸🪨🌾💐🌷🌹🥀🪷
🌺🌸🌼🌻🌞🌝🌛🌜🌚🌕
🌖🌗🌘🌑🌒🌓🌔🌙🌎🌍
🌏🪐💫⭐️🌟✨⚡️☄️💥🔥
🌪🌈☀️🌤⛅️🌥☁️🌦🌧⛈
🌩🌨❄️☃️⛄️🌬💨💧💦🫧
☔️☂️🌊🌫
"""
        case .foods: return """
🍏🍎🍐🍊🍋🍌🍉🍇🍓🫐
🍈🍒🍑🥭🍍🥥🥝🍅🍆🥑
🥦🥬🥒🌶🫑🌽🥕🫒🧄🧅
🥔🍠🥐🥯🍞🥖🥨🧀🥚🍳
🧈🥞🧇🥓🥩🍗🍖🦴🌭🍔
🍟🍕🫓🥪🥙🧆🌮🌯🫔🥗
🥘🫕🥫🫙🍝🍜🍲🍛🍣🍱
🥟🦪🍤🍙🍚🍘🍥🥠🥮🍢
🍡🍧🍨🍦🥧🧁🍰🎂🍮🍭
🍬🍫🍿🍩🍪🌰🥜🫘🍯🥛
🫗🍼🫖☕️🍵🧃🥤🧋🍶🍺
🍻🥂🍷🥃🍸🧉🍹🍾🧊🥄
🍴🍽🥣🥡🥢🧂
"""
        case .activities: return """
⚽️🏀🏈⚾️🥎🎾🏐🏉🥏🎱
🪀🏓🏸🏒🏑🥍🏏🪃🥅⛳️
🪁🛝🏹🎣🤿🥊🥋🎽🛹🛼
🛷⛸🥌🎿⛷🏂🪂🏋️‍♀️🏋️🏋️‍♂️
🤼‍♀️🤼🤼‍♂️🤸‍♀️🤸🤸‍♂️⛹️‍♀️⛹️⛹️‍♂️🤺
🤾‍♀️🤾🤾‍♂️🏌️‍♀️🏌️🏌️‍♂️🏇🧘‍♀️🧘🧘‍♂️
🏄‍♀️🏄🏄‍♂️🏊‍♀️🏊🏊‍♂️🤽‍♀️🤽🤽‍♂️🚣‍♀️
🚣🚣‍♂️🧗‍♀️🧗🏻🧗‍♂️🚵‍♀️🚵🚵‍♂️🚴‍♀️🚴
🚴‍♂️🏆🥇🥈🥉🏅🎖🏵🎗🎫
🎟🎪🤹‍♀️🤹🤹‍♂️🎭🩰🎨🎬🎤
🎧🎼🎹🥁🪘🎷🎺🪗🎸🪕
🎻🎲♟🎯🎳🎮🎰🧩
"""
        case .travels: return """
🚗🚕🚙🚌🚎🏎🚓🚑🚒🚐
🛻🚚🚛🚜🦯🦽🦼🩼🛴🚲
🛵🏍🛺🛞🚨🚔🚍🚘🚖🚡
🚠🚟🚃🚋🚞🚝🚄🚅🚈🚂
🚆🚇🚊🚉✈️🛫🛬🛩💺🛰
🚀🛸🚁🛶⛵️🚤🛥🛳⛴🚢
🛟⚓️🪝⛽️🚧🚦🚥🚏🗺🗿
🗽🗼🏰🏯🏟🎡🎢🎠⛲️⛱
🏖🏝🏜🌋⛰🏔🗻🏕⛺️🛖
🏠🏡🏘🏚🏗🏭🏢🏬🏣🏤
🏥🏦🏨🏪🏫🏩💒🏛⛪️🕌
🕍🛕🕋⛩🛤🛣🗾🎑🏞🌅
🌄🌠🎇🎆🌇🌆🏙🌃🌌🌉
🌁
"""
        case .objects: return """
⌚️📱📲💻⌨️🖥🖨🖱🖲🕹
🗜💽💾💿📀📼📷📸📹🎥
📽🎞📞☎️📟📠📺📻🎙🎚
🎛🧭⏱⏲⏰🕰⌛️⏳📡🔋
🔌💡🔦🕯🪔🧯🗑🛢💸💵
💴💶💷🪙💰💳🪪💎⚖️🪜
🧰🪛🔧🔨⚒🛠⛏🪚🔩⚙️
🪤🧱⛓🧲🔫💣🧨🪓🔪🗡
⚔️🛡🚬⚰️🪦⚱️🏺🔮📿🧿
🪬💈⚗️🔭🔬🕳🩻🩹🩺💊
💉🩸🧬🦠🧫🧪🌡🧹🪠🧺
🧻🚽🚰🚿🛁🛀🧼🪥🪒🧽
🪣🧴🛎🔑🗝🚪🪑🛋🛏🛌
🧸🪆🖼🪞🪟🛍🛒🎁🎈🎏
🎀🪄🪅🎊🎉🎎🏮🎐🪩🧧
✉️📩📨📧💌📥📤📦🏷🪧
📪📫📬📭📮📯📜📃📄📑
🧾📊📈📉🗒🗓📆📅🗑📇
🗃🗳🗄📋📁📂🗂🗞📰📓
📔📒📕📗📘📙📚📖🔖🧷
🔗📎🖇📐📏🧮📌📍✂️🖊
🖋✒️🖌🖍📝✏️🔍🔎🔏🔐
🔒🔓
"""
        case .symbols: return """
❤️🧡💛💚💙💜🖤🤍🤎💔
❤️‍🔥❤️‍🩹❣️💕💞💓💗💖💘💝
💟☮️✝️☪️🕉☸️✡️🔯🕎☯️
☦️🛐⛎♈️♉️♊️♋️♌️♍️♎️
♏️♐️♑️♒️♓️🆔⚛️🉑☢️☣️
📴📳🈶🈚️🈸🈺🈷️✴️🆚💮
🉐㊙️㊗️🈴🈵🈹🈲🅰️🅱️🆎
🆑🅾️🆘❌⭕️🛑⛔️📛🚫💯
💢♨️🚷🚯🚳🚱🔞📵🚭❗️
❕❓❔‼️⁉️🔅🔆〽️⚠️🚸
🔱⚜️🔰♻️✅🈯️💹❇️✳️❎
🌐💠Ⓜ️🌀💤🏧🚾♿️🅿️🛗
🈳🈂️🛂🛃🛄🛅🚹🚺🚼⚧
🚻🚮🎦📶🈁🔣ℹ️🔤🔡🔠
🆖🆗🆙🆒🆕🆓0️⃣1️⃣2️⃣3️⃣
4️⃣5️⃣6️⃣7️⃣8️⃣9️⃣🔟🔢#️⃣*️⃣
⏏️▶️⏸⏯⏹⏺⏭⏮⏩⏪
⏫⏬◀️🔼🔽➡️⬅️⬆️⬇️↗️
↘️↙️↖️↕️↔️↪️↩️⤴️⤵️🔀
🔁🔂🔄🔃🎵🎶➕➖➗✖️
🟰♾️💲💱™️©️®️👁‍🗨🔚🔙
🔛🔝🔜〰️➰➿✔️☑️🔘🔴
🟠🟡🟢🔵🟣⚫️⚪️🟤🔺🔻
🔸🔹🔶🔷🔳🔲▪️▫️◾️◽️
◼️◻️🟥🟧🟨🟩🟦🟪⬛️⬜️
🟫🔈🔇🔉🔊🔔🔕📣📢💬
💭🗯♠️♣️♥️♦️🃏🎴🀄️🕐
🕑🕒🕓🕔🕕🕖🕗🕘🕙🕚
🕛🕜🕝🕞🕟🕠🕡🕢🕣🕤
🕥🕦🕧
"""
        case .flags: return """
🏳️🏴🏴‍☠️🏁🚩🏳️‍🌈🏳️‍⚧️🇺🇳🇦🇫🇦🇱
🇩🇿🇻🇮🇦🇸🇦🇩🇦🇴🇦🇮🇦🇶🇦🇬🇦🇷🇦🇲
🇦🇼🇦🇺🇦🇿🇧🇸🇧🇭🇧🇩🇧🇧🇧🇪🇧🇿🇧🇯
🇧🇲🇧🇹🇧🇴🇧🇦🇧🇼🇧🇷🇻🇬🇧🇳🇧🇬🇧🇫
🇧🇮🇰🇾🇨🇫🇮🇴🇨🇱🇨🇴🇨🇰🇨🇷🇨🇼🇨🇾
🇨🇮🇩🇰🇩🇯🇩🇲🇩🇴🇪🇨🇪🇬🇬🇶🇸🇻🇪🇷
🇪🇪🇪🇹🇪🇺🇫🇰🇫🇯🇵🇭🇫🇮🇫🇷🇬🇫🇵🇫
🇹🇫🇫🇴🇦🇪🇬🇦🇬🇲🇬🇪🇬🇭🇬🇮🇬🇷🇬🇩
🇬🇱🇬🇵🇬🇺🇬🇹🇬🇬🇬🇳🇬🇼🇬🇾🇭🇹🇭🇳
🇭🇰🇮🇳🇮🇩🇮🇶🇮🇷🇮🇪🇮🇸🇮🇲🇮🇱🇮🇹
🇯🇲🇯🇵🎌🇾🇪🇯🇪🇯🇴🇨🇽🇰🇭🇨🇲🇨🇦
🇮🇨🇨🇻🇧🇶🇰🇿🇰🇪🇨🇳🇰🇬🇰🇮🇨🇨🇰🇲
🇨🇬🇨🇩🇽🇰🇭🇷🇨🇺🇰🇼🇱🇦🇱🇸🇱🇻🇱🇧
🇱🇷🇱🇾🇱🇮🇱🇹🇱🇺🇲🇴🇲🇬🇲🇼🇲🇾🇲🇻
🇲🇱🇲🇹🇲🇦🇲🇭🇲🇶🇲🇷🇲🇺🇾🇹🇲🇽🇫🇲
🇲🇿🇲🇩🇲🇨🇲🇳🇲🇪🇲🇸🇲🇲🇳🇦🇳🇷🇳🇱
🇳🇵🇳🇮🇳🇪🇳🇬🇳🇺🇰🇵🇲🇰🇲🇵🇳🇫🇳🇴
🇳🇨🇳🇿🇴🇲🇵🇰🇵🇼🇵🇸🇵🇦🇵🇬🇵🇾🇵🇪
🇵🇳🇵🇱🇵🇹🇵🇷🇶🇦🇷🇪🇷🇴🇷🇼🇷🇺🇧🇱
🇸🇭🇰🇳🇱🇨🇵🇲🇻🇨🇸🇧🇼🇸🇸🇲🇸🇹🇸🇦
🇨🇭🇸🇳🇷🇸🇸🇨🇸🇱🇸🇬🇸🇽🇸🇰🇸🇮🇸🇴
🇪🇸🇱🇰🇬🇧🏴󠁧󠁢󠁥󠁮󠁧󠁿🏴󠁧󠁢󠁳󠁣󠁴󠁿🏴󠁧󠁢󠁷󠁬󠁳󠁿🇸🇩🇸🇷🇸🇪🇸🇿
🇿🇦🇬🇸🇰🇷🇸🇸🇸🇾🇹🇯🇹🇼🇹🇿🇹🇩🇹🇭
🇨🇿🇹🇬🇹🇰🇹🇴🇹🇹🇹🇳🇹🇷🇹🇲🇹🇨🇹🇻
🇩🇪🇺🇬🇺🇦🇭🇺🇺🇾🇺🇸🇺🇿🇻🇺🇻🇦🇻🇪
🇻🇳🇧🇾🇪🇭🇼🇫🇿🇲🇿🇼🇦🇽🇦🇹🇹🇱
"""
        }
    }
    
    /**
     An ordered list with all emoji actions in the category.
     */
    var emojiActions: [KeyboardAction] {
        emojis.map { .emoji($0) }
    }
    
    /**
     The fallback emoji string that can be used by the emoji
     category if the app doesn't provide a custom image.
     */
    var fallbackDisplayEmoji: Emoji {
        switch self {
        case .frequent: return Emoji("🕓")
        case .smileys: return Emoji("😀")
        case .animals: return Emoji("🐻")
        case .foods: return Emoji("🍔")
        case .activities: return Emoji("⚽️")
        case .travels: return Emoji("🚗")
        case .objects: return Emoji("💡")
        case .symbols: return Emoji("💱")
        case .flags: return Emoji("🏳️")
        }
    }
    
    /**
     The English title for the category. You can use this if
     your extension only supports English.
     */
    var title: String {
        switch self {
        case .frequent: return "Frequently Used"
        case .smileys: return "Smileys & People"
        case .animals: return "Animals & Nature"
        case .foods: return "Food & Drink"
        case .activities: return "Activity"
        case .travels: return "Travel & Places"
        case .objects: return "Objects"
        case .symbols: return "Symbols"
        case .flags: return "Flags"
        }
    }
}
