local ImmersiveLoreTables = {}

ImmersiveLoreTables.ActivatedStories = {}

ImmersiveLoreTables.censorSymbols = {
    "!",
    "#",
    "$",
    "%",
    "&",
    "*"
}

ImmersiveLoreTables.badWords = {
    "fuck",
    "shit",
    "fucker"
}

ImmersiveLoreTables.storiesTable = {
    {
        id = "0",
        rooms = {
            "bedroom",
        },
    },
    {
        id = "1",
        rooms = {
            "bathroom",
        },
    },
    {
        id = "2",
        rooms = {
            "bedroom",
        },
    },
    {
        id = "3",
        rooms = {
            "bedroom",
        },
        author = "Nat.",
    },
    {
        id = "4",
        rooms = {
            "bedroom",
        },
        author = "Nat.",
    },
    {
        id = "5",
        rooms = {
            "bedroom",
        },
        author = "Nat.",
    },
    {
        id = "6",
        rooms = {
            "bedroom",
        },
        author = "Nat.",
    },
    {
        id = "7",
        rooms = {
            "bedroom",
        },
        author = "Nat.",
    },
    {
        id = "8",
        rooms = {
            "bedroom",
        },
        author = "Nat.",
    },
    {
        id = "9",
        rooms = {
            "office",
            "livingroom",
        },
    },
    {
        id = "10",
        rooms = {
            "bedroom",
        },
    },
    {
        id = "11",
        rooms = {
            "bedroom",
        },
    },
    {
        id = "12",
        rooms = {
            "kitchen",
            "grocery",
        },
    },
    {
        id = "13",
        rooms = {
            "bedroom",
        },
    },
    {
        id = "14",
        rooms = {
            "bedroom",
        },
    },
    {
        id = "15",
        rooms = {
            "bedroom",
        },
    },
    {
        id = "16",
        rooms = {
            "bedroom",
        },
    },
    {
        id = "17",
        rooms = {
            "bakery",
            "bandlivingroom",
            "livingroom",
            "bar",
            "bookstore",
            "cafe",
            "cafeteria",
            "livingroom",
        },
    },
    {
        id = "18",
        rooms = {
            "livingroom",
        },
    },
    {
        id = "19",
        rooms = {
            "bathroom",
        },
    },
    {
        id = "20",
        rooms = {
            "bedroom",
            "livingroom",
        },
        author = "Kenshov",
    },
    {
        id = "21",
        rooms = {
            "bedroom",
            "livingroom",
            "bathroom",
        },
        author = "Kenshov",
    },
    {
        id = "22",
        rooms = {
            "bedroom",
            "livingroom",
        },
        author = "Kenshov",
    },
    {
        id = "23",
        rooms = {
            "bedroom",
            "livingroom",
        },
        author = "Kenshov",
    },
    {
        id = "24",
        rooms = {
            "bedroom",
            "livingroom",
        },
        author = "Hazy Lunar",
    },
    {
        id = "25",
        rooms = {
            "glovebox",
        },
        author = "Hazy Lunar",
    },
    {
        id = "26",
        rooms = {
            "bedroom",
            "livingroom",
        },
        author = "Kacperek",
    },
    {
        id = "27",
        rooms = {
            "bathroom",
        },
        author = "Glacies",
    },
    {
        id = "28",
        rooms = {
            "bedroom",
            "livingroom",
        },
        author = "Glacies",
    },
    {
        id = "29",
        rooms = {
            "garage",
            "kitchen",
            "storage",
        },
        author = "Glacies",
    },
    {
        id = "30",
        rooms = {
            "bedroom",
            "livingroom",
        },
        author = "Glacies",
    },
    {
        id = "31",
        rooms = {
            "garage",
            "kitchen",
            "storage",
            "bedroom",
        },
        author = "Glacies",
    },
    {
        id = "32",
        rooms = {
            "livingroom",
            "bedroom",
            "kitchen",
        },
        author = "Quill",
    },
    {
        id = "33",
        rooms = {
            "armyhanger",
            "armystorage",
        },
        author = "Quill",
    },
    {
        id = "34",
        rooms = {
            "gasstorage",
        },
        author = "Corn Berzerker",
    },
    {
        id = "35",
        rooms = {
            "gunstore",
            "armysurplus",
            "gunstorestorage",
        },
        author = "Quill",
    },
    {
        id = "36",
        rooms = {
            "kitchen",
        },
        author = "Quill",
    },
    {
        id = "37",
        rooms = {
            "office",
            "officestorage",
        },
        author = "Quill",
    },
    {
        id = "38",
        rooms = {
            "livingroom",
            "bedroom",
        },
        author = "JON",
    },
    {
        id = "39",
        rooms = {
            "fishingstorage",
        },
        author = "Hazy Lunar",
    },
    {
        id = "40",
        rooms = {
            "livingroom",
        },
        author = "Hazy Lunar",
    },
    {
        id = "41",
        rooms = {
            "livingroom",
        },
        author = "Hazy Lunar",
    },
    {
        id = "42",
        rooms = {
            "livingroom",
            "bedroom",
        },
        author = "The HOLY Elmo",
    },
    {
        id = "43",
        rooms = {
            "bedroom",
        },
        author = "Kacperek",
    },
    {
        id = "44",
        rooms = {
            "office",
            "officestorage",
            "prisoncells",
        },
        author = "anonymousalien602",
    },
    {
        id = "45",
        rooms = {
            "bedroom",
            "livingroom",
        },
        author = "wellsjrwarren2020",
    },
    {
        id = "46",
        rooms = {
            "classroom",
        },
        author = "YepThatsMyName",
    },
    {
        id = "47",
        rooms = {
            "pharmacy",
            "pharmacystorage",
            "medical",
            "medclinic",
            "dentiststorage",
        },
        author = "ndhart321",
    },
    {
        id = "48",
        rooms = {
            "bedroom",
            "mechanic",
            "glovebox",
            "truckbed",
        },
        author = "FenFenScreeScree",
    },
    {
        id = "49",
        rooms = {
            "inventorymale",
        },
        author = "FenFenScreeScree",
    },
    {
        id = "50",
        rooms = {
            "bedroom",
            "livingroom",
        },
        author = "Mexi_Cowboy",
    },
    {
        id = "51",
        rooms = {
            "bedroom",
            "livingroom",
        },
        author = "wellsjrwarren2020",
    },
    {
        id = "52",
        rooms = {
            "pawnshop",
        },
        author = "When in doubt: Duct Tape",
    },
    {
        id = "53",
        rooms = {
            "donut_kitchen",
        },
        author = "When in doubt: Duct Tape",
    },
    {
        id = "54",
        rooms = {
            "kitchen",
        },
        author = "When in doubt: Duct Tape",
    },
    {
        id = "55",
        rooms = {
            "liquorstore",
            "candystore",
            "sportstore",
        },
        author = "When in doubt: Duct Tape",
    },
    {
        id = "56",
        rooms = {
            "bandlivingroom",
            "bandpractice",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "57",
        rooms = {
            "bar",
            "barkitchen",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "58",
        rooms = {
            "bathroom",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "59",
        rooms = {
            "bedroom",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "60",
        rooms = {
            "breakroom",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "61",
        rooms = {
            "camerastore",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "62",
        rooms = {
            "dogfoodfactory",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "63",
        rooms = {
            "giftstore",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "64",
        rooms = {
            "hunting",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "65",
        rooms = {
            "laundry",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "66",
        rooms = {
            "mechanic",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "67",
        rooms = {
            "motelroomoccupied",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "68",
        rooms = {
            "movierental",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "69",
        rooms = {
            "pharmacy",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "70",
        rooms = {
            "producestorage",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "71",
        rooms = {
            "stripclub",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "72",
        rooms = {
            "livingroom",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "73",
        rooms = {
            "gunstore",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "74",
        rooms = {
            "factorystorage",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "75",
        rooms = {
            "changeroom",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "76",
        rooms = {
            "armyhanger",
            "armystorage",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "77",
        rooms = {
            "artstore",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "78",
        rooms = {
            "bandkitchen",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "79",
        rooms = {
            "cafekitchen",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "80",
        rooms = {
            "carsupply",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "81",
        rooms = {
            "daycare",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "82",
        rooms = {
            "housewarestore",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "83",
        rooms = {
            "janitor",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "84",
        rooms = {
            "kennels",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "85",
        rooms = {
            "kitchen",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "86",
        rooms = {
            "musicstore",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "87",
        rooms = {
            "pizzakitchen",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "88",
        rooms = {
            "poststorage",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "89",
        rooms = {
            "classroom",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "90",
        rooms = {
            "sushidining",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "91",
        rooms = {
            "livingroom",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "92",
        rooms = {
            "bedroom",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "93",
        rooms = {
            "cabinetfactory",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "94",
        rooms = {
            "bookstore",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "95",
        rooms = {
            "controlroom",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "96",
        rooms = {
            "bedroom",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "97",
        rooms = {
            "bedroom",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "98",
        rooms = {
            "livingroom",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "99",
        rooms = {
            "bedroom",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "100",
        rooms = {
            "laundry",
            "glovebox"
        },
        author = "Willy A. Jeep",
    },
    {
        id = "101",
        rooms = {
            "closet",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "102",
        rooms = {
            "bar",
            "lasertag",
            "leatherclothesstore",
            "laundry",
            "hall",
            "grocery",
            "gigamart",
            "gasstore",
            "drugshack",
            "cornerstore",
            "bandlivingroom",
            "musicstore",
            "theatre",
            "spiffo_dining",
            "glovebox"
        },
        author = "Willy A. Jeep",
    },
    {
        id = "103",
        rooms = {
            "livingroom",
            "kitchen",
            "beergarden",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "104",
        rooms = {
            "kitchen",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "105",
        rooms = {
            "electronicsstorage",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "106",
        rooms = {
            "glovebox",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "107",
        rooms = {
            "glovebox",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "108",
        rooms = {
            "truckbed",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "109",
        rooms = {
            "inventoryfemale",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "110",
        rooms = {
            "inventoryfemale",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "111",
        rooms = {
            "livingroom",
            "bedroom",
            "garage",
            "kitchen",
            "bathroom"
        },
        author = "SATURO",
    },
    {
        id = "112",
        rooms = {
            "livingroom",
            "bedroom",
        },
        author = "SATURO",
    },
    {
        id = "113",
        rooms = {
            "garage",
            "kitchen"
        },
        author = "SATURO",
    },
    {
        id = "114",
        rooms = {
            "motelroomoccupied"
        },
        author = "Hellstormgaming",
    },
    {
        id = "115",
        rooms = {
            "closet",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "116",
        rooms = {
            "laundry",
            "kitchen",
            "glovebox",
            "livingroom",
            "farmstorage",
            "shed",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "117",
        rooms = {
            "officestorage",
            "closet",
            "electronicsstorage",
            "electronicsstore"
        },
        author = "Willy A. Jeep",
    },
    {
        id = "118",
        rooms = {
            "bedroom",
            "livingroom",
            "kitchen"
        },
        author = "Willy A. Jeep",
    },
    {
        id = "119",
        rooms = {
            "survivorcache2"
        },
        author = "Willy A. Jeep",
    },
    {
        id = "120",
        rooms = {
            "policestorage"
        },
        author = "FenFenScreeScree",
    },
    {
        id = "121",
        rooms = {
            "bedroom"
        },
        author = "Lukewarm Moth",
    },
    {
        id = "122",
        rooms = {
            "bedroom"
        },
        author = "Lukewarm Moth",
    },
    {
        id = "123",
        rooms = {
            "bedroom"
        },
        author = "Willy A. Jeep",
    },
    {
        id = "124",
        rooms = {
            "shed"
        },
        author = "Willy A. Jeep",
    },
    {
        id = "125",
        rooms = {
            "bandlivingroom",
            "conveniencestore",
            "electronicsstore"
        },
        author = "Willy A. Jeep",
    },
    {
        id = "126",
        rooms = {
            "drugshack",
            "empty",
            "garagestorage",
            "glovebox"
        },
        author = "Willy A. Jeep",
    },
    {
        id = "127",
        rooms = {
            "glovebox",
            "bandlivingroom",
            "livingroom",
            "bedroom",
        },
        author = "DeputyDong",
        locations = {
            "muldraugh"
        }
    },
    {
        id = "128",
        rooms = {
            "glovebox",
            "bandlivingroom",
            "livingroom",
            "bedroom",
        },
        author = "DeputyDong",
        locations = {
            "muldraugh",
            "marchridge_bunker"
        }
    },
    {
        id = "129",
        rooms = {
            "grocery",
            "gigamart",
        },
        author = "DeputyDong",
        locations = {
            "marchridge"
        }
    },
    {
        id = "130",
        rooms = {
            "morgue",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "131",
        rooms = {
            "survivorcache1",
        },
        author = "Willy A. Jeep",
        locations = {
            "doevalley",
            "ekron"
        }
    },
    {
        id = "132",
        rooms = {
            "kitchen",
            "breakroom"
        },
        author = "Willy A. Jeep",
    },
    {
        id = "133",
        rooms = {
            "medicalcache1",
        },
        author = "Willy A. Jeep",
        locations = {
            "louisville",
        }
    },
    {
        id = "134",
        rooms = {
            "closet",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "135",
        rooms = {
            "bedroom",
        },
        author = "mimico",
    },
    {
        id = "136",
        rooms = {
            "glovebox",
        },
        author = "mimico",
    },
    {
        id = "137",
        rooms = {
            "bedroom",
        },
        author = "Willy A. Jeep",
        locations = {
            "muldraugh"
        }
    },
    {
        id = "138",
        rooms = {
            "livingroom",
        },
        author = "Willy A. Jeep",
        locations = {
            "scenicgrovemobilehomepark"
        }
    },
    {
        id = "139",
        rooms = {
            "hunting",
            "gasstore",
            "fossoil",
            "poststorage",
            "survivorcache2",
            "armysurplus",
            "gunstore",
            "camping",
            "gas2go",
            "survivalist"
        },
        author = "Willy A. Jeep",
    },
    {
        id = "140",
        rooms = {
            "controlroom"
        },
        author = "Willy A. Jeep",
        locations = {
            "doevalley"
        }
    },
    {
        id = "141",
        rooms = {
            "bedroom"
        },
        author = "Willy A. Jeep",
        locations = {
            "brandenburg"
        }
    },
    {
        id = "142",
        rooms = {
            "oldarmy"
        },
        author = "Willy A. Jeep",
        locations = {
            "marchridge"
        }
    },
    {
        id = "143",
        rooms = {
            "traincar"
        },
        author = "Willy A. Jeep",
        locations = {
            "muldraugh"
        }
    },
    {
        id = "144",
        rooms = {
            "glovebox"
        },
        author = "Willy A. Jeep",
        locations = {
            "echocreek"
        }
    },
    {
        id = "145",
        rooms = {
            "derelict",
            "vacated"
        },
        author = "Willy A. Jeep",
    },
    {
        id = "146",
        rooms = {
            "cave",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "147",
        rooms = {
            "garage",
        },
        author = "Willy A. Jeep",
        locations = {
            "irvington"
        }
    },
    {
        id = "148",
        rooms = {
            "cybercafe",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "149",
        rooms = {
            "baggageroom",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "150",
        rooms = {
            "aircraftgarage",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "151",
        rooms = {
            "oldmedical",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "152",
        rooms = {
            "mexicandining",
        },
        author = "Willy A. Jeep",
        locations = {
            "irvington"
        }
    },
    {
        id = "153",
        rooms = {
            "metalshop",
            "metalshipping",
            "workshop"
        },
        author = "Willy A. Jeep",
        locations = {
            "ekron"
        }
    },
    {
        id = "154",
        rooms = {
            "gasstore",
            "gasstorage",
        },
        author = "valenccoonie",
        locations = {
            "fallaslake",
            "riverside",
            "ekron"
        }
    },
    {
        id = "155",
        rooms = {
            "truckbed",
            "inventorymale"
        },
        author = "valenccoonie",
        locations = {
            "muldraugh"
        }
    },
    {
        id = "156",
        rooms = {
            "glovebox",
            "inventoryfemale",
            "inventorymale",
            "bedroom",
            "kidsbedroom"
        },
        author = "valenccoonie",
        locations = {
            "marchridge",
            "westpoint",
        }
    },
    {
        id = "157",
        rooms = {
            "glovebox",
            "camping",
            "campingstorage"
        },
        author = "valenccoonie",
        locations = {
            "louisville",
            "valleystation",
        }
    },
    {
        id = "158",
        rooms = {
            "closet",
            "livingroom",
            "kidsbedroom"
        },
        author = "valenccoonie",
        locations = {
            "rosewood",
            "irvington",
        }
    },
    {
        id = "159",
        rooms = {
            "garagestorage",
            "shed"
        },
        author = "valenccoonie",
        locations = {
            "marhcridge",
            "Riverside",
        }
    },
    {
        id = "160",
        rooms = {
            "kitchen",
            "radiostorage",
            "livingroom"
        },
        author = "valenccoonie",
    },
    {
        id = "161",
        rooms = {
            "campingstorage",
            "camping",
            "inventorymale",
            "inventoryfemale"
        },
        author = "valenccoonie",
    },
    {
        id = "162",
        rooms = {
            "basement",
            "kitchen",
            "livingroom",
        },
        author = "valenccoonie",
        locations = {
            "rosewood",
            "irvington",
            "ekron"
        }
    },
    {
        id = "163",
        rooms = {
            "inventoryfemale",
            "inventorymale",
        },
        author = "valenccoonie",
        locations = {
            "louisville"
        }
    },
    {
        id = "164",
        rooms = {
            "kitchen",
            "livingroom",
            "garagestorage"
        },
        author = "valenccoonie",
        locations = {
            "valleystation"
        }
    },
    {
        id = "165",
        rooms = {
            "cafeteria",
            "cafeteriakitchen",
            "inventorymale"
        },
        author = "valenccoonie",
        locations = {
            "louisville"
        }
    },
    {
        id = "166",
        rooms = {
            "glovebox",
            "truckbed"
        },
        author = "valenccoonie",
        locations = {
            "louisville",
            "valleystation"
        }
    },
    {
        id = "167",
        rooms = {
            "bedroom",
            "kitchen",
            "livingroom",
            "housewarestore"
        },
        author = "valenccoonie",
        locations = {
            "ekron",
            "irvington"
        }
    },
    {
        id = "168",
        rooms = {
            "inventorymale",
            "bedroom"
        },
        author = "valenccoonie",
        locations = {
            "louisville"
        }
    },
    {
        id = "169",
        rooms = {
            "livingroom",
            "garagestorage"
        },
        author = "valenccoonie",
        locations = {
            "marchridge",
            "echocreek",
            "ekron"
        }
    },
    {
        id = "170",
        rooms = {
            "bar",
            "restaurantdining"
        },
        author = "valenccoonie",
        locations = {
            "westpoint"
        }
    },
    {
        id = "171",
        rooms = {
            "livingroom"
        },
        author = "valenccoonie",
        locations = {
            "marchridge",
            "echocreek"
        }
    },
    {
        id = "172",
        rooms = {
            "bedroom",
            "bathroom",
            "kitchenwares"
        },
        author = "valenccoonie",
        locations = {
            "louisville"
        }
    },
    {
        id = "173",
        rooms = {
            "inventoryfemale",
            "bedroom",
            "glovebox"
        },
        author = "valenccoonie",
        locations = {
            "marchridge",
            "muldraugh"
        }
    },
    {
        id = "174",
        rooms = {
            "garagestorage",
            "bathroom"
        },
        author = "valenccoonie",
        locations = {
            "marchridge",
            "echocreek",
            "rosewood"
        }
    },
    {
        id = "175",
        rooms = {
            "office",
            "changeroom",
            "breakroom"
        },
        author = "valenccoonie",
    },
    {
        id = "176",
        rooms = {
            "bedroom",
            "closet"
        },
        author = "valenccoonie",
    },
    {
        id = "177",
        rooms = {
            "kitchenwares",
            "bedroom"
        },
        author = "valenccoonie",
        locations = {
            "irvington",
            "riverside"
        }
    },
    {
        id = "178",
        rooms = {
            "liquorstore",
            "barcounter"
        },
        author = "valenccoonie",
    },
    {
        id = "179",
        rooms = {
            "church",
            "officechurch",
            "inventorymale"
        },
        author = "valenccoonie",
        locations = {
            "riverside"
        }
    },
    {
        id = "180",
        rooms = {
            "weddingstoredress",
            "weddingstorestorage"
        },
        author = "valenccoonie",
    },
    {
        id = "181",
        rooms = {
            "livingroom",
            "garagestorage"
        },
        author = "valenccoonie",
        locations = {
            "riverside",
            "echocreek"
        }
    },
    {
        id = "182",
        rooms = {
            "inventorymale"
        },
        author = "valenccoonie",
    },
    {
        id = "183",
        rooms = {
            "inventoryfemale"
        },
        author = "valenccoonie",
        locations = {
            "muldraugh",
            "brandenburg"
        }
    },
    {
        id = "184",
        rooms = {
            "inventorymale"
        },
        author = "valenccoonie",
        locations = {
            "muldraugh",
            "brandenburg"
        }
    },
    {
        id = "185",
        rooms = {
            "elementaryschool",
            "elementaryclassroom"
        },
        author = "valenccoonie",
        locations = {
            "muldraugh"
        }
    },
    {
        id = "186",
        rooms = {
            "inventorymale",
            "inventoryfemale",
            "communitycenter"
        },
        author = "valenccoonie",
        locations = {
            "brandenburg"
        }
    },
    {
        id = "187",
        rooms = {
            "bedroom",
            "livingroom"
        },
        author = "wellsjrwarren2020",
    },
    {
        id = "188",
        rooms = {
            "brewery",
        },
        author = "Willy A. Jeep",
        locations = {
            "louisville"
        }
    },
    {
        id = "189",
        rooms = {
            "cardealershipoffice",
        },
        author = "Willy A. Jeep",
        locations = {
            "louisville"
        }
    },
    {
        id = "190",
        rooms = {
            "lasertag",
        },
        author = "Willy A. Jeep",
        locations = {
            "louisville"
        }
    },
    {
        id = "191",
        rooms = {
            "bandkitchen",
        },
        author = "Willy A. Jeep",
    },
    {
        id = "192",
        rooms = {
            "ww_bar",
            "ww_sherrif",
            "ww_aesthetic",
            "ww_blacksmith",
            "ww_generalstore",
            "ww_toolstore",
            "gunstore",
            "hunting",
            "laundry"
        },
        author = "Willy A. Jeep",
    },
    {
        id = "193",
        rooms = {
            "breakroom",
            "cybercafe",
            "dentist",
            "electronicstore",
            "foyer",
            "hospitalhallway",
            "janitor",
            "laundry",
            "livingroom",
            "lobby",
            "mayorwestpointoffice",
            "medicaloffice",
            "officechurch",
            "pawnshopoffice",
            "post",
            "poststorage",
            "smokingroom",
            "tobaccostore",
            "waitingroom"
        },
        author = "Willy A. Jeep",
    },
    {
        id = "194",
        rooms = {
            "cafeteria",
            "church",
            "closet",
            "cornerstore",
            "daycare",
            "derelict",
            "drugshack",
            "elementaryschool",
            "empty",
            "gasstore",
            "laundry",
            "library",
            "medicaloffice",
            "motelroomoccupied",
            "officechurch",
            "policeoffice",
            "post",
            "teacherroom",
            "universitylibrary",
            "vacated"
        },
        author = "Willy A. Jeep",
        locations = {
            "louisville",
            "valleystation"
        }
    },
    {
        id = "195",
        rooms = {
            "cafeteria",
            "secondaryhall",
            "post",
            "church",
            "fossoil",
            "lobby",
            "library"
        },
        author = "Willy A. Jeep",
        locations = {
            "ekron"
        }
    },
    {
        id = "196",
        rooms = {
            "library",
            "bookstore"
        },
        author = "Willy A. Jeep",
        locations = {
            "marchridge",
            "louisville",
            "brandenburg"
        }
    },
    {
        id = "197",
        rooms = {
            "livingroom",
            "laundry",
            "bathroom",
            "fossoil",
            "gasstore",
            "gas2go",
            "zippeestore",
            "conveniencestore",
            "post"
        },
        author = "Willy A. Jeep",
    },
    {
        id = "198",
        rooms = {
            "bathroom",
            "derelict",
            "kitchen"
        },
        author = "Willy A. Jeep",
        locations = {
            "muldraugh"
        }
    },
    {
        id = "199",
        rooms = {
            "glovebox",
            "truckbed"
        },
        author = "Willy A. Jeep",
        locations = {
            "irvington",
            "ekron",
            "brandenburg",
            "echocreek",
            "doevalley",
            "fallaslake"
        }
    },
    {
        id = "200",
        rooms = {
            "armysurplus",
        },
        author = "Willy A. Jeep",
        locations = {
            "louisville"
        }
    },
    {
        id = "201",
        rooms = {
            "inventorymale",
        },
        author = "valentim",
        locations = {
            "marchridge",
            "muldraugh"
        }
    },
    {
        id = "202",
        author = "valentim",
        locations = {
            "doevalley"
        }
    },
    {
        id = "203",
        author = "valentim",
        locations = {
            "valleystation"
        }
    },
    {
        id = "204",
        rooms = {
            "inventoryfemale",
            "inventorymale"
        },
        author = "valentim",
        locations = {
            "riverside"
        }
    },
    {
        id = "205",
        rooms = {
            "glovebox",
            "bedroom"
        },
        author = "valentim",
        locations = {
            "westpoint"
        }
    },
    {
        id = "206",
        rooms = {
            "inventoryfemale",
            "boathouse"
        },
        author = "valentim",
        locations = {
            "westpoint"
        }
    },
    {
        id = "207",
        rooms = {
            "truckbed",
        },
        author = "valentim",
        locations = {
            "riverside"
        }
    },
    {
        id = "208",
        rooms = {
            "gasstore",
            "gasstorage"
        },
        author = "valentim",
        locations = {
            "louisville"
        }
    },
    {
        id = "209",
        rooms = {
            "bedroom",
        },
        author = "valentim",
        locations = {
            "louisville"
        }
    },
    {
        id = "210",
        author = "valentim",
        locations = {
            "muldraugh",
            "louisville"
        }
    },
    {
        id = "211",
        rooms = {
            "kitchen",
            "livingroom"
        },
        author = "valentim",
        locations = {
            "valleystation",
            "louisville"
        }
    },
    {
        id = "212",
        rooms = {
            "glovebox",
            "inventorymale",
            "inventoryfemale"
        },
        author = "valentim",
    },
    {
        id = "213",
        rooms = {
            "office",
        },
        author = "valentim",
        locations = {
            "rosewood",
            "louisville"
        }
    },
    {
        id = "214",
        rooms = {
            "livingroom",
        },
        author = "valentim",
        locations = {
            "rosewood",
            "louisville"
        }
    },
    {
        id = "215",
        rooms = {
            "restaurantdining",
        },
        author = "valentim",
        locations = {
            "rosewood",
            "louisville"
        }
    },
    {
        id = "216",
        rooms = {
            "bookstore",
            "closet",
            "comicstore",
            "cybercafe",
            "janitor",
            "laundry",
            "policearchive",
            "sewingstorage",
            "storageunit"
        },
        author = "Willy A. Jeep",
        locations = {
            "marchridge",
            "louisville",
            "valleystation"
        }
    },
    {
        id = "217",
        rooms = {
            "weddingstorestorage",
        },
        author = "Willy A. Jeep",
        locations = {
            "irvington"
        }
    },
    {
        id = "218",
        rooms = {
            "livingroom",
            "kitchen",
            "bedroom",
            "basement"
        },
        author = "soup_in_space",
    }

}

return ImmersiveLoreTables
