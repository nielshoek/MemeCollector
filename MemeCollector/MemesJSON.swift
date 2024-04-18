//
//  MemesJSON.swift
//  MemeCollector
//
//  Created by Niels Hoek on 25/02/2021.
//

import Foundation

// This can be used for testing and in case the API is offline.
struct MemesJSON {
    static let string = """
    {
    "count": 15,
    "memes": [
    {
      "postLink": "https://redd.it/ls458q",
      "subreddit": "me_irl",
      "title": "me_irl",
      "url": "https://i.redd.it/njirdjdmvlj61.png",
      "nsfw": false,
      "spoiler": false,
      "author": "DasMaennchen",
      "ups": 641,
      "preview": [
        "https://preview.redd.it/njirdjdmvlj61.png?width=108&crop=smart&auto=webp&s=14f96db37f1e83f4a42c158441682192f39f93df",
        "https://preview.redd.it/njirdjdmvlj61.png?width=216&crop=smart&auto=webp&s=ead859b47702de0909574e422a8965efa5e3021e",
        "https://preview.redd.it/njirdjdmvlj61.png?width=320&crop=smart&auto=webp&s=a20be97f215b969bd10caf6c845357e4869c7d2b",
        "https://preview.redd.it/njirdjdmvlj61.png?width=640&crop=smart&auto=webp&s=b590fae1e5c3241635f0223c1be92ad984bce1ad",
        "https://preview.redd.it/njirdjdmvlj61.png?width=960&crop=smart&auto=webp&s=edea3df1bf9191768baccb2d471dd1d4f45fd141",
        "https://preview.redd.it/njirdjdmvlj61.png?width=1080&crop=smart&auto=webp&s=8dd7e80ceffdb4dd533a6842df640309bde48e9f"
      ]
    },
    {
      "postLink": "https://redd.it/lsb7x8",
      "subreddit": "me_irl",
      "title": "Me_irl",
      "url": "https://i.redd.it/kg2pji47nnj61.jpg",
      "nsfw": false,
      "spoiler": false,
      "author": "mhmed197002",
      "ups": 185,
      "preview": [
        "https://preview.redd.it/kg2pji47nnj61.jpg?width=108&crop=smart&auto=webp&s=7b336ec4d7eab3a7023e3705e0719631df70fe3b",
        "https://preview.redd.it/kg2pji47nnj61.jpg?width=216&crop=smart&auto=webp&s=a65360651f0a3281031f39378e8b78931d4b4c67",
        "https://preview.redd.it/kg2pji47nnj61.jpg?width=320&crop=smart&auto=webp&s=90c20b50311812e526cc5e6702836a83c0b7ab73",
        "https://preview.redd.it/kg2pji47nnj61.jpg?width=640&crop=smart&auto=webp&s=8f52c424633466bfdc7857f57f4a28c6d9f0435a",
        "https://preview.redd.it/kg2pji47nnj61.jpg?width=960&crop=smart&auto=webp&s=7d7bebee5ac483c2eb399bd7a5a57670e04dbd8d",
        "https://preview.redd.it/kg2pji47nnj61.jpg?width=1080&crop=smart&auto=webp&s=d5cc4e98b42d6d9168657eed328f9385d172c214"
      ]
    },
    {
      "postLink": "https://redd.it/ls709a",
      "subreddit": "me_irl",
      "title": "Me_irl",
      "url": "https://i.redd.it/llhw32ccpmj61.jpg",
      "nsfw": false,
      "spoiler": false,
      "author": "mhmed197002",
      "ups": 73,
      "preview": [
        "https://preview.redd.it/llhw32ccpmj61.jpg?width=108&crop=smart&auto=webp&s=ad4552b421074ecfcec4e36a0128c3275b3b929a",
        "https://preview.redd.it/llhw32ccpmj61.jpg?width=216&crop=smart&auto=webp&s=40c23b3f58960638626b06d32e7280e511ba8065",
        "https://preview.redd.it/llhw32ccpmj61.jpg?width=320&crop=smart&auto=webp&s=cf2048f5ac8c8ad599f63681fb2091456f3455a4",
        "https://preview.redd.it/llhw32ccpmj61.jpg?width=640&crop=smart&auto=webp&s=8932389be71f6c4cf098e725c599ce47e1280e47",
        "https://preview.redd.it/llhw32ccpmj61.jpg?width=960&crop=smart&auto=webp&s=1aad6a334d0a569e02ca6e4968d8531e12ce1937",
        "https://preview.redd.it/llhw32ccpmj61.jpg?width=1080&crop=smart&auto=webp&s=86a18352e554f7dfe33a23edc77838d6225e88f9"
      ]
    },
    {
      "postLink": "https://redd.it/lroidk",
      "subreddit": "me_irl",
      "title": "Me_irl",
      "url": "https://i.redd.it/xakvmyy12ij61.jpg",
      "nsfw": false,
      "spoiler": false,
      "author": "zarthamoon",
      "ups": 3487,
      "preview": [
        "https://preview.redd.it/xakvmyy12ij61.jpg?width=108&crop=smart&auto=webp&s=e55cd7951e8e5098f9eeb7dee4be2d24b3e6474a",
        "https://preview.redd.it/xakvmyy12ij61.jpg?width=216&crop=smart&auto=webp&s=91c58dc874e2e6c67f9ac2fb49bd383d7f37e342",
        "https://preview.redd.it/xakvmyy12ij61.jpg?width=320&crop=smart&auto=webp&s=232648fa286a9d5fa31dc458f1899b627bd0befd",
        "https://preview.redd.it/xakvmyy12ij61.jpg?width=640&crop=smart&auto=webp&s=8161258086cf86050d443d2fa0732e93b2dea733"
      ]
    },
    {
      "postLink": "https://redd.it/ls3c9i",
      "subreddit": "me_irl",
      "title": "me_irl",
      "url": "https://i.redd.it/0rdsxon1mlj61.jpg",
      "nsfw": false,
      "spoiler": false,
      "author": "Tsushiss",
      "ups": 7510,
      "preview": [
        "https://preview.redd.it/0rdsxon1mlj61.jpg?width=108&crop=smart&auto=webp&s=4fa6cf2f319b5ab5f7637562e3fe6c9a4d33e132",
        "https://preview.redd.it/0rdsxon1mlj61.jpg?width=216&crop=smart&auto=webp&s=7457f1e7d05a35b5a80b6e268dd04c8b4709b4fd",
        "https://preview.redd.it/0rdsxon1mlj61.jpg?width=320&crop=smart&auto=webp&s=3c0c5fe1a7121f9e537ed34088af51a1399b9c71",
        "https://preview.redd.it/0rdsxon1mlj61.jpg?width=640&crop=smart&auto=webp&s=22c80abd46a4076e2b49aad8684f55cb50e8ae2c"
      ]
    },
    {
      "postLink": "https://redd.it/ls7m1j",
      "subreddit": "me_irl",
      "title": "me irl",
      "url": "https://i.redd.it/iq91w7bxumj61.jpg",
      "nsfw": false,
      "spoiler": false,
      "author": "crispyrolls",
      "ups": 65,
      "preview": [
        "https://preview.redd.it/iq91w7bxumj61.jpg?width=108&crop=smart&auto=webp&s=0109dd71ea6ef132a250352145ecbd9740c7cef1",
        "https://preview.redd.it/iq91w7bxumj61.jpg?width=216&crop=smart&auto=webp&s=2895051e5e754b02690c9ec6824f7558a18ff430",
        "https://preview.redd.it/iq91w7bxumj61.jpg?width=320&crop=smart&auto=webp&s=3266ef402745594ad0df15d567cc6f9d462206fe",
        "https://preview.redd.it/iq91w7bxumj61.jpg?width=640&crop=smart&auto=webp&s=50f1f75f75282345484addfecdf19b6d64796eca"
      ]
    },
    {
      "postLink": "https://redd.it/lrw010",
      "subreddit": "me_irl",
      "title": "me_irl",
      "url": "https://i.redd.it/x86ntfngfjj61.jpg",
      "nsfw": false,
      "spoiler": false,
      "author": "illthinkofsomething",
      "ups": 288,
      "preview": [
        "https://preview.redd.it/x86ntfngfjj61.jpg?width=108&crop=smart&auto=webp&s=a9c7f515d2a2e618ec342a4aa22ba4c5fac78199",
        "https://preview.redd.it/x86ntfngfjj61.jpg?width=216&crop=smart&auto=webp&s=691fbd50c09ed7bd9c842e8cdf36c292c159a851",
        "https://preview.redd.it/x86ntfngfjj61.jpg?width=320&crop=smart&auto=webp&s=9104c5369af84c13e09c11ceb45cdc95368d4e24",
        "https://preview.redd.it/x86ntfngfjj61.jpg?width=640&crop=smart&auto=webp&s=58f93b7447cc2d9aeaf6b96a5349a44f8dd5a6ec"
      ]
    },
    {
      "postLink": "https://redd.it/lrzw27",
      "subreddit": "me_irl",
      "title": "me irl",
      "url": "https://i.redd.it/rqfsxg78gkj61.jpg",
      "nsfw": false,
      "spoiler": false,
      "author": "invashawk",
      "ups": 2763,
      "preview": [
        "https://preview.redd.it/rqfsxg78gkj61.jpg?width=108&crop=smart&auto=webp&s=897a59f95cbad0e0d62b76c8156b336de3529036",
        "https://preview.redd.it/rqfsxg78gkj61.jpg?width=216&crop=smart&auto=webp&s=b0f154e0695292a74ca76df21e7fc0f3a14c3e3e",
        "https://preview.redd.it/rqfsxg78gkj61.jpg?width=320&crop=smart&auto=webp&s=30e8650f3fe70ed9c747789111577fd9b01afcbd",
        "https://preview.redd.it/rqfsxg78gkj61.jpg?width=640&crop=smart&auto=webp&s=6c2d1e627290ef8341125f5a003262d146e4de3a"
      ]
    },
    {
      "postLink": "https://redd.it/lryxiw",
      "subreddit": "me_irl",
      "title": "Me_irl",
      "url": "https://i.redd.it/vaf8n3ic5kj61.jpg",
      "nsfw": false,
      "spoiler": false,
      "author": "aswal94",
      "ups": 252,
      "preview": [
        "https://preview.redd.it/vaf8n3ic5kj61.jpg?width=108&crop=smart&auto=webp&s=49dd33f59da140a3938e86bc02acea0c3ec03237",
        "https://preview.redd.it/vaf8n3ic5kj61.jpg?width=216&crop=smart&auto=webp&s=be95c380028c38094fdec4ffcf0b0eaf950c8cd4",
        "https://preview.redd.it/vaf8n3ic5kj61.jpg?width=320&crop=smart&auto=webp&s=049dd5dac060af5a5d6774b53d62f40cde164f63"
      ]
    },
    {
      "postLink": "https://redd.it/ls146e",
      "subreddit": "me_irl",
      "title": "me_irl",
      "url": "https://i.redd.it/9ad80b31vkj61.jpg",
      "nsfw": false,
      "spoiler": false,
      "author": "Chicklef",
      "ups": 130,
      "preview": [
        "https://preview.redd.it/9ad80b31vkj61.jpg?width=108&crop=smart&auto=webp&s=f0a8c13268c09ed761806505837005ef4e3b5c30",
        "https://preview.redd.it/9ad80b31vkj61.jpg?width=216&crop=smart&auto=webp&s=d061f92bc32576fb4dda763c85a7ce80f3606c02",
        "https://preview.redd.it/9ad80b31vkj61.jpg?width=320&crop=smart&auto=webp&s=a46ce880306f2b9d4ab7ed57e50ab8d233153921",
        "https://preview.redd.it/9ad80b31vkj61.jpg?width=640&crop=smart&auto=webp&s=443afced0770c75379787a7a6e0609cd5a936f38"
      ]
    },
    {
      "postLink": "https://redd.it/lruoc2",
      "subreddit": "me_irl",
      "title": "me_irl",
      "url": "https://i.redd.it/yyn2o0ck7jj61.jpg",
      "nsfw": false,
      "spoiler": false,
      "author": "PM_ME_YOUR_STOMACHS",
      "ups": 566,
      "preview": [
        "https://preview.redd.it/yyn2o0ck7jj61.jpg?width=108&crop=smart&auto=webp&s=f4ccd424f2598e944ba2a0e94e43af36cbeceb8f",
        "https://preview.redd.it/yyn2o0ck7jj61.jpg?width=216&crop=smart&auto=webp&s=a530bc56a41437ca67025524d88f2022554f6ad2",
        "https://preview.redd.it/yyn2o0ck7jj61.jpg?width=320&crop=smart&auto=webp&s=400344edc29abbba73122cfeee74346b188f4484",
        "https://preview.redd.it/yyn2o0ck7jj61.jpg?width=640&crop=smart&auto=webp&s=7f873f52ebb8df92983da137ccb5fa8c8bee615b"
      ]
    },
    {
      "postLink": "https://redd.it/ls4c0d",
      "subreddit": "me_irl",
      "title": "me_irl",
      "url": "https://i.redd.it/iynwh27dgkj61.jpg",
      "nsfw": false,
      "spoiler": false,
      "author": "Pignugget23",
      "ups": 83,
      "preview": [
        "https://preview.redd.it/iynwh27dgkj61.jpg?width=108&crop=smart&auto=webp&s=f288fd945adcc5b86d413d0a4d4d91ab52a9756e",
        "https://preview.redd.it/iynwh27dgkj61.jpg?width=216&crop=smart&auto=webp&s=7e8e7ddab7edb8418ae2f022553527423178501d",
        "https://preview.redd.it/iynwh27dgkj61.jpg?width=320&crop=smart&auto=webp&s=e1e6589e1f4025e0168d5219b0bb95e58b1459c6",
        "https://preview.redd.it/iynwh27dgkj61.jpg?width=640&crop=smart&auto=webp&s=c73cc93650d985cfe7f92755d91cf32b6db73fcf"
      ]
    },
    {
      "postLink": "https://redd.it/ls6rpu",
      "subreddit": "me_irl",
      "title": "me irl",
      "url": "https://i.redd.it/nvqd0rw6nmj61.jpg",
      "nsfw": false,
      "spoiler": false,
      "author": "bababadi",
      "ups": 176,
      "preview": [
        "https://preview.redd.it/nvqd0rw6nmj61.jpg?width=108&crop=smart&auto=webp&s=9996a64097bb11dda8e442aba993a22a0a49c22b",
        "https://preview.redd.it/nvqd0rw6nmj61.jpg?width=216&crop=smart&auto=webp&s=dc0172d832386c73f828aa64525c50f040acdf33",
        "https://preview.redd.it/nvqd0rw6nmj61.jpg?width=320&crop=smart&auto=webp&s=00c5b59eb833c334162c9da704c4569990420fd5",
        "https://preview.redd.it/nvqd0rw6nmj61.jpg?width=640&crop=smart&auto=webp&s=967316764f24982f4c49e6fec3f691797f5a8024",
        "https://preview.redd.it/nvqd0rw6nmj61.jpg?width=960&crop=smart&auto=webp&s=11cb00a7c06e7036a3f4146674bbce9c836ec691",
        "https://preview.redd.it/nvqd0rw6nmj61.jpg?width=1080&crop=smart&auto=webp&s=85825aee3d6e1e7f621f334e3568b9acdb161dc8"
      ]
    },
    {
      "postLink": "https://redd.it/lsbok9",
      "subreddit": "me_irl",
      "title": "me_irl",
      "url": "https://i.redd.it/ywtb3dopqnj61.png",
      "nsfw": false,
      "spoiler": false,
      "author": "evilmeow",
      "ups": 19,
      "preview": [
        "https://preview.redd.it/ywtb3dopqnj61.png?width=108&crop=smart&auto=webp&s=a1b01e27dab827bb9a6f9f2020ba36ae5f5cc3f1",
        "https://preview.redd.it/ywtb3dopqnj61.png?width=216&crop=smart&auto=webp&s=178d5b9c5a081d9c82ff7fd56c571bcfe77e8f37",
        "https://preview.redd.it/ywtb3dopqnj61.png?width=320&crop=smart&auto=webp&s=b52e3f6e9ab0689867094e6e882dd35648e426f3",
        "https://preview.redd.it/ywtb3dopqnj61.png?width=640&crop=smart&auto=webp&s=beba027afde22e054c1fad35b26ca1f4ba4ddd61",
        "https://preview.redd.it/ywtb3dopqnj61.png?width=960&crop=smart&auto=webp&s=6827eb7f3fb0841f87c4fae2a87afbe1a5914712"
      ]
    },
    {
      "postLink": "https://redd.it/ls2dkm",
      "subreddit": "me_irl",
      "title": "Me_irl",
      "url": "https://i.redd.it/828ggofealj61.jpg",
      "nsfw": false,
      "spoiler": false,
      "author": "Bunsbys",
      "ups": 724,
      "preview": [
        "https://preview.redd.it/828ggofealj61.jpg?width=108&crop=smart&auto=webp&s=d0cade3a24caa242e9d39e232693e29e99dbb0c6",
        "https://preview.redd.it/828ggofealj61.jpg?width=216&crop=smart&auto=webp&s=6271881a5230faa90e3cd407ea75d73438e5dbfe",
        "https://preview.redd.it/828ggofealj61.jpg?width=320&crop=smart&auto=webp&s=3da891f35b68d9aa8aa19e6c80883edfe8f01e48",
        "https://preview.redd.it/828ggofealj61.jpg?width=640&crop=smart&auto=webp&s=4c90edd1f05855d25e76b6203c223039e9fc781a"
      ]
    }
    ]
    }
    """
}
