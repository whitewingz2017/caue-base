itemList = {};

/*

  WEAPONS START

*/

// MELEE

itemList['2343591895'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Lanterna',
  price: 1,
  weight: 11,
  nonStack: true,
  craft: [[
    { itemid: 'copper', amount: 500 },
    { itemid: 'rubber', amount: 50 },
  ]],
  model: '',
  image: 'np_flashlight.png',
  weapon: true,
};

itemList['-262696221'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Faca de prisão',
  craft: [[
    { itemid: 'aluminium', amount: 1 },
    { itemid: 'scrapmetal', amount: 1 },
  ]],
  price: 250,
  weight: 3,
  nonStack: true,
  model: '',
  image: 'np_shiv.png',
  weapon: true,
  contraband: true,
};

itemList['1923739240'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Marreta',
  craft: [
    [
      { itemid: 'steel', amount: 75 },
      { itemid: 'scrapmetal', amount: 75 },
    ],
    [
      { itemid: 'refinedsteel', amount: 25 },
      { itemid: 'refinedscrap', amount: 25 },
    ],
  ],
  price: 1,
  weight: 25,
  nonStack: true,
  model: '',
  image: 'np_sledgehammer.png',
  information: 'Grande e volumoso.',
  weapon: true,
  contraband: true,
};

itemList['-102323637'] = {
  fullyDegrades: true,
  decayrate: 2.00,
  displayname: 'Garrafa velha quebrada',
  craft: [[
    { itemid: 'refinedglass', amount: 10 },
  ]],
  price: 1,
  weight: 2,
  nonStack: false,
  model: '',
  image: 'np_glass-bottle.png',
  information: 'Parece uma garrafa premium de Karlsberg.',
};

itemList['3638508604'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Soco inglês',
  craft: [
    [
      { itemid: 'aluminium', amount: 125 },
      { itemid: 'scrapmetal', amount: 10 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 35 },
      { itemid: 'refinedscrap', amount: 3 },
    ]
  ],
  price: 250,
  weight: 2,
  nonStack: true,
  model: '',
  image: 'np_knuckle-dusters.png',
  weapon: true,
  contraband: true,
};

itemList['knuckle_chain'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Limpador de corrente',
  craft: [[
    { itemid: 'refinedscrap', amount: 20 },
    { itemid: 'refinedsteel', amount: 15 },
  ]],
  price: 250,
  weight: 11,
  nonStack: true,
  model: '',
  image: 'np_chain_dusters.png',
  weapon: false,
  contraband: true,
};

itemList['1141786504'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Taco de golfe',
  price: 250,
  weight: 15,
  nonStack: true,
  model: '',
  image: 'np_golfclub.png',
  weapon: true,
};

itemList['1317494643'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Martelo',
  price: 250,
  weight: 8,
  nonStack: true,
  model: '',
  image: 'np_hammer.png',
  weapon: true,
};

itemList['1737195953'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Cacetete',
  price: 1,
  weight: 4,
  nonStack: true,
  model: '',
  image: 'np_nightstick.png',
  information: 'Equipamento emitido pelo governo (PD/EMS/DOC)',
  weapon: true,
};

itemList['2227010557'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Pé de cabra',
  price: 250,
  weight: 15,
  nonStack: true,
  model: '',
  image: 'np_crowbar.png',
  weapon: true,
};

itemList['-1786099057'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Teclado modelo M',
  price: 250,
  weight: 7,
  nonStack: true,
  model: '',
  image: 'np_keyboard.png',
  weapon: true,
};

itemList['-1239161099'] = {
  fullyDegrades: false,
  decayrate: 5.0,
  displayname: 'Katana',
  price: 1,
  craft: [[
    { itemid: 'refinedsteel', amount: 650 },
  ]],
  weight: 7,
  nonStack: true,
  model: '',
  image: 'np_katana.png',
  information: 'Enquanto você se diverte, eu estudo a lâmina.',
  weapon: true,
  contraband: true,
};

itemList['1692590063'] = {
  fullyDegrades: false,
  decayrate: 5.0,
  displayname: 'Katana',
  price: 1,
  craft: [[
    { itemid: 'refinedsteel', amount: 650 },
    { itemid: 'refinedaluminium', amount: 250 },
  ]],
  weight: 7,
  nonStack: true,
  model: '',
  image: 'np_katana.png',
  information: 'Enquanto você se diverte, eu estudo a lâmina.',
  weapon: true,
  contraband: true,
};

itemList['-538741184'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Canivete',
  craft: [[
    { itemid: 'methlabproduct', amount: 25 },
    { itemid: 'ciggy', amount: 100 },
  ]],
  price: 250,
  weight: 3,
  nonStack: true,
  model: '',
  image: 'np_switchblade.png',
  weapon: true,
};

itemList['2460120199'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Adaga',
  craft: [
    [
      { itemid: 'aluminium', amount: 125 },
      { itemid: 'scrapmetal', amount: 10 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 35 },
      { itemid: 'scrapmetal', amount: 10 },
    ]
  ],
  price: 250,
  weight: 5,
  nonStack: true,
  model: '',
  image: 'np_dagger.png',
  weapon: true,
  contraband: true,
};

itemList['600439132'] = {
  fullyDegrades: false,
  decayrate: 1.0,
  displayname: 'Lima',
  craft: [[
    { itemid: 'refinedaluminium', amount: 25 },
    { itemid: 'refinedrubber', amount: 25 },
  ]],
  price: 250,
  weight: 2,
  nonStack: true,
  model: '',
  image: 'np_lime.png',
  weapon: true,
  contraband: true,
};

itemList['-1024456158'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Bastão',
  craft: [[
    { itemid: 'refinedaluminium', amount: 25 },
    { itemid: 'refinedrubber', amount: 25 },
  ]],
  price: 250,
  weight: 14,
  nonStack: true,
  model: '',
  image: 'np_baseball-bat.png',
  weapon: true,
  contraband: true,
};

itemList['-2000187721'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Maleta de segurança',
  price: 250,
  weight: 25,
  nonStack: true,
  model: '',
  image: 'np_securitycase.png',
  weapon: true,
  contraband: true,
};

itemList['28811031'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Maleta',
  price: 250,
  weight: 25,
  nonStack: true,
  model: '',
  image: 'np_suitcase.png',
  weapon: true,
  contraband: true,
};

itemList['2578778090'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Faca',
  price: 250,
  weight: 7,
  nonStack: true,
  model: '',
  image: 'np_knife.png',
  weapon: true,
};

itemList['3713923289'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Machete',
  craft: [
    [
      { itemid: 'aluminium', amount: 140 },
      { itemid: 'rubber', amount: 40 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 35 },
      { itemid: 'refinedrubber', amount: 10 },
    ]
  ],
  price: 250,
  weight: 15,
  nonStack: true,
  model: '',
  image: 'np_machete.png',
  weapon: true,
  contraband: true,
};

itemList['4191993645'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Machadinha',
  price: 250,
  weight: 17,
  nonStack: true,
  model: '',
  image: 'np_hatchet.png',
  weapon: true,
};

// THROW

itemList['1064738331'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Tijolo',
  craft: [[
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  price: 250,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_brick.png',
  weapon: true,
};

itemList['-691061592'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Livro',
  craft: [[
    { itemid: 'rollingpaper', amount: 10 },
  ]],
  price: 250,
  weight: 2,
  nonStack: false,
  model: '',
  image: 'np_book_w.png',
  weapon: true,
};

itemList['571920712'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Dinheiro',
  price: 100,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'np_cash.png',
  weapon: true,
};

itemList['-828058162'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Tênis roubado',
  price: 1,
  weight: 3,
  nonStack: true,
  model: '',
  image: 'np_stolenshoes.png',
  information: 'Não cabe no seu pé, bro.',
};

itemList['-1813897027'] = {
  fullyDegrades: false,
  decayrate: 0.01,
  displayname: 'Granada de atordoamento (SWAT)',
  price: 100,
  weight: 5,
  craft: [[
    { itemid: 'aluminium', amount: 350 },
    { itemid: 'scrapmetal', amount: 350 },
    { itemid: 'rubber', amount: 300 },
  ]],
  nonStack: true,
  model: '',
  image: 'np_stungrenade.png',
  information: 'Assim, a polícia pode invadir um prédio sem se sentir um ______! Se você não é certificado pela SWAT, não compre.',
  weapon: true,
  contraband: true,
};

itemList['1233104067'] = {
  fullyDegrades: false,
  decayrate: 0.25,
  displayname: 'Flare',
  price: 100,
  weight: 5,
  craft: [[
    { itemid: 'aluminium', amount: 350 },
    { itemid: 'scrapmetal', amount: 350 },
    { itemid: 'rubber', amount: 300 },
  ]],
  nonStack: true,
  model: '',
  image: 'np_flare.png',
  information: '',
  weapon: true,
  contraband: true,
};

itemList['-1600701090'] = {
  fullyDegrades: false,
  decayrate: 0.2,
  displayname: 'Granada M67',
  price: 100,
  weight: 5,
  craft: [[
    { itemid: 'aluminium', amount: 110 },
    { itemid: 'scrapmetal', amount: 150 },
    { itemid: 'rubber', amount: 100 },
  ], [
    { itemid: 'refinedaluminium', amount: 35 },
    { itemid: 'scrapmetal', amount: 150 },
    { itemid: 'refinedrubber', amount: 35 },
  ]],
  nonStack: true,
  model: '',
  image: 'np_grenade.png',
  information: '',
  weapon: true,
  contraband: true,
};

itemList['-37975472'] = {
  fullyDegrades: false,
  decayrate: 0.25,
  displayname: 'Granada de fumaça',
  price: 100,
  weight: 5,
  craft: [[
    { itemid: 'aluminium', amount: 150 },
    { itemid: 'scrapmetal', amount: 150 },
    { itemid: 'rubber', amount: 150 },
  ], [
    { itemid: 'refinedaluminium', amount: 45 },
    { itemid: 'refinedscrap', amount: 45 },
    { itemid: 'refinedrubber', amount: 45 },
  ]],
  nonStack: true,
  model: '',
  image: 'np_stungrenade.png',
  information: '',
  weapon: true,
  contraband: true,
};

itemList['-1169823560'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Bomba caseira',
  price: 250,
  weight: 7,
  craft: [[
    { itemid: 'aluminium', amount: 350 },
    { itemid: 'scrapmetal', amount: 350 },
    { itemid: 'rubber', amount: 300 },
  ]],
  nonStack: true,
  model: '',
  image: 'np_pipe-bomb.png',
  weapon: true,
  contraband: true,
};

itemList['615608432'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Molotov',
  craft: [
    [
      { itemid: 'aluminium', amount: 75 },
      { itemid: 'whiskey', amount: 3 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 12 },
      { itemid: 'whiskey', amount: 3 },
    ]
  ],
  price: 250,
  weight: 35,
  nonStack: false,
  model: '',
  image: 'np_molotov.png',
  weapon: true,
  contraband: true,
};

itemList['741814745'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Bomba pegajosa',
  price: 250,
  craft: [[
    { itemid: 'aluminium', amount: 1250 },
    { itemid: 'scrapmetal', amount: 1250 },
    { itemid: 'rubber', amount: 1250 },
  ], [
    { itemid: 'refinedaluminium', amount: 415 },
    { itemid: 'scrapmetal', amount: 1250 },
    { itemid: 'refinedrubber', amount: 415 },
  ]],
  weight: 22,
  nonStack: true,
  model: '',
  image: 'np_sticky-bomb.png',
  weapon: true,
  contraband: true,
};

itemList['1748076076'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Arma de pregos',
  price: 10,
  craft: [[
    { itemid: 'aluminium', amount: 1 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  weight: 11,
  nonStack: true,
  model: '',
  image: 'np_nailgun.png',
  weapon: true,
  insertFrom: ['nails'],
};

itemList['-72657034'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Paraquedas',
  price: 250,
  craft: [[
    { itemid: 'aluminium', amount: 100 },
    { itemid: 'plastic', amount: 100 },
    { itemid: 'rubber', amount: 100 },
  ]],
  weight: 30,
  nonStack: true,
  model: '',
  image: 'np_parachute.png',
  weapon: false,
};

itemList['101631238'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Extintor de incêndio',
  price: 250,
  craft: [[
    { itemid: 'aluminium', amount: 100 },
    { itemid: 'scrapmetal', amount: 40 },
    { itemid: 'rubber', amount: 1 },
  ]],
  weight: 25,
  nonStack: true,
  model: '',
  image: 'np_fire-extinguisher.png',
  weapon: true,
};

itemList['883325847'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Galão de gasolina',
  price: 250,
  weight: 50,
  nonStack: true,
  model: '',
  image: 'np_petrol-can.png',
  weapon: true,
};

// WEAPONS

itemList['218362403'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Espingarda de borracha',
  price: 10,
  weight: 25,
  craft: [[
    { itemid: 'aluminium', amount: 70 },
    { itemid: 'steel', amount: 70 },
  ]],
  nonStack: true,
  model: '',
  image: 'np_lessthanlethal.png',
  weapon: true,
  information: 'Arma não-letal emitida pela PD e DOC',
  insertFrom: ['rubberslugs'],
};

itemList['148457251'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Browning 9mm',
  price: 250,
  weight: 6,
  craft: [
    [
      { itemid: 'aluminium', amount: 15 },
      { itemid: 'steel', amount: 15 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 5 },
      { itemid: 'refinedsteel', amount: 5 },
    ]
  ],
  nonStack: true,
  model: '',
  image: 'np_browning.png',
  weapon: true,
  insertFrom: ['pistolammo'],
};

itemList['-2012211169'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Diamondback DB9',
  price: 250,
  weight: 6,
  craft: [
    [
      { itemid: 'aluminium', amount: 15 },
      { itemid: 'steel', amount: 15 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 5 },
      { itemid: 'refinedsteel', amount: 5 },
    ]
  ],
  nonStack: true,
  model: '',
  image: 'np_DB9.png',
  weapon: true,
  insertFrom: ['pistolammo'],
};

itemList['-1746263880'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Colt Python',
  price: 250,
  weight: 11,
  craft: [
    [
      { itemid: 'aluminium', amount: 150 },
      { itemid: 'plastic', amount: 150 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 45 },
      { itemid: 'refinedplastic', amount: 45 },
    ],
  ],
  nonStack: true,
  model: '',
  image: 'np_colt.png',
  weapon: true,
  insertFrom: ['pistolammo'],
};

itemList['453432689'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Colt 1911',
  price: 250,
  craft: [[
    { itemid: 'aluminium', amount: 1 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  weight: 6,
  nonStack: true,
  model: '',
  image: 'np_pistol.png',
  weapon: true,
  insertFrom: ['pistolammo'],
};

itemList['-1075685676'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Beretta M9',
  price: 250,
  craft: [[
    { itemid: 'aluminium', amount: 1 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  weight: 5,
  nonStack: true,
  model: '',
  image: 'np_pistol2.png',
  weapon: true,
  insertFrom: ['pistolammo'],
};

itemList['1593441988'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'FN FNX-45',
  price: 250,
  craft: [[
    { itemid: 'steel', amount: 65 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  weight: 5,
  nonStack: true,
  blockScrap: true,
  model: '',
  image: 'np_combat-pistol.png',
  weapon: true,
  insertFrom: ['pistolammo'],
};

itemList['-820634585'] = {
  fullyDegrades: false,
  decayrate: 0.5,
  displayname: 'PD Taser',
  price: 1,
  craft: [[
    { itemid: 'aluminium', amount: 1 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  weight: 3,
  nonStack: true,
  model: '',
  image: 'np_stun-gun.png',
  weapon: true,
  information: 'Equipamento emitido pelo governo (PD/EMS/DOC)',
  insertFrom: ['taserammo'],
};

itemList['-120179019'] = {
  fullyDegrades: false,
  decayrate: 1.0,
  displayname: 'Glock 18',
  price: 1,
  craft: [[
    { itemid: 'aluminium', amount: 1 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  weight: 9,
  nonStack: true,
  model: '',
  image: 'np_glock.png',
  weapon: true,
  information: 'Equipamento emitido pelo governo (PD/EMS/DOC)',
  insertFrom: ['pistolammo', 'pistolammoPD'],
};

itemList['-1716589765'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Desert Eagle',
  price: 250,
  craft: [
    [
      { itemid: 'aluminium', amount: 130 },
      { itemid: 'plastic', amount: 130 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 43 },
      { itemid: 'refinedplastic', amount: 43 },
    ],
  ],
  weight: 11,
  nonStack: true,
  model: '',
  image: 'np_pistol-50.png',
  weapon: true,
  insertFrom: ['pistolammo'],
};

itemList['-134995899'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Mac-10',
  price: 250,
  craft: [
    [
      { itemid: 'aluminium', amount: 30 },
      { itemid: 'plastic', amount: 60 },
      { itemid: 'rubber', amount: 30 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 10 },
      { itemid: 'refinedplastic', amount: 20 },
      { itemid: 'refinedrubber', amount: 10 },
    ]
  ],
  weight: 15,
  nonStack: true,
  model: '',
  image: 'np_micro-smg.png',
  weapon: true,
  insertFrom: ['subammo', 'subammoPD'],
};

itemList['584646201'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Glock 18C',
  price: 250,
  craft: [
    [
      { itemid: 'aluminium', amount: 80 },
      { itemid: 'plastic', amount: 70 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 25 },
      { itemid: 'refinedplastic', amount: 25 },
    ],
  ],
  weight: 5,
  nonStack: true,
  model: '',
  image: 'np_glock18c.png',
  weapon: true,
  insertFrom: ['pistolammo', 'pistolammoPD'],
};

itemList['-942620673'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Uzi',
  price: 250,
  craft: [
    [
      { itemid: 'aluminium', amount: 30 },
      { itemid: 'plastic', amount: 60 },
      { itemid: 'rubber', amount: 30 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 10 },
      { itemid: 'refinedplastic', amount: 20 },
      { itemid: 'refinedrubber', amount: 10 },
    ]
  ],
  weight: 15,
  nonStack: true,
  model: '',
  image: 'np_micro-smg2.png',
  weapon: true,
  insertFrom: ['subammo', 'subammoPD'],
};

itemList['736523883'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'MP5',
  price: 250,
  craft: [
    [
      { itemid: 'aluminium', amount: 30 },
      { itemid: 'plastic', amount: 60 },
      { itemid: 'rubber', amount: 30 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 10 },
      { itemid: 'refinedplastic', amount: 20 },
      { itemid: 'refinedrubber', amount: 10 },
    ]
  ],
  weight: 15,
  nonStack: true,
  model: '',
  image: 'np_mp5.png',
  weapon: true,
  insertFrom: ['subammo', 'subammoPD'],
};

itemList['1192676223'] = {
  fullyDegrades: false,
  decayrate: 0.75,
  displayname: 'M4',
  price: 10,
  craft: [[
    { itemid: 'aluminium', amount: 50 },
    { itemid: 'plastic', amount: 10 },
    { itemid: 'rubber', amount: 1 },
  ]],
  weight: 25,
  nonStack: true,
  model: '',
  image: 'np_m4.png',
  weapon: true,
  information: 'Equipamento emitido pelo governo (PD/EMS/DOC)',
  insertFrom: ['rifleammo', 'rifleammoPD'],
};

itemList['-1768145561'] = {
  fullyDegrades: false,
  decayrate: 0.75,
  displayname: 'FN SCAR-L',
  price: 10,
  craft: [[
    { itemid: 'aluminium', amount: 50 },
    { itemid: 'plastic', amount: 10 },
    { itemid: 'rubber', amount: 1 },
  ]],
  weight: 25,
  nonStack: true,
  model: '',
  image: 'np_scar.png',
  weapon: true,
  information: 'Equipamento emitido pelo governo (PD/EMS/DOC) - Sujeito a alterações',
  insertFrom: ['rifleammo', 'rifleammoPD'],
};

itemList['-1719357158'] = {
  fullyDegrades: false,
  decayrate: 1.0,
  displayname: 'Mk14',
  price: 550,
  craft: [
    [
      { itemid: 'aluminium', amount: 500 },
      { itemid: 'plastic', amount: 500 },
      { itemid: 'rubber', amount: 500 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 150 },
      { itemid: 'refinedplastic', amount: 150 },
      { itemid: 'refinedrubber', amount: 150 },
    ]
  ],
  weight: 43,
  nonStack: true,
  model: '',
  image: 'np_mk14.png',
  information: 'Equipamento emitido pelo governo (PD/EMS/DOC)',
  weapon: true,
  insertFrom: ['sniperammo'],
};

itemList['100416529'] = {
  fullyDegrades: false,
  decayrate: 1.0,
  displayname: 'M24',
  price: 10,
  craft: [[
    { itemid: 'aluminium', amount: 50 },
    { itemid: 'plastic', amount: 10 },
    { itemid: 'rubber', amount: 1 },
  ]],
  weight: 25,
  nonStack: true,
  model: '',
  image: 'np_m24.png',
  weapon: true,
  insertFrom: ['sniperammo'],
};

itemList['-1536150836'] = {
  fullyDegrades: false,
  decayrate: 1.0,
  displayname: 'AWM',
  price: 10,
  craft: [[
    { itemid: 'aluminium', amount: 50 },
    { itemid: 'plastic', amount: 10 },
    { itemid: 'rubber', amount: 1 },
  ]],
  weight: 25,
  nonStack: true,
  model: '',
  image: 'np_awm.png',
  weapon: true,
  insertFrom: ['sniperammo'],
};

itemList['-90637530'] = {
  fullyDegrades: false,
  decayrate: 1.0,
  displayname: 'Dragunov',
  price: 500,
  craft: [
    [
      { itemid: 'aluminium', amount: 500 },
      { itemid: 'plastic', amount: 500 },
      { itemid: 'rubber', amount: 500 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 150 },
      { itemid: 'refinedplastic', amount: 150 },
      { itemid: 'refinedrubber', amount: 150 },
    ]
  ],
  weight: 43,
  nonStack: true,
  model: '',
  image: 'np_dragunov.png',
  weapon: true,
  insertFrom: ['sniperammo'],
};

itemList['-1074790547'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'AK-47',
  price: 250,
  craft: [
    [
      { itemid: 'aluminium', amount: 500 },
      { itemid: 'plastic', amount: 500 },
      { itemid: 'rubber', amount: 500 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 150 },
      { itemid: 'refinedplastic', amount: 150 },
      { itemid: 'refinedrubber', amount: 150 },
    ]
  ],
  weight: 25,
  nonStack: true,
  model: '',
  image: 'np_assault-rifle.png',
  weapon: true,
  insertFrom: ['rifleammo', 'rifleammoPD'],
};

itemList['497969164'] = {
  fullyDegrades: false,
  decayrate: 3.0,
  displayname: 'M70',
  price: 250,
  craft: [
    [
      { itemid: 'aluminium', amount: 500 },
      { itemid: 'plastic', amount: 500 },
      { itemid: 'rubber', amount: 500 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 150 },
      { itemid: 'refinedplastic', amount: 150 },
      { itemid: 'refinedrubber', amount: 150 },
    ]
  ],
  weight: 20,
  nonStack: true,
  model: '',
  image: 'np_m70.png',
  weapon: true,
  insertFrom: ['rifleammo', 'rifleammoPD'],
};

itemList['-275439685'] = {
  fullyDegrades: false,
  decayrate: 3.0,
  displayname: 'Espingarda Serrada',
  price: 250,
  craft: [[
    { itemid: 'refinedsteel', amount: 50 },
    { itemid: 'refinedcopper', amount: 25 },
    { itemid: 'refinedscrap', amount: 25 },
  ]],
  weight: 14,
  nonStack: true,
  model: '',
  image: 'np_db-shotgun.png',
  weapon: true,
  insertFrom: ['shotgunammo', 'shotgunammoPD'],
};

itemList['487013001'] = {
  fullyDegrades: false,
  decayrate: 3.0,
  displayname: 'IZh-81',
  price: 250,
  craft: [
    [
      { itemid: 'steel', amount: 225 },
      { itemid: 'copper', amount: 150 },
      { itemid: 'scrapmetal', amount: 150 },
    ],
    [
      { itemid: 'refinedsteel', amount: 75 },
      { itemid: 'refinedcopper', amount: 50 },
      { itemid: 'refinedscrap', amount: 50 },
    ]
  ],
  weight: 21,
  nonStack: true,
  model: '',
  image: 'np_izh81.png',
  weapon: true,
  insertFrom: ['shotgunammo', 'shotgunammoPD'],
};

itemList['1432025498'] = {
  fullyDegrades: false,
  decayrate: 1.0,
  displayname: 'Remington 870',
  price: 10,
  craft: [[
    { itemid: 'aluminium', amount: 1 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  weight: 21,
  nonStack: true,
  model: '',
  image: 'np_remington.png',
  weapon: true,
  information: 'Equipamento emitido pelo governo (PD/EMS/DOC)',
  insertFrom: ['shotgunammo', 'shotgunammoPD'],
};

itemList['171789620'] = {
  fullyDegrades: false,
  decayrate: 1.0,
  displayname: 'SIG MPX',
  price: 10,
  craft: [[
    { itemid: 'aluminium', amount: 1 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  weight: 11,
  nonStack: true,
  model: '',
  image: 'np_mpx.png',
  weapon: true,
  information: 'Equipamento emitido pelo governo (PD/EMS/DOC)',
  insertFrom: ['subammo', 'subammoPD'],
};

itemList['1649403952'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Draco NAK9',
  price: 10,
  craft: [
    [
      { itemid: 'aluminium', amount: 300 },
      { itemid: 'steel', amount: 300 },
      { itemid: 'rubber', amount: 300 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 70 },
      { itemid: 'refinedsteel', amount: 70 },
      { itemid: 'refinedrubber', amount: 70 },
    ]
  ],
  weight: 11,
  nonStack: true,
  model: '',
  image: 'np_draco.png',
  weapon: true,
  insertFrom: ['rifleammo', 'rifleammoPD'],
};

itemList['-1472189665'] = {
  fullyDegrades: false,
  decayrate: 1.0,
  displayname: 'Skorpion',
  price: 10,
  craft: [
    [
      { itemid: 'aluminium', amount: 100 },
      { itemid: 'steel', amount: 100 },
      { itemid: 'rubber', amount: 100 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 20 },
      { itemid: 'refinedsteel', amount: 20 },
      { itemid: 'refinedrubber', amount: 20 },
    ]
  ],
  weight: 7,
  nonStack: true,
  model: '',
  image: 'np_skorpion.png',
  weapon: true,
  insertFrom: ['subammo', 'subammoPD'],
};

itemList['-1312131151'] = {
  fullyDegrades: false,
  decayrate: 4.0,
  displayname: 'Rocket Launcher',
  price: 1500,
  weight: 15,
  craft: [[
    { itemid: 'plastic', amount: 2300 },
    { itemid: 'rubber', amount: 2000 },
    { itemid: 'copper', amount: 2500 },
  ]],
  nonStack: true,
  model: '',
  image: 'np_rocketlauncher.png',
  information: 'Accuracy may vary',
  weapon: true,
  insertFrom: ['rpgammo'],
};

/*

  WEAPONS END

*/

/*

  AMMOS START

*/

itemList['subammo'] = {
  fullyDegrades: true,
  decayrate: 1.0,
  displayname: 'Munição Sub',
  craft: [[
    { itemid: 'aluminium', amount: 20 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  price: 100,
  weight: 2,
  nonStack: false,
  model: '',
  image: 'np_sub-ammo.png',
};

itemList['heavyammo'] = {
  fullyDegrades: true,
  decayrate: 1.0,
  displayname: 'Munição Pesada',
  craft: [[
    { itemid: 'aluminium', amount: 1 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  price: 10,
  weight: 2,
  nonStack: false,
  model: '',
  image: 'np_rifle-ammo.png',
};

itemList['sniperammo'] = {
  fullyDegrades: true,
  decayrate: 1.0,
  displayname: 'Munição Sniper',
  craft: [[
    { itemid: 'aluminium', amount: 1 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  price: 10,
  weight: 2,
  nonStack: false,
  model: '',
  image: 'np_sniper-ammo.png',
};

itemList['shotgunammo'] = {
  fullyDegrades: true,
  decayrate: 1.0,
  displayname: 'Munição Espingarda',
  craft: [[
    { itemid: 'refinedsteel', amount: 1 },
    { itemid: 'plastic', amount: 1 },
  ]],
  price: 10,
  weight: 2,
  nonStack: false,
  model: '',
  image: 'np_shotgun-ammo.png',
};

itemList['pistolammo'] = {
  fullyDegrades: true,
  decayrate: 1.0,
  displayname: 'Munição Pistola',
  craft: [
    [
      { itemid: 'aluminium', amount: 1 },
      { itemid: 'plastic', amount: 1 },
      { itemid: 'rubber', amount: 1 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 1 },
    ]
  ],
  price: 10,
  weight: 2,
  blockScrap: true,
  nonStack: false,
  model: '',
  image: 'np_pistol-ammo.png',
};

itemList['rifleammo'] = {
  fullyDegrades: true,
  decayrate: 1.0,
  displayname: 'Munição Rifle',
  craft: [[
    { itemid: 'aluminium', amount: 10 },
    { itemid: 'plastic', amount: 10 },
    { itemid: 'rubber', amount: 10 },
  ]],
  price: 1,
  weight: 2,
  nonStack: false,
  model: '',
  image: 'np_rifle-ammo.png',
  contraband: true,
};

itemList['pistolammoPD'] = {
  fullyDegrades: true,
  decayrate: 0.05,
  displayname: 'Munição PD Pistol',
  craft: [[
    { itemid: 'aluminium', amount: 1 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  price: 1,
  weight: 2,
  nonStack: false,
  model: '',
  information: 'Equipamento emitido pelo governo (PD/EMS/DOC)',
  image: 'np_pistol-ammo.png',
};

itemList['subammoPD'] = {
  fullyDegrades: true,
  decayrate: 0.05,
  displayname: 'Munição PD Sub',
  craft: [[
    { itemid: 'aluminium', amount: 20 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  price: 10,
  weight: 2,
  nonStack: false,
  model: '',
  information: 'Equipamento emitido pelo governo (PD/EMS/DOC)',
  image: 'np_sub-ammo.png',
};

itemList['rifleammoPD'] = {
  fullyDegrades: true,
  decayrate: 0.05,
  displayname: 'Munição PD Rifle',
  craft: [[
    { itemid: 'aluminium', amount: 1 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  price: 10,
  weight: 2,
  nonStack: false,
  model: '',
  image: 'np_rifle-ammo.png',
  information: 'Equipamento emitido pelo governo (PD/EMS/DOC)',
  contraband: true,
};

itemList['shotgunammoPD'] = {
  fullyDegrades: true,
  decayrate: 0.05,
  displayname: 'Munição Espingarda',
  craft: [[
    { itemid: 'aluminium', amount: 1 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  price: 10,
  weight: 2,
  nonStack: false,
  model: '',
  information: 'Equipamento emitido pelo governo (PD/EMS/DOC)',
  image: 'np_shotgun-ammo.png',
};

itemList['taserammo'] = {
  fullyDegrades: true,
  decayrate: 0.1,
  displayname: 'Munição Taser',
  craft: [[
    { itemid: 'aluminium', amount: 1 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  price: 1,
  weight: 1,
  nonStack: false,
  model: '',
  information: 'Equipamento emitido pelo governo (PD/EMS/DOC)',
  image: 'np_taserammo.png',
};

itemList['empammo'] = {
  fullyDegrades: true,
  decayrate: 0.08,
  displayname: 'Munição EMP',
  price: 150,
  weight: 20,
  nonStack: false,
  model: '',
  image: 'np_emp_ammo.png',
};

itemList['nails'] = {
  fullyDegrades: true,
  decayrate: 1.0,
  displayname: 'Unhas',
  craft: [[
    { itemid: 'aluminium', amount: 1 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  price: 10,
  weight: 3,
  nonStack: false,
  model: '',
  image: 'np_nails.png',
};

itemList['paintballs'] = {
  fullyDegrades: true,
  decayrate: 1.0,
  displayname: 'Paintballs',
  craft: [[
    { itemid: 'rubber', amount: 1 },
  ]],
  price: 10,
  weight: 3,
  nonStack: false,
  model: '',
  image: 'np_paintball_ammo.png',
};

itemList['rubberslugs'] = {
  fullyDegrades: true,
  decayrate: 1.0,
  displayname: 'Balas de borracha de calibre 12',
  craft: [[
    { itemid: 'rubber', amount: 1 },
  ]],
  price: 10,
  weight: 3,
  nonStack: false,
  model: '',
  information: 'Equipamento emitido pelo governo (PD/EMS/DOC)',
  image: 'np_rubberslugs.png',
};

itemList['rpgammo'] = {
  fullyDegrades: true,
  decayrate: 4.0,
  displayname: 'RPG',
  craft: [[
    { itemid: 'aluminium', amount: 1500 },
    { itemid: 'plastic', amount: 200 },
    { itemid: 'rubber', amount: 400 },
  ]],
  price: 10,
  weight: 30,
  nonStack: false,
  model: '',
  image: 'np_rpgammo.png',
};

/*

  AMMOS END

*/

/*

  ATTACHMENTS START

*/

itemList['weapon_silencer_pistol'] = {
  fullyDegrades: false,
  decayrate: 0.5,
  displayname: 'Silenciador de pistola',
  price: 1500,
  weight: 15,
  craft: [[
    { itemid: 'copper', amount: 50 },
    { itemid: 'rubber', amount: 50 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_ssilencer.png',
  information: 'Um silenciador designado para utilização em algumas pistolas.',
};

itemList['weapon_oil_silencer'] = {
  fullyDegrades: false,
  decayrate: 0.1,
  displayname: 'Filtro de óleo',
  price: 500,
  weight: 15,
  craft: [
    [
      { itemid: 'aluminium', amount: 20 },
      { itemid: 'steel', amount: 20 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 4 },
      { itemid: 'refinedsteel', amount: 4 },
    ]
  ],
  nonStack: false,
  model: '',
  image: 'np_oil_can_supp.png',
  information: 'Filtro de óleo velho e usado. Não parece durar muito.',
};

itemList['weapon_silencer_assault'] = {
  fullyDegrades: false,
  decayrate: 0.5,
  displayname: 'Silenciador de rifle',
  price: 1500,
  weight: 15,
  craft: [[
    { itemid: 'copper', amount: 110 },
    { itemid: 'rubber', amount: 110 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_silencerbig.png',
  information: 'Silenciador designado para utilização em alguns rifles.',
};

itemList['weapon_scope'] = {
  fullyDegrades: false,
  decayrate: 1.0,
  displayname: 'Mira de Armamento',
  price: 1500,
  weight: 15,
  craft: [[
    { itemid: 'plastic', amount: 200 },
    { itemid: 'rubber', amount: 200 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_lscope.png',
  information: 'Mira projetada para uso em algumas armas.',
};

itemList['weapon_uzi_extended'] = {
  fullyDegrades: false,
  decayrate: 0.5,
  displayname: 'Pente estendido de UZI',
  price: 1500,
  weight: 15,
  craft: [
    [
      { itemid: 'aluminium', amount: 80 },
      { itemid: 'steel', amount: 80 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 20 },
      { itemid: 'refinedsteel', amount: 20 },
    ]
  ],
  nonStack: false,
  model: '',
  image: 'np_uzi_extended.png',
  information: 'Só cabe em uma UZI.',
};

itemList['weapon_uzi_foldstock'] = {
  fullyDegrades: false,
  decayrate: 1.0,
  displayname: 'Estabilizador de UZI',
  price: 1500,
  weight: 5,
  craft: [
    [
      { itemid: 'aluminium', amount: 40 },
      { itemid: 'rubber', amount: 40 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 10 },
      { itemid: 'refinedrubber', amount: 10 },
    ]
  ],
  nonStack: false,
  model: '',
  image: 'np_uzi_fold_stock.png',
  information: 'Só cabe em uma UZI.',
};

itemList['weapon_uzi_woodstock'] = {
  fullyDegrades: false,
  decayrate: 1.0,
  displayname: 'Estabilizador de madeira de UZI',
  price: 1500,
  weight: 5,
  craft: [
    [
      { itemid: 'aluminium', amount: 40 },
      { itemid: 'rubber', amount: 40 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 10 },
      { itemid: 'refinedrubber', amount: 10 },
    ]
  ],
  nonStack: false,
  model: '',
  image: 'np_uzi_wooden_stock.png',
  information: 'Só cabe em uma UZI.',
};

/*

  ATTACHMENTS END

*/

/*

  FOODS START

*/

itemList['hamburger'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Hamburger',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_hamburger.png',
  information: 'Hmmmm',
};

itemList['sandwich'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  craft: [[{ itemid: 'foodingredient', amount: 1 }]],
  displayname: 'Sanduíche',
  price: 8,
  weight: 5,
  nonStack: false,
  model: '',
  image: 'np_sandwich.png',
  information: 'Hmmmm',
};

itemList['donut'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Donut',
  craft: [[{ itemid: 'foodingredient', amount: 2 }]],
  price: 10,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_donut.png',
  information: 'Para adoçar',
};

itemList['eggsbacon'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Bacon com ovos',
  craft: [[{ itemid: 'foodingredient', amount: 1 }]],
  price: 50,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_eggs-and-bacon.png',
  information: 'O café da manhã perfeito',
};

itemList['cookie'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Cookie',
  craft: [[{ itemid: 'foodingredient', amount: 1 }]],
  price: 2,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_cookie.png',
  information: 'Assado com amor',
};

itemList['muffin'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Bolinho',
  craft: [[{ itemid: 'foodingredient', amount: 1 }]],
  price: 10,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_muffin.png',
  information: 'Hmmm amanteigado',
};

itemList['taco'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Taco',
  craft: [[{ itemid: 'foodingredient', amount: 1 }]],
  price: 20,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_taco.png',
  information: 'Original dos chicanos.',
};

itemList['burrito'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Burrito',
  craft: [[{ itemid: 'foodingredient', amount: 1 }]],
  price: 20,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_burrito.png',
  information: 'Orale',
};

itemList['fishtaco'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Taco de peixe',
  craft: [[{ itemid: 'foodingredient', amount: 1 }]],
  price: 50,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_fishtaco.png',
  information: 'Peculiar.',
};

itemList['fries'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Batatas fritas',
  price: 10,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_fries.png',
  information: 'Sacia a fome e engrossa o sangue',
};

itemList['jailfood'] = {
  fullyDegrades: true,
  decayrate: 0.001,
  displayname: 'Comida de cadeia',
  price: 0,
  weight: 25,
  nonStack: false,
  model: '',
  image: 'np_jailfood.png',
  information: "Parece tão ruim quanto a mira do xerife.",
};

itemList['bleederburger'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'O Sangrento',
  price: 20,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_the-bleeder.png',
  information: 'Parece cru, mas acho que está bom.',
};

itemList['heartstopper'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'O Monstro',
  price: 20,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_the-heart-stopper.png',
  information: 'Quantas pessoas isso alimenta?',
};

itemList['torpedo'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Torpedo',
  price: 20,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_torpedo.png',
  information: 'Hmmm.',
};

itemList['meatfree'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Vegetariano',
  price: 20,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_meat-free.png',
  information: 'Isso aí é carne de soja?',
};

itemList['moneyshot'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Money Shot',
  price: 20,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_money-shot.png',
  information: 'Lanche dos real Gs.',
};

itemList['churro'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Churro',
  craft: [[{ itemid: 'foodingredient', amount: 1 }]],
  price: 50,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_churro.png',
  information: 'Basicamente um donut comprido. Levanta a glicose.',
};

itemList['hotdog'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Hot Dog',
  craft: [[{ itemid: 'foodingredient', amount: 1 }]],
  price: 50,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_hotdog.png',
  information: 'O que tem dentro?',
};

itemList['chocobar'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Barra de chocolate',
  craft: [[{ itemid: 'foodingredient', amount: 1 }]],
  price: 6,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_chocolate-bar.png',
  information: 'Hmm...Meteorite',
};

itemList['icecream'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Sorvete',
  craft: [[{ itemid: 'foodingredient', amount: 1 }]],
  price: 50,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_icecream.png',
  information: 'Chilling.',
};

itemList['pizza'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Pizza Slice',
  craft: [[{ itemid: 'foodingredient', amount: 2 }]],
  price: 1,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_pizza-slice.png',
  information: 'Check for pineapple',
};

itemList['pizzabox'] = {
  fullyDegrades: true,
  decayrate: 0.5,
  displayname: 'Pizza Box',
  price: 0,
  weight: 11,
  nonStack: true,
  model: '',
  image: 'np_pizza_box.png',
  information: 'Oven Fresh!',
};

itemList['spaghetti'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Spaghetti',
  price: 150,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_spaghetti.png',
  information: 'Knees weak...',
};

/*

  FOODS END

*/

/*

  DRINKS START

*/

itemList['water'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Água',
  price: 4,
  weight: 1,
  craft: [[{ itemid: 'foodingredient', amount: 1 }]],
  nonStack: false,
  model: '',
  image: 'np_water.png',
  information: 'Mata a sede.',
};

itemList['cola'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Cola',
  price: 7,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_coke.png',
  information: 'Mata a sede.',
};

itemList['greencow'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Green Cow',
  craft: [[{ itemid: 'foodingredient', amount: 1 }]],
  price: 50,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_green-cow.png',
  information: 'Não te dá asas.',
};

itemList['slushy'] = {
  fullyDegrades: false,
  illegal: true,
  decayrate: 0.0,
  displayname: 'A melhor lama',
  price: 0,
  weight: 15,
  nonStack: false,
  model: '',
  image: 'np_slushy.png',
  information: 'A única coisa na cadeia que tem um gosto bom.',
};

itemList['coffee'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Café',
  craft: [[{ itemid: 'foodingredient', amount: 2 }]],
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_coffee.png',
  information: 'Cuidado, está quente.',
};

itemList['frappuccino'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Frappuccino',
  craft: [[{ itemid: 'foodingredient', amount: 2 }]],
  price: 10,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_frappuccino.png',
  information: 'Hmm',
};

itemList['latte'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Latte',
  craft: [[{ itemid: 'foodingredient', amount: 2 }]],
  price: 10,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_latte.png',
  information: 'Coisa de rico',
};

itemList['softdrink'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Bebida suave',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'softdrink2.png',
  information: 'Mata a sede e a vontade de comer um doce.',
};

itemList['mshake'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Milkshake',
  craft: [[{ itemid: 'foodingredient', amount: 1 }]],
  price: 10,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_milkshake.png',
  information: 'Hmm',
};

itemList['bscoffee'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Café barato',
  price: 15,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_bscoffee.png',
  information: 'Tem gosto de terra, mas tem a cafeína que você precisa.',
};

itemList['jaildrink'] = {
  fullyDegrades: true,
  decayrate: 0.001,
  displayname: 'Bebida de cadeia',
  price: 0,
  weight: 10,
  nonStack: false,
  model: '',
  image: 'np_jaildrink.png',
  information: "Parece tão ruim quanto a mira do chefe de polícia.",
};

itemList['sprunk'] = {
  fullyDegrades: false,
  decayrate: 0.01,
  displayname: 'Sprunk',
  price: 9,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_sprunk.png',
  information: 'A essência da vida',
};

itemList['fruitslushy'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Suco de Frutas',
  price: 0,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_fruit_slushy.png',
  information: 'O mais frutado de todos.',
};

/*

  DRINKS END

*/

/*

  ALCOHOLS START

*/

itemList['vodka'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Vodka',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_vodka.png',
  information: 'Substitui qualquer refeição',
};

itemList['beer'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Cerveja',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_beer.png',
  information: 'Só mais uma...',
};

itemList['whiskey'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Whiskey',
  price: 5,
  weight: 5,
  nonStack: false,
  model: '',
  image: 'np_whiskey.png',
  information: 'Para alguns, suave.',
};

itemList['absinthe'] = {
  fullyDegrades: true,
  illegal: true,
  decayrate: 0.3,
  displayname: 'Absinto',
  craft: [[
    { itemid: 'glass', amount: 1 },
    { itemid: 'moonshine', amount: 1 },
  ]],
  price: 200,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_absinthe.png',
  information: 'A bebida mais forte, 95%.',
};

itemList['drink1'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Vodka cítrica',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'orange', amount: 1 },
    { itemid: 'lemon', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_drink1.png',
  information: 'Uma escolha perfeita de happy hour.',
};

itemList['drink2'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Bebida de cereja',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'cherry', amount: 1 },
    { itemid: 'strawberry', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_drink2.png',
  information: ' Felicidade líquida.',
};

itemList['drink3'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Drink de banana com pêssego',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'banana', amount: 1 },
    { itemid: 'peach', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_drink3.png',
  information: 'Tem gosto de chiclete de fruta.',
};

itemList['drink4'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Drink de laranja com banana',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'orange', amount: 1 },
    { itemid: 'banana', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_drink4.png',
  information: 'Alguma doçura para o seu dia.',
};

itemList['drink5'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Bebida de Cereja com Kiwi',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'cherry', amount: 1 },
    { itemid: 'kiwi', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_drink5.png',
  information: 'Frutado e refrescante.',
};

itemList['drink6'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Bebida de amora e melancia',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'strawberry', amount: 1 },
    { itemid: 'watermelon', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_drink6.png',
  information: 'Legal, doce e colorido.',
};

itemList['drink7'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Bebida de limão com maçã',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'lime', amount: 1 },
    { itemid: 'apple', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_polarbear.png',
  information: 'Inibe o desejo por doces.',
};

itemList['drink8'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Bebida de Pêssego com Cereja',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'cherry', amount: 1 },
    { itemid: 'peach', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_rumcoke.png',
  information: 'Perfeito para se refrescar em dias quentes.',
};

itemList['drink9'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Bebida de côco com limão',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'coconut', amount: 1 },
    { itemid: 'lime', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_straightvodka.png',
  information: 'Mistura com um toque de ilha.',
};

itemList['drink10'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Pata branca',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'grapes', amount: 1 },
    { itemid: 'watermelon', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_whitepaw.png',
  information: 'Desfrute na sua varanda admirando as estrelas.',
};

itemList['shot1'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Bebida de laranja com limão',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'orange', amount: 1 },
    { itemid: 'lemon', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_shot1.png',
  information: 'Ácido.',
};

itemList['shot2'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Bebida de cereja com morango',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'cherry', amount: 1 },
    { itemid: 'strawberry', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_shot2.png',
  information: 'Doce demais.',
};

itemList['shot3'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Mistura de banana com pêssego',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'banana', amount: 1 },
    { itemid: 'peach', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_shot3.png',
  information: 'É, mata a sede.',
};

itemList['shot4'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Mistura de laranja com Banana',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'orange', amount: 1 },
    { itemid: 'banana', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_shot4.png',
  information: 'Docinho e azedo.',
};

itemList['shot5'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Mistura de cereja com kiwi',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'cherry', amount: 1 },
    { itemid: 'kiwi', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_shot5.png',
  information: 'Coisa boa.',
};

itemList['shot6'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Mistura de melancia com morango',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'strawberry', amount: 1 },
    { itemid: 'watermelon', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_shot6.png',
  information: 'Vermelhidão doce.',
};

itemList['shot7'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Mistura maçã-limão',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'lime', amount: 1 },
    { itemid: 'apple', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_shot7.png',
  information: 'Mata a sede.',
};

itemList['shot8'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Bebidinha de cereja com pêssego',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'cherry', amount: 1 },
    { itemid: 'peach', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_shot8.png',
  information: 'Mata a vontade de um drink doce.',
};

itemList['shot9'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Mistura de côco com limão',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'coconut', amount: 1 },
    { itemid: 'lime', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_shot9.png',
  information: 'Mistura quase perfeita.',
};

itemList['shot10'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Bebida de uva com melancia',
  price: 150,
  weight: 1,
  craft: [[
    { itemid: 'grapes', amount: 1 },
    { itemid: 'watermelon', amount: 1 },
    { itemid: 'vodka', amount: 1 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_shot10.png',
  information: 'Ah, meu favorito!',
};

itemList['wineglass'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Taça de Vinho',
  price: 1,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_glass-wine.png',
  information: 'Quite exquisite',
};

/*

  ALCOHOLS END

*/

/*

  FRUITS START

*/

itemList['apple'] = {
  fullyDegrades: false,
  illegal: false,
  decayrate: 0.75,
  displayname: 'Maçã',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_apple.png',
  information: '',
};

itemList['banana'] = {
  fullyDegrades: false,
  illegal: false,
  decayrate: 0.75,
  displayname: 'Banana',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_banana.png',
  information: '',
};

itemList['cherry'] = {
  fullyDegrades: false,
  illegal: false,
  decayrate: 0.75,
  displayname: 'Cereja',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_cherry.png',
  information: '',
};

itemList['coconut'] = {
  fullyDegrades: false,
  illegal: false,
  decayrate: 0.75,
  displayname: 'Côco',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_coconut.png',
  information: '',
};

itemList['grapes'] = {
  fullyDegrades: false,
  illegal: false,
  decayrate: 0.75,
  displayname: 'Uva',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_grapes.png',
  information: '',
};

itemList['kiwi'] = {
  fullyDegrades: false,
  illegal: false,
  decayrate: 0.75,
  displayname: 'Kiwi',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_kiwi.png',
  information: '',
};

itemList['lemon'] = {
  fullyDegrades: false,
  illegal: false,
  decayrate: 0.75,
  displayname: 'Limão',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_lemon.png',
  information: '',
};

itemList['lime'] = {
  fullyDegrades: false,
  illegal: false,
  decayrate: 0.75,
  displayname: 'Lima',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_lime.png',
  information: '',
};

itemList['orange'] = {
  fullyDegrades: false,
  illegal: false,
  decayrate: 0.75,
  displayname: 'Laranja',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_orange.png',
  information: '',
};

itemList['peach'] = {
  fullyDegrades: false,
  illegal: false,
  decayrate: 0.75,
  displayname: 'Pêssego',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_peach.png',
  information: '',
};

itemList['potato'] = {
  fullyDegrades: false,
  illegal: false,
  decayrate: 0.75,
  displayname: 'Batata',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_potato.png',
  information: '',
};

itemList['strawberry'] = {
  fullyDegrades: false,
  illegal: false,
  decayrate: 0.75,
  displayname: 'Morango',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_strawberry.png',
  information: '',
};

itemList['watermelon'] = {
  fullyDegrades: false,
  illegal: false,
  decayrate: 0.75,
  displayname: 'Melancia',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_watermelon.png',
  information: '',
};

/*

  FRUITS END

*/

/*

  InGREDIENTS START

*/

itemList['foodingredient'] = {
  fullyDegrades: true,
  decayrate: 0.05,
  displayname: 'Ingredientes',
  price: 10,
  weight: 5,
  nonStack: false,
  model: '',
  image: 'np_ingredients.png',
  information: 'Usado em várias receitas - Cuidado com a validade!',
};

itemList['cheese'] = {
  fullyDegrades: true,
  decayrate: 0.05,
  displayname: 'Queijo',
  price: 1,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_ingredients_cheese.png',
  information: 'Usado em várias receitas - Cuidado com a validade!',
};

itemList['lettuce'] = {
  fullyDegrades: true,
  decayrate: 0.05,
  displayname: 'Alface',
  price: 1,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_ingredients_lettuce.png',
  information: 'Usado em várias receitas - Cuidado com a validade!',
};

itemList['freshmeat'] = {
  fullyDegrades: true,
  decayrate: 0.05,
  displayname: 'Carne fresca',
  craft: [[{ itemid: 'foodingredient', amount: 1 }]],
  price: 10,
  weight: 2,
  nonStack: false,
  model: '',
  image: 'np_rawmeat.png',
  information: 'Direto do açougue.',
};

itemList['hfcs'] = {
  fullyDegrades: true,
  decayrate: 0.05,
  displayname: 'Charope de frutose',
  price: 1,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_ingredients_hfcs.png',
  information: 'Usado em várias misturinhas - Cuidado com a validade!',
};

itemList['milk'] = {
  fullyDegrades: true,
  decayrate: 0.05,
  displayname: 'Leite',
  price: 1,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_ingredients_milk.png',
  information: 'Usado em várias receitas - Cuidado com a validade!',
};

itemList['icecreamingred'] = {
  fullyDegrades: true,
  decayrate: 0.05,
  displayname: 'Ingredientes de Sorvete',
  price: 1,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_ingredients_icecream.png',
  information: 'Usado em várias receitas - Cuidado para não deixar derreter!',
};

itemList['tomato'] = {
  fullyDegrades: true,
  decayrate: 0.05,
  displayname: 'Tomate',
  price: 1,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_ingredients_tomato.png',
  information: 'Usado em várias receitas - Cuidado com a validade!',
};

/*

  InGREDIENTS END

*/

/*

  DRUGS START

*/

itemList['weedq'] = {
  fullyDegrades: true,
  illegal: true,
  decayrate: 0.3,
  displayname: 'Weed Q',
  craft: [[{ itemid: 'weedoz', amount: 0.25 }]],
  price: 65,
  weight: 2,
  nonStack: false,
  model: '',
  image: 'np_weed-oz.png',
  information: 'Relaxante...',
  contraband: true,
};

itemList['rollingpaper'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Seda',
  price: 1,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_rolling-paper.png',
  information: 'Para bolar umzinho.',
};

itemList['joint'] = {
  fullyDegrades: true,
  illegal: true,
  decayrate: 0.2,
  displayname: 'Baseado de 1g',
  craft: [[
    { itemid: 'weedq', amount: 0.5 },
    { itemid: 'rollingpaper', amount: 1 },
  ]],
  price: 25,
  weight: 2,
  nonStack: false,
  model: '',
  image: 'np_joint.png',
  information: 'É um fino, cara. ',
  contraband: true,
};

itemList['codein'] = {
  fullyDegrades: true,
  illegal: true,
  decayrate: 0.3,
  displayname: 'Codeína',
  price: 200,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_codein.png',
  information: 'Cuidado para não exagerar.',
  contraband: true,
};

itemList['anfetamina'] = {
  fullyDegrades: true,
  illegal: true,
  decayrate: 0.3,
  displayname: 'Anfetamina',
  price: 200,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'ogs-anfetamina.png',
  information: 'Isso me parece químico.',
  contraband: true,
};

itemList['lean'] = {
  fullyDegrades: true,
  illegal: true,
  decayrate: 0.3,
  displayname: 'Lean',
  price: 200,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_lean.png',
  information: 'Não deve viciar, né?',
  contraband: true,
  craft: [[
    { itemid: 'codein', amount: 1 },
    { itemid: 'sprunk', amount: 1 },
  ]],
};

itemList['1gcocaine'] = {
  fullyDegrades: true,
  illegal: true,
  decayrate: 0.5,
  displayname: 'Cocaína 1g',
  price: 100,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_cocaine-baggy.png',
  information: 'Parece da boa. ',
  contraband: true,
};

itemList['1gmeta'] = {
  fullyDegrades: true,
  illegal: true,
  decayrate: 0.5,
  displayname: 'Metafetamina 1g',
  price: 100,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_crack.png',
  information: 'Faz mal experimentar?',
  contraband: true,
  craft: [[
    { itemid: 'anfetamina', amount: 1 },
    { itemid: 'coffee', amount: 1 },
  ]],
};

itemList['maleseed'] = {
  fullyDegrades: true,
  decayrate: 0.75,
  displayname: 'Semente Macho de Marijuana',
  price: 100,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_weed-seed.png',
  information: 'Qual a diferença dessa semente pra outra?',
  contraband: true,
};

itemList['femaleseed'] = {
  fullyDegrades: true,
  decayrate: 0.75,
  displayname: 'Semente Fêmea de Marijuana',
  price: 100,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_weed-seed.png',
  information: 'É só plantar',
  contraband: true,
};

/*

  DRUGS END

*/

/*

  POLICE START

*/

itemList['spikes'] = {
  fullyDegrades: true,
  decayrate: 1.0,
  displayname: 'PD Spike Kit',
  price: 69,
  weight: 40,
  nonStack: false,
  model: '',
  image: 'np_spikes.png',
  information: 'Equipamento policial (dura pouco tempo).',
};

itemList['pdarmor'] = {
  fullyDegrades: true,
  decayrate: 0.25,
  displayname: 'Colete de torso',
  craft: [[
    { itemid: 'aluminium', amount: 1 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  price: 50,
  weight: 37,
  nonStack: false,
  model: '',
  image: 'np_chest-armor.png',
  information: 'Equipamento emitido pelo governo (PD/EMS/DOC).',
};

itemList['IFAK'] = {
  fullyDegrades: false,
  decayrate: 0.1,
  displayname: 'IFAK',
  price: 8,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'ifak.png',
  information: 'Equipamento emitido pelo governo (PD/EMS/DOC).',
};

itemList['pdbadge'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Distintivo PD',
  price: 0,
  weight: 0,
  nonStack: true,
  model: '',
  image: 'np_pd_badge.png',
};

itemList['gatheringkit'] = {
  fullyDegrades: false,
  decayrate: 0.25,
  displayname: 'Kit Detetive',
  price: 1500,
  weight: 15,
  craft: [[
    { itemid: 'plastic', amount: 100 },
    { itemid: 'rubber', amount: 100 },
  ]],
  nonStack: false,
  model: '',
  image: 'np_cleaning-goods.png',
  information: 'Usado para coletar evidências.',
};

itemList['np_evidence_marker_yellow'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Evidência Amarela',
  price: 0,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'np_evidence_marker_yellow.png',
};

itemList['np_evidence_marker_red'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Evidência Vermelha',
  price: 0,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'np_evidence_marker_red.png',
};

itemList['np_evidence_marker_white'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Evidência Branca',
  price: 0,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'np_evidence_marker_white.png',
};

itemList['np_evidence_marker_orange'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Evidência Laranja',
  price: 0,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'np_evidence_marker_orange.png',
};

itemList['np_evidence_marker_light_blue'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Evidência Azul',
  price: 0,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'np_evidence_marker_light_blue.png',
};

itemList['np_evidence_marker_purple'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Evidência Roxa',
  price: 0,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'np_evidence_marker_purple.png',
};

itemList['pdevidencebag'] = {
  fullyDegrades: false,
  decayrate: 0,
  displayname: 'Evidence Bag',
  price: 10,
  weight: 10,
  nonStack: true,
  model: '',
  image: 'np_evidence_bag.png',
};

itemList['dnaswab'] = {
  fullyDegrades: false,
  decayrate: 0,
  displayname: 'DNA Swab',
  price: 10,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'ogs_cotonete.png',
};

/*

  POLICE END

*/

/*

  PAWNSHOP END

*/

itemList['stolenrolexwatch'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  isStolen: true,
  displayname: 'Relógio Rolex',
  price: 50,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_rolex-watch.png',
};

itemList['stolen10ctchain'] = {
  fullyDegrades: false,
  isStolen: true,
  decayrate: 0.0,
  displayname: 'Corrente de ouro',
  price: 2230,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_10ct-gold-chain.png',
};

itemList['stolenring'] = {
  fullyDegrades: false,
  isStolen: true,
  decayrate: 0.0,
  displayname: 'Anel de noivado',
  price: 15,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_wedding-ring.png',
};

itemList['stolenlaptop'] = {
  fullyDegrades: false,
  isStolen: true,
  decayrate: 0.0,
  displayname: 'Notebook',
  price: 15,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_pixellaptop.png',
};

/*

  PAWNSHOP END

*/

/*

  MISC START

*/

itemList['ciggy'] = {
  fullyDegrades: true,
  decayrate: 0.2,
  displayname: 'Cigarro',
  price: 1,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_cigarette.png',
};

itemList['cigar'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Charuto',
  price: 30,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_cigar.png',
};

itemList['summonablepet'] = {
  _name: 'summonablepet',
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Animal de estimação',
  price: 100,
  weight: 11,
  nonStack: true,
  model: '',
  image: 'np_p_rott.png',
  information: "Chame seu bichinho.",
};

itemList['repairkit'] = {
  fullyDegrades: true,
  decayrate: 0.25,
  displayname: 'Kit de reparo',
  craft: [[{ itemid: 'electronics', amount: 25 }]],
  price: 100,
  weight: 10,
  nonStack: false,
  model: '',
  image: 'np_basic_repair-kit.png',
};

itemList['repairkitbennys'] = {
  fullyDegrades: true,
  decayrate: 0.25,
  displayname: 'Kit de reparo (Bennys)',
  craft: [[{ itemid: 'electronics', amount: 25 }]],
  price: 150,
  weight: 5,
  nonStack: false,
  model: '',
  image: 'np_basic_repair-kit-bennys.png',
};

itemList['wheelchair'] = {
  fullyDegrades: true,
  decayrate: 1.0,
  displayname: 'Cadeira de rodas',
  price: 250,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_wheelchair.png',
  information: 'Cuidado ao pilotar.',
};

itemList['armor'] = {
  fullyDegrades: true,
  decayrate: 0.25,
  displayname: 'Colete de torso',
  craft: [[
    { itemid: 'aluminium', amount: 5 },
    { itemid: 'plastic', amount: 5 },
    { itemid: 'rubber', amount: 5 },
  ]],
  price: 1,
  weight: 37,
  nonStack: false,
  model: '',
  image: 'np_chest-armor.png',
  information: 'Protege você de sangramento e outras lesões.',
};

itemList['cashroll'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Rolo de dinheiro',
  price: 1,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_cash-roll.png',
  information: 'Quanto tem aqui..',
};

itemList['cashstack'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Pilha de dinheiro',
  price: 1,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_cash-stack.png',
  information: 'Notas novinhas.',
};

itemList['band'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Trocados',
  price: 1,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_cash-stack.png',
  information: 'Só notas trocadas...Quem anda com dinheiro assim?',
};

itemList['rollcash'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Rolo de notas pequenas',
  price: 1,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_cash-roll.png',
  information: 'Só notas trocadas...Quem anda com dinheiro assim?',
};

itemList['binoculars'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Binóculos',
  craft: [[
    { itemid: 'aluminium', amount: 5 },
    { itemid: 'plastic', amount: 1 },
    { itemid: 'rubber', amount: 1 },
  ]],
  price: 1,
  weight: 10,
  nonStack: false,
  model: '',
  image: 'np_binoculars.png',
};

itemList['blindfold'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Venda',
  price: 250,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_blindfold.png',
};

itemList['camera'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Nikea NP1000',
  price: 1,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_camera.png',
  information: 'Parece ser de boa qualidade.',
};

itemList['hairtie'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Presilha de cabelo',
  price: 5,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_hairtie.png',
  information: 'Útil.',
};

itemList['idcard'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Identidade',
  price: 500,
  weight: 0,
  nonStack: true,
  model: '',
  image: 'np_citizen-card.png',
};

itemList['phonebox'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Caixa de Celular',
  price: 200,
  weight: 2,
  nonStack: true,
  model: '',
  image: 'phone_box.png',
  information: 'Abra para pegar o celular',
};

itemList['phoneboxempty'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Caixa de Celular Vazia',
  price: 1,
  weight: 2,
  nonStack: true,
  model: '',
  image: 'phone_box_empty.png',
  information: 'Isso aqui não vale nada',
};

itemList['lighter'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Isqueiro',
  price: 5,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_lighter.png',
  information: 'Cuidado ao utilizar. ',
};

itemList['mobilephone'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Celular',
  price: 200,
  craft: [
    [
      { itemid: 'electronics', amount: 10 },
    ]
  ],
  weight: 5,
  nonStack: true,
  model: '',
  image: 'np_mobile-phone.png',
};

itemList['lockpick'] = {
  fullyDegrades: false,
  decayrate: 2.0,
  displayname: 'Lockpick',
  craft: [
    [
      { itemid: 'aluminium', amount: 5 },
      { itemid: 'plastic', amount: 3 },
      { itemid: 'rubber', amount: 3 },
    ],
    [
      { itemid: 'refinedaluminium', amount: 2 },
    ]
  ],
  price: 80,
  weight: 1,
  nonStack: false,
  model: '',
  information: 'Destranca coisas.',
  image: 'np_lockpick-set.png',
};

itemList['okaylockpick'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Lockpick de merda',
  price: 0,
  craft: [[{ itemid: 'shitlockpick', amount: 100 }]],
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_shitlockpick.png',
  information: 'Porcaria, talvez é melhorar descartar.',
};

itemList['shitlockpick'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Lockpick pesado',
  price: 0,
  craft: [[{ itemid: 'jailfood', amount: 1 }]],
  weight: 1,
  nonStack: false,
  model: '',
  image: 'np_shitlockpick.png',
  information:
    'Mal cabe no bolso.',
};

itemList['radio'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'PD Radio',
  craft: [[
    { itemid: 'electronics', amount: 30 },
    { itemid: 'plastic', amount: 5 },
    { itemid: 'rubber', amount: 1 },
  ]],
  price: 1,
  weight: 5,
  nonStack: true,
  blockScrap: true,
  model: '',
  image: 'np_radio.png',
  information: 'Criptografado - Usado para conversar com outras pessoas em canais de rádio PD.',
};

itemList['delivery_taco'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Entrega',
  price: 10,
  weight: 5,
  nonStack: false,
  model: '',
  image: 'np_food_bag.png',
};

itemList['delivery_supply'] = {
  fullyDegrades: true,
  decayrate: 0.01,
  displayname: 'Suprimentos de Loja',
  price: 20,
  weight: 5,
  nonStack: false,
  model: '',
  image: 'np_box.png',
};

itemList['megaphone'] = {
  fullyDegrades: true,
  decayrate: 1.0,
  displayname: 'Megaphone',
  price: 25,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'np_megaphone.png',
  information: '',
  deg: true
}

itemList['fertilizer'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Fertilizante',
  price: 20,
  weight: 3,
  nonStack: false,
  model: '',
  image: 'np_fertilizer.png',
  information: 'Não tem instrução na embalagem.',
};

itemList['spray'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Spray',
  price: 150,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'ogs_spray.png',
};

itemList['sprayremover'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Removedor de Spray',
  price: 50,
  weight: 1,
  nonStack: false,
  model: '',
  image: 'ogs_sprayremover.png',
};

itemList['custommiscitem'] = {
  _name: 'custommiscitem',
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Item',
  price: 1,
  weight: 1.0,
  nonStack: false,
  model: '',
  image: 'np_placeholder.png',
  information: '',
  deg: false,
};

itemList['musicwalkman'] = {
  fullyDegrades: true,
  decayrate: 1.0,
  displayname: 'Walkman',
  price: 100,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'np_walkman.png',
  information: '',
  craft: [[
    { itemid: 'genericelectronicpart', amount: 1 },
  ]],
}

itemList['musictape'] = {
  fullyDegrades: true,
  decayrate: 1.0,
  displayname: 'Fita de Música',
  price: 1,
  weight: 0,
  nonStack: false,
  model: '',
  image: 'np_cassette.png',
};

/*

  MISC END

*/

/*

  CLOTHES START

*/

itemList['mask'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Máscara',
  craft: [],
  price: 10,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'np_mask.png',
  information: '',
};

itemList['googles'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Óculos',
  craft: [],
  price: 10,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'np_oakley-sunglasses.png',
  information: '',
};

itemList['hat'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Chapéu',
  craft: [],
  price: 10,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'np_hat.png',
  information: '',
};

itemList['chain'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Corrente',
  craft: [],
  price: 10,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'np_5ct-gold-chain.png',
  information: '',
};

itemList['vest'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Colete',
  craft: [],
  price: 10,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'ogs_vest.png',
  information: '',
};

itemList['jacket'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Jaqueta',
  craft: [],
  price: 10,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'ogs_jacket.png',
  information: '',
};

itemList['shirt'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Camisa',
  craft: [],
  price: 10,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'ogs_shirt.png',
  information: '',
};

itemList['backpack'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Mochila',
  craft: [],
  price: 10,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'ogs_backpack.png',
  information: '',
};

itemList['pants'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Calça',
  craft: [],
  price: 10,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'ogs_pants.png',
  information: '',
};

itemList['shoes'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Tênis',
  craft: [],
  price: 10,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'np_stolenshoes.png',
  information: '',
};

itemList['watch'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Relógio',
  craft: [],
  price: 10,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'np_casio-watch.png',
  information: '',
};

itemList['braclets'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Pulseira',
  craft: [],
  price: 10,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'ogs_braclets.png',
  information: '',
};

itemList['earrings'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Brincos',
  craft: [],
  price: 10,
  weight: 1,
  nonStack: true,
  model: '',
  image: 'ogs_earrings.png',
  information: '',
};

/*

  CLOTHES END

*/

/*

  TCG START

*/

itemList['tcgcard'] = {
  _name: 'tcgcard',
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Carta',
  price: 1,
  weight: 0.0,
  nonStack: true,
  model: '',
  image: 'ogs_tcgcard.png',
  information: 'Um cartão colecionável.',
  deg: false,
};

itemList['tcgpack_ogs'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Pacote de Cartas',
  price: 1,
  weight: 0.0,
  nonStack: false,
  model: '',
  image: 'ogs_tcgbooster.png',
  information: 'Pacote containing 5 cartas colecionáveis.',
  deg: false,
};

itemList['tcgbinder'] = {
  fullyDegrades: false,
  decayrate: 0.0,
  displayname: 'Fichário',
  price: 1,
  weight: 10.0,
  nonStack: true,
  model: '',
  image: 'ogs_tcgbinder.png',
  information: 'Um fichário para guardar todas as suas cartas colecionáveis.',
  deg: false,
};

/*

  TCG END

*/

/*

  VEHICLES START

*/

//X CLASS REPAIR PARTS
itemList['xfixbrake'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças de freio (X)',
  craft: [[
    { itemid: 'xgenericmechanicpart', amount: 5 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_brake_parts_x.png',
  information: 'Novos discos de freio, pastilhas, pinças, cubos e acessórios.',
};

itemList['xfixaxle'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Eixo (X)',
  craft: [[
    { itemid: 'xgenericmechanicpart', amount: 5 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_axle_parts_x.png',
  information: 'Novos componentes do eixo.',
};

itemList['xfixradiator'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do radiador (X)',
  craft: [[
    { itemid: 'xgenericmechanicpart', amount: 5 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_cooling_parts_x.png',
  information: 'Novo radiador e peças de refrigeração.',
};

itemList['xfixclutch'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças da embreagem (X)',
  craft: [[
    { itemid: 'xgenericmechanicpart', amount: 5 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_clutch_parts_x.png',
  information: 'Novo disco de embreagem e placa de pressão.',
};

itemList['xfixtransmission'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças de Transmissão (X)',
  craft: [[
    { itemid: 'xgenericmechanicpart', amount: 5 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_transmission_parts_x.png',
  information: 'Novos conjuntos de engrenagens, eixos, conversores e conjuntos de embreagem.',
};

itemList['xfixelectronics'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Eletrônica do Veículo (X)',
  craft: [[
    { itemid: 'xgenericmechanicpart', amount: 5 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_electronic_parts_x.png',
  information: 'Vários componentes elétricos do veículo.',
};

itemList['xfixinjector'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Injetores de combustível (X)',
  craft: [[
    { itemid: 'xgenericmechanicpart', amount: 5 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_fuel_injectors_x.png',
  information: 'Novos injetores de combustível.',
};

itemList['xfixtire'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Kit de reparo de pneus (X)',
  craft: [[
    { itemid: 'xgenericmechanicpart', amount: 5 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_tire_kit_x.png',
  information: 'Para trocar e reparar pneus gastos ou danificados.',
};

itemList['xfixbody'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Painéis da carroceria (X)',
  craft: [[
    { itemid: 'xgenericmechanicpart', amount: 5 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_body_panels_x.png',
  information: 'Novos painéis de carroceria',
};

itemList['xfixengine'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Motor (X)',
  craft: [[
    { itemid: 'xgenericmechanicpart', amount: 5 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_engine_parts_x.png',
  information: 'Novas peças do motor.',
};

//S CLASS REPAIR PARTS
itemList['sfixbrake'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças de freio (S)',
  craft: [
    [
      { itemid: 'sgenericmechanicpart', amount: 3 },
    ]
  ],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_brake_parts_s.png',
  information: 'Novos discos de freio, pastilhas, pinças, cubos e acessórios.',
};

itemList['sfixaxle'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Eixo (S)',
  craft: [
    [
      { itemid: 'sgenericmechanicpart', amount: 3 },
    ]
  ],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_axle_parts_s.png',
  information: 'Novos componentes do eixo.',
};

itemList['sfixradiator'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Radiador (S)',
  craft: [[
    { itemid: 'sgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_cooling_parts_s.png',
  information: 'Novo radiador e peças de refrigeração.',
};

itemList['sfixclutch'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças da embreagem (S)',
  craft: [[
    { itemid: 'sgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_clutch_parts_s.png',
  information: 'Novo disco de embreagem e placa de pressão.',
};

itemList['sfixtransmission'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças de Transmissão (S)',
  craft: [[
    { itemid: 'sgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_transmission_parts_s.png',
  information: 'Novos conjuntos de engrenagens, eixos, conversores e conjuntos de embreagem.',
};

itemList['sfixelectronics'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Eletrônica do veículo (S)',
  craft: [[
    { itemid: 'sgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_electronic_parts_s.png',
  information: 'Vários componentes elétricos do veículo.',
};

itemList['sfixinjector'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Injetores de combustível (S)',
  craft: [[
    { itemid: 'sgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_fuel_injectors_s.png',
  information: 'Novos injetores de combustível.',
};

itemList['sfixtire'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Kit de reparo de pneus (S)',
  craft: [[
    { itemid: 'sgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_tire_kit_s.png',
  information: 'Para trocar e reparar pneus gastos ou danificados.',
};

itemList['sfixbody'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Painéis da carroceria (S)',
  craft: [[
    { itemid: 'sgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_body_panels_s.png',
  information: 'Novos painéis de carroceria.',
};

itemList['sfixengine'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do motor (S)',
  craft: [[
    { itemid: 'sgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_engine_parts_s.png',
  information: 'Novas peças do motor.',
};

//A CLASS REPAIR PARTS
itemList['afixbrake'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças de freio (A)',
  craft: [[
    { itemid: 'agenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_brake_parts_a.png',
  information: 'Novos discos de freio, pastilhas, pinças, cubos e acessórios.',
};

itemList['afixaxle'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Eixo (A)',
  craft: [[
    { itemid: 'agenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_axle_parts_a.png',
  information: 'Novos componentes do eixo.',
};

itemList['afixradiator'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Radiador (A)',
  craft: [[
    { itemid: 'agenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_cooling_parts_a.png',
  information: 'Novo radiador e peças de refrigeração.',
};

itemList['afixclutch'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças da embreagem (A)',
  craft: [[
    { itemid: 'agenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_clutch_parts_a.png',
  information: 'Novo disco de embreagem e placa de pressão.',
};

itemList['afixtransmission'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças de Transmissão (A)',
  craft: [[
    { itemid: 'agenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_transmission_parts_a.png',
  information: 'Novos conjuntos de engrenagens, eixos, conversores e conjuntos de embreagem.',
};

itemList['afixelectronics'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Eletrônica do Veículo (A)',
  craft: [[
    { itemid: 'agenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_electronic_parts_a.png',
  information: 'Vários componentes elétricos do veículo.',
};

itemList['afixinjector'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Injetores de combustível (A)',
  craft: [[
    { itemid: 'agenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_fuel_injectors_a.png',
  information: 'Novos injetores de combustível.',
};

itemList['afixtire'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Kit de reparo de pneus (A)',
  craft: [[
    { itemid: 'agenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_tire_kit_a.png',
  information: 'Para trocar e reparar pneus gastos ou danificados.',
};

itemList['afixbody'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Painéis da carroceria (A)',
  craft: [[
    { itemid: 'agenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_body_panels_a.png',
  information: 'Novos painéis de carroceria.',
};

itemList['afixengine'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Motor (A)',
  craft: [[
    { itemid: 'agenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_engine_parts_a.png',
  information: 'Novas peças do motor.',
};

//B CLASS REPAIR PARTS
itemList['bfixbrake'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças de freio (B)',
  craft: [[
    { itemid: 'bgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_brake_parts_b.png',
  information: 'Novos discos de freio, pastilhas, pinças, cubos e acessórios.',
};

itemList['bfixaxle'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Eixo (B)',
  craft: [[
    { itemid: 'bgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_axle_parts_b.png',
  information: 'Novos componentes do eixo.',
};

itemList['bfixradiator'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Radiador (B)',
  craft: [[
    { itemid: 'bgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_cooling_parts_b.png',
  information: 'Novo radiador e peças de refrigeração.',
};

itemList['bfixclutch'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças da embreagem (B)',
  craft: [[
    { itemid: 'bgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_clutch_parts_b.png',
  information: 'Novo disco de embreagem e placa de pressão.',
};

itemList['bfixtransmission'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças de Transmissão (B)',
  craft: [[
    { itemid: 'bgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_transmission_parts_b.png',
  information: 'Novos conjuntos de engrenagens, eixos, conversores e conjuntos de embreagem.',
};

itemList['bfixelectronics'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Eletrônica do veículo (B)',
  craft: [[
    { itemid: 'bgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_electronic_parts_b.png',
  information: 'Vários componentes elétricos do veículo.',
};

itemList['bfixinjector'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Injetores de combustível (B)',
  craft: [[
    { itemid: 'bgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_fuel_injectors_b.png',
  information: 'Novos injetores de combustível.',
};

itemList['bfixtire'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Kit de reparo de pneus (B)',
  craft: [[
    { itemid: 'bgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_tire_kit_b.png',
  information: 'Para trocar e reparar pneus gastos ou danificados.',
};

itemList['bfixbody'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Painéis da carroceria (B)',
  craft: [[
    { itemid: 'bgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_body_panels_b.png',
  information: 'Novos painéis de carroceria',
};

itemList['bfixengine'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Motor (B)',
  craft: [[
    { itemid: 'bgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_engine_parts_b.png',
  information: 'Novas peças do motor',
};

//C CLASS REPAIR PARTS
itemList['cfixbrake'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Freio (C)',
  craft: [[
    { itemid: 'cgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_brake_parts_c.png',
  information: 'Novos discos de freio, pastilhas, pinças, cubos e acessórios.',
};

itemList['cfixaxle'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do eixo (C)',
  craft: [[
    { itemid: 'cgenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_axle_parts_c.png',
  information: 'Novos componentes do eixo.',
};

itemList['cfixradiator'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Radiador (C)',
  craft: [[
    { itemid: 'cgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_cooling_parts_c.png',
  information: 'Novo radiador e peças de refrigeração.',
};

itemList['cfixclutch'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças da Embreagem (C)',
  craft: [[
    { itemid: 'cgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_clutch_parts_c.png',
  information: 'Novo disco de embreagem e placa de pressão.',
};

itemList['cfixtransmission'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças da Transmissão (C)',
  craft: [[
    { itemid: 'cgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_transmission_parts_c.png',
  information: 'Novos conjuntos de engrenagens, eixos, conversores e conjuntos de embreagem.',
};

itemList['cfixelectronics'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Eletrônicos do Veículo (C)',
  craft: [[
    { itemid: 'cgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_electronic_parts_c.png',
  information: 'Vários componentes elétricos do veículo.',
};

itemList['cfixinjector'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Injetores de combustível (C)',
  craft: [[
    { itemid: 'cgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_fuel_injectors_c.png',
  information: 'Novos injetores de combustível.',
};

itemList['cfixtire'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Kit de reparo de pneus (C)',
  craft: [[
    { itemid: 'cgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_tire_kit_c.png',
  information: 'Para trocar e reparar pneus gastos ou danificados.',
};

itemList['cfixbody'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Painéis da carroceria (C)',
  craft: [[
    { itemid: 'cgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_body_panels_c.png',
  information: 'Novos painéis de carroceria',
};

itemList['cfixengine'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Motor (C)',
  craft: [[
    { itemid: 'cgenericmechanicpart', amount: 3 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_engine_parts_c.png',
  information: 'Novas peças do motor',
};

//D CLASS REPAIR PARTS
itemList['dfixbrake'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Freio (D)',
  craft: [[
    { itemid: 'dgenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_brake_parts_d.png',
  information: 'Novos discos de freio, pastilhas, pinças, cubos e acessórios.',
};

itemList['dfixaxle'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do eixo (D)',
  craft: [[
    { itemid: 'dgenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_axle_parts_d.png',
  information: 'Novos componentes do eixo.',
};

itemList['dfixradiator'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Radiador (D)',
  craft: [[
    { itemid: 'dgenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_cooling_parts_d.png',
  information: 'Novo radiador e peças de refrigeração.',
};

itemList['dfixclutch'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças da Embreagem (D)',
  craft: [[
    { itemid: 'dgenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_clutch_parts_d.png',
  information: 'Novo disco de embreagem e placa de pressão.',
};

itemList['dfixtransmission'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças da Transmissão (D)',
  craft: [[
    { itemid: 'dgenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_transmission_parts_d.png',
  information: 'Novos conjuntos de engrenagens, eixos, conversores e conjuntos de embreagem.',
};

itemList['dfixelectronics'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Eletrônicos do Veículo (D)',
  craft: [[
    { itemid: 'dgenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_electronic_parts_d.png',
  information: 'Vários componentes elétricos do veículo.',
};

itemList['dfixinjector'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Injetores de combustível (D)',
  craft: [[
    { itemid: 'dgenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_fuel_injectors_d.png',
  information: 'Novos injetores de combustível.',
};

itemList['dfixtire'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Kit de reparo de pneus (D)',
  craft: [[
    { itemid: 'dgenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_tire_kit_d.png',
  information: 'Para trocar e reparar pneus gastos ou danificados.',
};

itemList['dfixbody'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Painéis da carroceria (D)',
  craft: [[
    { itemid: 'dgenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_body_panels_d.png',
  information: 'Novos painéis de carroceria',
};

itemList['dfixengine'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Motor (D)',
  craft: [[
    { itemid: 'dgenericmechanicpart', amount: 2 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_engine_parts_d.png',
  information: 'Novas peças do motor',
};

//M CLASS REPAIR PARTS
itemList['mfixbrake'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Freio (M)',
  craft: [[
    { itemid: 'mgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_brake_parts_m.png',
  information: 'Novos discos de freio, pastilhas, pinças, cubos e acessórios.',
};

itemList['mfixaxle'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do eixo (M)',
  craft: [[
    { itemid: 'mgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_axle_parts_m.png',
  information: 'Novos componentes do eixo.',
};

itemList['mfixradiator'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Radiador (M)',
  craft: [[
    { itemid: 'mgenericmechanicpart', amount: 5 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_cooling_parts_m.png',
  information: 'Novo radiador e peças de refrigeração.',
};

itemList['mfixclutch'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças da Embreagem (M)',
  craft: [[
    { itemid: 'mgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_clutch_parts_m.png',
  information: 'Novo disco de embreagem e placa de pressão.',
};

itemList['mfixtransmission'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças da Transmissão (M)',
  craft: [[
    { itemid: 'mgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_transmission_parts_m.png',
  information: 'Novos conjuntos de engrenagens, eixos, conversores e conjuntos de embreagem.',
};

itemList['mfixelectronics'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Eletrônicos do Veículo (M)',
  craft: [[
    { itemid: 'mgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_electronic_parts_m.png',
  information: 'Vários componentes elétricos do veículo.',
};

itemList['mfixinjector'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Injetores de combustível (M)',
  craft: [[
    { itemid: 'mgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_fuel_injectors_m.png',
  information: 'Novos injetores de combustível.',
};

itemList['mfixtire'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Kit de reparo de pneus (M)',
  craft: [[
    { itemid: 'mgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_tire_kit_m.png',
  information: 'Para trocar e reparar pneus gastos ou danificados.',
};

itemList['mfixbody'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Painéis da carroceria (M)',
  craft: [[
    { itemid: 'mgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_body_panels_m.png',
  information: 'Novos painéis de carroceria',
};

itemList['mfixengine'] = {
  fullyDegrades: true,
  decayrate: 2,
  displayname: 'Peças do Motor (M)',
  craft: [[
    { itemid: 'mgenericmechanicpart', amount: 4 },
  ]],
  price: 10,
  weight: 50,
  nonStack: false,
  model: '',
  image: 'np_engine_parts_m.png',
  information: 'Novas peças do motor',
};

/*

  VEHICLES END

*/