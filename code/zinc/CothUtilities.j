//! zinc
  library CothUtilities {
    private constant string sLetters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    public {
      //*Группы игроков и отряды юнитов
      force HordeForce = CreateForce();
      force AllianceForce = CreateForce();

      group FightingStartUnits = CreateGroup();
      //*Герои
      //Герои красного
      constant integer Curdran = 'Hmbr';
      constant integer CurdranMorphFirst = 'H01N';
      constant integer CurdranMorphSecond = 'H01O';
      constant integer CurdranMorphThird = 'H014';
      unit CurdranUnit;
      constant integer Galen = 'H01I';
      unit GalenUnit;
      constant integer Thoras = 'Huth';
      unit ThorasUnit;
      constant integer Danath = 'Hdgo';
      unit DanathUnit;
      //Герои синего
      constant integer Anduin = 'Hlgr';
      unit AnduinUnit;
      constant integer Khadgar = 'Hgam';
      unit KhadgarUnit;
      constant integer Llane = 'Hpb1';
      unit LlaneUnit;
      constant integer Mara = 'Edem';
      unit MaraUnit;
      //Герои бирюзового
      constant integer Daelin = 'Hapm';
      unit DaelinUnit;
      constant integer Duke = 'Hhkl';
      unit DukeUnit;
      constant integer Derek = 'H01B';
      unit DerekUnit;
      constant integer Mishan = 'Emoo';
      //Герои фиолетового
      constant integer Antonidas = 'Hant';
      unit AntonidasUnit;
      constant integer Rhonin = 'Hjai';
      unit RhoninUnit;
      constant integer Kael = 'Hblm';
      unit KaelUnit;
      constant integer Aegwynn = 'Ewar';
      constant integer MimicID = 'E001';
      unit AegwynnUnit;
      //Герои оранжевого
      constant integer Magni = 'Hmkg';
      unit MagniUnit;
      constant integer Brann = 'H005';
      unit BrannUnit;
      constant integer Gelbin = 'Hpal';
      unit GelbinUnit;
      constant integer Muradin = 'Ucrl';
      constant integer MuradinMorph = 'Uear';
      unit MuradinUnit;
      //Герои зелёного
      constant integer Anasterian = 'Hkal';
      unit AnasterianUnit;
      constant integer Alleria = 'Hvwd';
      unit AlleriaUnit;
      constant integer LorThermar = 'H01Q';
      unit LorThemarUnit;
      constant integer Sylvanas = 'Hamg';
      unit SylvanasUnit;
      //Герои розового(черного)
      constant integer Genn = 'Hpb2';
      unit GennUnit;
      constant integer Arugal = 'Hvsh';
      unit ArugalUnit;
      constant integer Gavinrad = 'H018';
      unit GavinradUnit;
      constant integer Darius = 'Nalc';
      unit DariusUnit;
      constant integer VincenctGodfrey = 'H01F';
      unit VincenctGodfreyUnit;
      //Герои серого
      constant integer Uther = 'Hmgd';
      unit UtherUnit;
      constant integer Tyralion = 'Harf';
      unit TyralionUnit;
      constant integer Tirion = 'Hart';
      unit TirionUnit;
      constant integer AlonSUS = 'H01S';
      unit AlonSUSUnit;

      //*Герои орды
      //Демоны
      constant integer Archimonde = 'Uwar';
      unit ArchimondeUnit;
      constant integer KillJaeden = 'Nklj';
      unit KillJaedenUnit;
      constant integer Mannoroth = 'Nplh';
      unit MannorothUnit;
      constant integer Tichondrius = 'Utic';
      unit TichondriusUnit;
      constant integer Mediv = 'N007';
      constant integer SargerasFirst = 'N00Q';
      constant integer SargerasSecond = 'N008';
      constant integer SargerasThird = 'N009';
      unit MedivUnit;
      constant integer Azgalor = 'Npld';
      unit AzgalorUnit;
      //Интачи
      constant integer Guldan = 'Othr';
      unit GuldanUnit;
      constant integer Nerzhul = 'Orkn';
      unit NerzhulUnit;
      constant integer Teron = 'Ogld';
      unit TeronUnit;
      constant integer ChoGall = 'Orex';
      unit ChoGallUnit;
      constant integer Fenris = 'Ofar';
      unit FenrisUnit;
      constant integer Ratso = 'Ntin';
      constant integer RatsoMorphFirst = 'Nrob';
      constant integer RatsoMorphSecond = 'N00W';
      constant integer RatsoMorphThird = 'N00Z';
      constant integer RatsoMorphFouth = 'N00U';
      unit RatsoUnit;
      constant integer Zuluhed = 'Otch';
      unit ZuluhedUnit;
      //Силачи
      constant integer Blackhand = 'Nbbc';
      unit BlackhandUnit;
      constant integer Orgrim = 'Ogrh';
      unit OrgrimUnit;
      constant integer Kargath = 'Nsjs';
      unit KargathUnit;
      constant integer Dentarg = 'Ocbh';
      unit DentargUnit;
      constant integer Rend = 'Nbst';
      unit RendUnit;
      //Агильщики
      constant integer Killrog = 'Osam';
      unit KillrogUnit;
      constant integer Grom = 'Opgh';
      constant integer GromMorph = 'Uvng';
      unit GromUnit;
      constant integer ZulJin = 'Odrt';
      unit ZulJinUnit;
      constant integer Garona = 'O00M';
      constant integer GaronaMorphFirst = 'O001';
      constant integer GaronaMorphSecond = 'O000';
      constant integer GaronaMorphThird = 'O00N';
      unit GaronaUnit;
      constant integer Maim = 'Obla';
      unit MaimUnit;
      constant integer Griselda = 'Ekee';
      unit GriseldaUnit;
      //*Локации


      constant real BridgesLocationX = 6000;
      constant real BridgesLocationY = 2500;
      //Мост
      constant location Bridges = Location(BridgesLocationX, BridgesLocationY);
      constant real ShopLocationX = - 15000;
      constant real ShopLocationY = 15000;
      //Магазины
      constant location Shop = Location(ShopLocationX, ShopLocationY);
      constant real Blue_LumbermillX = - 4000;
      constant real Blue_LumbermillY = - 15550;
      //Лесопилка Синего
      constant location Blue_Lumbermill = Location(Blue_LumbermillX, Blue_LumbermillY);
      constant real Pink_ShipyardX = - 12000;
      constant real Pink_ShipyardY = - 800;
      //Верфь Розового
      constant location Pink_Shipyard = Location(Pink_ShipyardX, Pink_ShipyardY);
      constant real Blue_ThroneX = - 2300;
      constant real Blue_ThroneY = - 12100;
      //Трон Синего
      constant location Blue_Throne = Location(Blue_ThroneX, Blue_ThroneY);


      //*Улучшения
      constant integer Max_Armor = 'R00X';
      constant integer Max_Armor_Horde = 'R00T';
      constant integer Max_Armor_Gnome = 'R003';
      constant integer Max_Damage = 'R00Y';
      constant integer Max_Damage_Horde = 'R00U';
      constant integer Max_Damage_Gnome = 'R005';
      constant integer Max_RangeDamage = 'R00Z';

      constant integer Armor = 'R00B';
      constant integer Armor_Gnome = 'R002';
      constant integer Armor_Horde = 'Roar';
      constant integer Damage = 'R00G';
      constant integer Damage_Gnome = 'R004';
      constant integer Damage_Horde = 'Rome';
      constant integer RangeDamage = 'R000';


      //*Предметы

      //*Книги
      constant integer Book_of_Intelligence = 'srrc';
      constant integer Book_of_Agillity = 'sres';
      constant integer Book_of_Strength = 'sror';
      //*Предметы-руны, для покупки если инвентарь полон
      //Шлем Энергии
      constant integer Helm_Of_Energy = 'I01E';
      //Самоцвет кадгара
      constant integer Khadgar_Gem = 'I01D';
      //Аркан Вондер
      constant integer Arcane_Wonder = 'I01H';
      //Непробиваемый нагрудник
      constant integer Stonepath_Chestguard = 'I01V';
      //Душа Азуны
      constant integer Essence_of_Aszune = 'I02M';
      //Посох Молний
      constant integer Lightning_Stave = 'I01R';
      //Посох Ветра
      constant integer Wind_Stave = 'I01I';
      //Жезл Смерти
      constant integer Death_Edge = 'I02X';
      //Клинок Ветерана
      constant integer Veterans_Blade = 'I003';
      //Гигантский меч
      constant integer Great_Sword = 'I00F';
      //Тандерфьюри
      constant integer Thunderfury = 'I021';
      //Серебрянный меч
      constant integer Silver_Blade = 'I013';
      //Топор амани
      constant integer Amani_Throw_Axe = 'I01K';
      //Флейта меткости
      constant integer Flute_Accurance = 'I02Q';
      //Боевые Барабаны
      constant integer Warsong_Drumes = 'I02R';
      //Ботинки Душегуба
      constant integer Soul_Slippers = 'I02G';
      //Винтовка Филлинга
      constant integer Filling_Rifle = 'I02L';
      //Звёздные Сапоги
      constant integer Starlights = 'I02F';
      //Зловещий Щит
      constant integer Grim_Ward = 'I01U';
      //Клинок Дуэлянта
      constant integer Duel_Blade = 'I030';
      //Кольцо Души
      constant integer Soul_Ring = 'I02P';
      //Кольцо Стены Щитов
      constant integer Ring_of_Protection_RDD = 'I033';
      //Королевский Молот
      constant integer Royal_Hammer = 'I01T';
      //Лук Ветрокрылых
      constant integer Bow_Windrunner = 'I01S';
      //Лучезарный Спаситель
      constant integer Radiant_Savior = 'I02W';
      //Лёгкий Стальной Щит
      constant integer Steel_Shield = 'I031';
      //Одеяние Охотника
      constant integer Wolf_Hunters_Guise = 'I01J';
      //Путеводный Жезл
      constant integer Wand_of_the_Wayward = 'I02B';
      //Разрушитель Разума
      constant integer Wisdom_Carver = 'I02C';
      //Санскейл Шлем
      constant integer Sunscale_Helm = 'I01W';
      //Сухофант
      constant integer Sycophant = 'I01X';
      //Талисман Природы
      constant integer Talisman_of_the_Wild = 'I01Y';
      //Урна
      constant integer Urn = 'I020';
      //Шлем Людоеда
      constant integer Ogreskull = 'I02Z';
      //Ядовитое Жало
      constant integer Venomstrike = 'I022';
      //Ботинки Ловкости
      constant integer Slippers_of_Agillity = 'I018';
      //Громадный Щит
      constant integer Great_Shield = 'I032';
      //Дворфийский Топор
      constant integer Dwarven_Axe = 'I017';
      //Жезл Некромантии
      constant integer Rod_of_Necromancy = 'I014';
      //Клинок Атсасина
      constant integer Assasins_Blade = 'I01G';
      //Клинок из Черепа
      constant integer Skull_Blade = 'I012';
      //Кольцо Титана
      constant integer Ring_of_Titus = 'I01B';
      //Мантия Интеллекта
      constant integer Mantle_of_Intelligence = 'I01C';
      //Мультизарядный Арбалет
      constant integer Repeater_Crossbow = 'I02J';
      //Огрский Молот
      constant integer Ogre_Mallet = 'I016';
      //Осколок Льда
      constant integer Frozen_Shard = 'I02K';
      //Перчатки Мощи
      constant integer Gauntlets_of_Power = 'I01F';
      //Посох Маны
      constant integer Mana_Blade = 'I028';
      //Проворный Щит
      constant integer Swift_Shield = 'I00J';
      //Рунные Браслеты
      constant integer Runed_Bracers = 'I02D';
      //Рунные Перчатки
      constant integer Runed_Gauntlets = 'I01A';
      //Серебрянное Копьё
      constant integer Argent_Spear = 'I02U';
      //Усиленные Ботинки
      constant integer Plated_Boots = 'I015';
      //Хрустальный Шар
      constant integer Crystall_Ball = 'I02A';
      //Шаманские Когти
      constant integer Shaman_Claws = 'I019';
      //Бастион Чести
      constant integer Bastion_of_Purity = 'I02E';
      //Бладмун Плейт
      constant integer Bloodmoon_Plate = 'I02T';
      //Бронзовые Сапоги
      constant integer Bronze_Greaves = 'I02I';
      //Бронзовый Меч
      constant integer Bronze_Sword = 'I01N';
      //Бульварк Демоноборца
      constant integer Bulwark_Demonbone = 'I02Y';
      //Кливер Палача
      constant integer Executioner_Clearver = 'I01P';
      //Клинки Агонии
      constant integer Blades_of_Agony = 'I02H';
      // Клинок Либератора
      constant integer Liberators_Blade = 'I02O';
      //Конец Путешествия
      constant integer Journeys_End = 'I029';
      //Ледяной Щит
      constant integer Glacial_Shield = 'I01Q';
      //Меч Рока
      constant integer Corruption_Edge = 'I01O';
      //Нагрудинк Светососца
      constant integer Breast_Plate_of_the_Lightbringer = 'I01M';
      //Обсидиановое Копьё
      constant integer Obsidian_Spear = 'I02V';
      //Перчатки Аегис
      constant integer Aegis_Gloves = 'I024';
      //Топор Блэкрока
      constant integer Blackrock_Champions_Axe = 'I01L';
      //Чешуя Дракона
      constant integer Dragonscale_Sheath = 'I02S';
      //Шлем Ярости
      constant integer Battlehirst_Helm = 'I027';

      //* Редкие и обычные предметы, что находятся в инвентаре

      //Ботинки Ловкости
      constant integer Slippers_of_Agillity_Inventory = 'rag1';
      //Громадный Щит в инвентаре
      constant integer Great_Shield_Inventory = 'tsct';
      //Жезл Некромантии в инвентаре
      constant integer Rod_of_Necromancy_Inventory = 'rnec';
      //Клинок Атсасина в инвентаре
      constant integer Assasins_Blade_Inventory = 'shcw';
      //Клинок Ветерана в инвентаре
      constant integer Veterans_Blade_Inventory = 'dthb';
      //Кольцо Титана в инвентаре
      constant integer Ring_of_Titus_Inventory = 'gvsm';
      //Мантия Интеллекта в инвентаре
      constant integer Mantle_of_Intelligence_Inventory = 'rin1';
      //Мультизарядный Арбалет в инвентаре
      constant integer Repeater_Crossbow_Inventory = 'clsd';
      //Осколок Льда в инвентаре
      constant integer Frozen_Shard_Inventory = 'rde2';
      //Перчатки Мощи в инвентаре
      constant integer Gauntlets_of_Power_Inventory = 'clfm';
      //Посох Маны в инвентаре
      constant integer Mana_Blade_Inventory = 'ssil';
      //Рунные Браслеты в инвентаре
      constant integer Runed_Bracers_Inventory = 'brac';
      //Рунные Перчатки в инвентаре
      constant integer Runed_Gauntlets_Inventory = 'rugt';
      //Самоцвет Кадгара в инвентаре
      constant integer Khadgar_Gem_Inventory = 'prvt';
      //Серебрянное копьё в инвентаре
      constant integer Argent_Spear_Inventory = 'desc';
      //Хрустальный Шар в инвентаре
      constant integer Crystall_Ball_Inventory = 'crys';
      //Шаманские Когти в инвентаре
      constant integer Shaman_Claws_Inventory = 'rat6';
      //Шлем Энергии в инвентаре
      constant integer Helm_Of_Energy_Inventory = 'penr';
      //Амулет Здоровья в инвентаре
      constant integer Amulet_of_Health = 'evtl';
      //Амулет Маны в инвентаре
      constant integer Pedant_of_Mana = 'pmna';
      //Боевой Шлем в инвентаре
      constant integer Battle_Helm = 'ckng';
      //Боевые Когти в инвентаре
      constant integer Claws_of_Attack = 'rat9';
      //Венец Благородства в инвентаре
      constant integer Circlet_of_Nobility = 'cnob';
      //Звёздный Посох в инвентаре
      constant integer Star_Wand = 'wlsd';
      //Клеймор в инвентаре
      constant integer Claymore = 'ratc';
      //Кольцо Защиты в инвентаре
      constant integer Ring_of_Protection = 'rde3';
      //Кольцо Регенерации в инвентаре
      constant integer Ring_of_Regeneration = 'rlif';
      //Лук Кель'Таласа в инвентаре
      constant integer Bow_of_Quelthalas = 'belv';
      //Маска Соби в инвентаре
      constant integer Sobi_Mask = 'rwiz';
      //Медальон Храбрости в инвентаре
      constant integer Medallion_of_Curage = 'mcou';
      //Перчатки Огра в инвентаре
      constant integer Gauntlets_of_Ogre = 'rst1';
      //Перчатки Скорости в инвентаре
      constant integer Gauntlets_of_Attack_Speed = 'gcel';
      //Плащ Теней в инвентаре
      constant integer Cloak_of_Evasion = 'spsh';
      //Пояс Богатыря в инвентаре
      constant integer Belt_of_Giants = 'bgst';
      //Проклятые Кости в инвентаре
      constant integer Cursed_Bones = 'afac';
      //Роба Магии в инвентаре
      constant integer Robe_of_the_Magi = 'ciri';
      //Талисман Здоровья в инвентаре
      constant integer Periart_of_Vitality = 'rhth';
      //Эльфийские Ботинки в инвентаре
      constant integer Boots_of_Speed = 'bspd';
      //Дворфийский Топор в инвентаре
      constant integer Dwarven_Axe_Inventory = 'I009';
      //Жезл Некромантии второй?
      constant integer Rod_of_Necromancy_Inventory_two = 'I00V';
      //Клинок из Черепа в инвентаре
      constant integer Skull_Blade_Inventory = 'I00A';
      //Огрский Молот в инвентаре
      constant integer Ogre_Mallet_Inventory = 'I00W';
      //Проворный Щит в инвентаре
      constant integer Swift_Shield_Inventory = 'I00U';
      //Серебрянный Меч в инвентаре
      constant integer Silver_Blade_Inventory = 'I011';
      //Усиленные Ботинки в инвентаре
      constant integer Plated_Boots_Inventory = 'I00S';
      //Алебарда в инвентаре
      constant integer Halberd = 'I00M';
      //Бронзовый Щит в инвентаре
      constant integer Bronze_Shield = 'I00C';
      //Булава в инвентаре
      constant integer Mace = 'I002';
      //Гигантский Меч второй? в инвентаре
      constant integer Great_Sword_Two = 'I00F';
      //Деревянный Щит в инвентаре
      constant integer Wooden_Shield = 'I00D';
      //Заклятый Череп в инвентаре
      constant integer Enchanted_Skull = 'I00H';
      //Молот в инвентаре
      constant integer Hammer = 'I007';
      //Нагрудник в инвентаре
      constant integer Chest_Plate = 'I008';
      //Посох Мага в инвентаре
      constant integer Mage_Stave = 'I00E';
      //Скимитар в инвентаре
      constant integer Scimitar = 'I005';
      //Топор Войны в инвентаре
      constant integer War_Axe = 'I004';
      //Фальшион в инвентаре
      constant integer Falchion = 'I00B';
      //Шипастый Шлем в инвентаре
      constant integer Spiked_Helm = 'I00Q';

      //* Уникальные предметы, что находятся в инвентаре
      
      //Аркан Вондер
      constant integer Arcane_Wonder_Inventory = 'hval';
      //Бастион Чести
      constant integer Bastion_of_Purity_Inventory = 'sbch';
      //Бладмун Плейт
      constant integer Bloodmoon_Plate_Inventory = 'ches';
      //Боевые Барабаны
      constant integer Warsong_Drumes_Inventory = 'glsk';
      //Ботинки Душегуба
      constant integer Soul_Slippers_Inventory = 'rde1';
      //Бронзовые Сапоги
      constant integer Bronze_Greaves_Inventory = 'dsum';
      //Бульварк Демоноборца
      constant integer Bulwark_Demonbone_Inventory = 'engs';
      //Винтовка филлинга
      constant integer Filling_Rifle_Inventory = 'ajen';
      //Душа Азуны
      constant integer Essence_of_Aszune_Inventory = 'esaz';
      //Жезл Смерти
      constant integer Death_Edge_Inventory = 'rde4';
      //Звёздные Сапоги
      constant integer Starlights_Inventory = 'odef';
      //Клинки Агонии
      constant integer Blades_of_Agony_Inventory = 'lgdh';
      //Клинок Дуэлянта
      constant integer Duel_Blade_Inventory = 'gmfr';
      //Кольцо Души
      constant integer Soul_Ring_Inventory = 'ratf';
      //Кольцо Стены Щитов
      constant integer Ring_of_Protection_RDD_Inventory = 'moon';
      //Конец Путешествия
      constant integer Journeys_End_Inventory = 'stel';
      //Лёгкий Стальной Щит
      constant integer Steel_Shield_Inventory = 'mcri';
      //Лучезарный Спаситель
      constant integer Radiant_Savior_Inventory = 'ofro';
      //Обсидиановое Копьё
      constant integer Obsidian_Spear_Inventory = 'modt';
      //Одеяние Охотника
      constant integer Wolf_Hunters_Guise_Inventory = 'hcun';
      //Посох Ветра
      constant integer Wind_Stave_Inventory = 'kpin';
      //Путеводный Жезл
      constant integer Wand_of_the_Wayward_Inventory = 'ward';
      //Разрушитель Разума
      constant integer Wisdom_Carver_Inventory = 'lhst';
      //Топор Блэкхенда
      constant integer Blackrock_Champions_Axe_Inventory = 'tkno';
      //Флейта Меткости
      constant integer Flute_Accurance_Inventory = 'mort';
      //Чешуя Дракона
      constant integer Dragonscale_Sheath_Inventory = 'kybl';
      //Шлем Людоеда
      constant integer Ogreskull_Inventory = 'bzbe';
      //Шлем Ярости
      constant integer Battlehirst_Helm_Inventory = 'I026';
      //Перчатки Аегис
      constant integer Aegis_Gloves_Inventory = 'I023';
      //Нагрудник Светососца
      constant integer Breast_Plate_of_the_Lightbringer_Inventory = 'I006';
      //Бронзовый Меч
      constant integer Bronze_Sword_Inventory = 'I00N';
      //Зловещий Щит
      constant integer Grim_Ward_Inventory = 'I00R';
      //Кливер Палача
      constant integer Executioner_Clearver_Inventory = 'I001';
      //Клинок Либератора
      constant integer Liberators_Blade_Inventory = 'I02N';
      //Королевский Молот (ближний бой)
      constant integer Royal_Hammer_Inventory_Melee = 'I00X';
      //Королевский Молот (дальний бой)
      constant integer Royal_Hammer_Inventory_Range = 'I025';
      //Ледяной Щит
      constant integer Glacial_Shield_Inventory = 'I00K';
      //Меч Рока
      constant integer Corruption_Edge_Inventory = 'I00L';
      //Непробиваемый Нагрудник
      constant integer Stonepath_Chestguard_Inventory = 'I00P';
      //Посох Молний
      constant integer Lightning_Stave_Inventory = 'I00T';
      //Санскейл Шлем
      constant integer Sunscale_Helm_Inventory = 'I00O';
      //Талисман Природы
      constant integer Talisman_of_the_Wild_Inventory = 'I00Z';
      //Топор Амани
      constant integer Amani_Throw_Axe_Inventory = 'I00Y';
      //Урна
      constant integer Urn_Inventory = 'I010';
      //Ядовитое Жало
      constant integer Venomstrike_Inventory = 'I01Z';
      //Сухофант
      constant integer Sycophant_Inventory = 'I00I';
      //Лук Ветрокрылых
      constant integer Bow_Windrunner_Inventory = 'I00G';
      //Тандерфьюри
      constant integer Thunderfury_Inventory = 'I000';


      //Хэш-таблица предметов
      constant hashtable ItemDataHashtable = InitHashtable();
      constant integer ITEM_TYPE_BASIC = 0;
      constant integer ITEM_TYPE_RARE = 1;
      constant integer ITEM_TYPE_UNIQUE = 2;

      //Хэш-таблица с информацией о юните
      constant hashtable UnitInfoHashtable = InitHashtable();
      constant integer HERO_BASIC_ARMOR = 1;
      constant integer HERO_BASIC_AGI = 2;
      constant integer HERO_BASIC_INT = 3;
      constant integer HERO_BASIC_STR = 4;
      constant integer HERO_INC_AGI = 5;
      constant integer HERO_INC_INT = 6;
      constant integer HERO_INC_STR = 7;
      constant integer HERO_BASIC_DAMAGE = 8;
      constant integer HERO_DICE_SIDES = 9;
      constant integer HERO_DICE_NUMBERS = 10;
      constant integer HERO_DAMAGE_TYPE = 11;
      constant integer HERO_ATTACK_TYPE = 12;
      constant integer HERO_DEFENCE_TYPE = 13;
      constant integer HERO_MAIN_ATTR = 14;
      constant integer HERO_TRIG_ONDAMAGE = 15;
      constant integer UNIT_CASTING_ABILITY = 16;
      //constant integer UNIT_TYPE_RANGED_ATTACKER

       
      constant integer DEFENSE_TYPE_LIGHT  = 0;
	    constant integer DEFENSE_TYPE_MEDIUM = 1;
	    constant integer DEFENSE_TYPE_LARGE  = 2;
	    constant integer DEFENSE_TYPE_FORT   = 3;
	    constant integer DEFENSE_TYPE_NORMAL = 4;
	    constant integer DEFENSE_TYPE_HERO   = 5;
	    constant integer DEFENSE_TYPE_DIVINE = 6;
	    constant integer DEFENSE_TYPE_NONE   = 7;

      constant integer EveryHowAGIIncreaseArmor = 5;

      hashtable RejuvHashtable = InitHashtable();
      
      //*Хэш-таблицы для способностей героев
      hashtable UnitAbilityData = InitHashtable();
      hashtable TimerData = InitHashtable();


      trigger CurdranOnDamage = CreateTrigger(),
      GalenOnDamage = CreateTrigger(),
      ThorasOnDamage = CreateTrigger(),
      DanathOnDamage = CreateTrigger(),
      AnduinOnDamage = CreateTrigger(),
      KhadgarOnDamage = CreateTrigger(),
      LlaneOnDamage = CreateTrigger(),
      MaraOnDamage = CreateTrigger(),
      DaelinOnDamage = CreateTrigger(),
      DukeOnDamage = CreateTrigger(),
      DerekOnDamage = CreateTrigger(),
      AntonidasOnDamage = CreateTrigger(),
      RhoninOnDamage = CreateTrigger(),
      KaelOnDamage = CreateTrigger(),
      AegwynnOnDamage = CreateTrigger(),
      MagniOnDamage = CreateTrigger(),
      BrannOnDamage = CreateTrigger(),
      GelbinOnDamage = CreateTrigger(),
      MuradinOnDamage = CreateTrigger(),
      AnasterianOnDamage = CreateTrigger(),
      AlleriaOnDamage = CreateTrigger(),
      LorThermarOnDamage = CreateTrigger(),
      SylvanasOnDamage = CreateTrigger(),
      GennOnDamage = CreateTrigger(),
      ArugalOnDamage = CreateTrigger(),
      GavinradOnDamage = CreateTrigger(),
      DariusOnDamage = CreateTrigger(),
      UtherOnDamage = CreateTrigger(),
      TyralionOnDamage = CreateTrigger(),
      TirionOnDamage = CreateTrigger(),
      AlonSUSOnDamage = CreateTrigger(),
      ArchimondeOnDamage = CreateTrigger(),
      KillJaedenOnDamage = CreateTrigger(),
      MannorothOnDamage = CreateTrigger(),
      TichondriusOnDamage = CreateTrigger(),
      MedivOnDamage = CreateTrigger(),
      AzgalorOnDamage = CreateTrigger(),
      GuldanOnDamage = CreateTrigger(),
      NerzhulOnDamage = CreateTrigger(),
      TeronOnDamage = CreateTrigger(),
      ChoGallOnDamage = CreateTrigger(),
      FenrisOnDamage = CreateTrigger(),
      RatsoOnDamage = CreateTrigger(),
      ZuluhedOnDamage = CreateTrigger(),
      BlackhandOnDamage = CreateTrigger(),
      OrgrimOnDamage = CreateTrigger(),
      KargathOnDamage = CreateTrigger(),
      DentargOnDamage = CreateTrigger(),
      RendOnDamage = CreateTrigger(),
      KillrogOnDamage = CreateTrigger(),
      GromOnDamage = CreateTrigger(),
      ZulJinOnDamage = CreateTrigger(),
      GaronaOnDamage = CreateTrigger(),
      MaimOnDamage = CreateTrigger(),
      GriseldaOnDamage = CreateTrigger();

      trigger MishanOnDamage = CreateTrigger();
    }   

    public struct AbilityData {

      unit Caster;
      location TargetLoc;
      unit Target;
      integer ID;
      integer Level;
      ability Spell;

      static method create ()  -> thistype {
        thistype this = allocate();
        TargetLoc = GetSpellTargetLoc();
        Caster = GetTriggerUnit();
        Target = GetSpellTargetUnit();
        ID = GetSpellAbilityId();
        Spell = GetSpellAbility();
        Level = GetUnitAbilityLevel(Caster, ID);
        return this;
      }

      method destroy ()  -> nothing {
        RemoveLocation(TargetLoc);
        TargetLoc = null;
        Caster = null;
        Target = null;
        ID = 0;
        Level = 0;
        Spell = null;
        deallocate();
      }
    }

    
    public function IdToChar(integer input ) ->  string {
      integer pos = input - 48;

      if (input >= 97) {
        pos = input - 97 + 36;
      }
      else if (input >= 65) {
        pos = input - 65 + 10;
      }

      return SubString( sLetters, pos, pos + 1 );
    }

    public function IdToString (integer input) ->  string {
      integer result = input / 256;
      string char = IdToChar( input - 256 * result );

      input = result / 256;
      char = IdToChar( result - 256 * input ) + char;
      result = input / 256;

      return IdToChar( result ) + IdToChar( input - 256 * result ) + char;
    }

    public function roundF (real r)  -> real {
      if (r > 0.) {
        return I2R( R2I( r + 0.5 ) );
      }
      return I2R( R2I( r - 0.5 ) );
    }

    public function GetFloat (real r)  -> real {
      return (r - I2R(R2I(r)));
    }

    public function AddUnitLifePercent (unit whichUnit, real percent)  -> boolean {
      if (IsUnitDeadBJ(whichUnit)) return false;
      SetUnitState(whichUnit, UNIT_STATE_LIFE, GetUnitState(whichUnit, UNIT_STATE_LIFE) * (1 + percent / 100));
      return true;
    }

    public function AddUnitLife (unit whichUnit, real whichHP)  -> boolean {
      if (IsUnitDeadBJ(whichUnit)) return false;
      SetUnitState(whichUnit, UNIT_STATE_LIFE, GetUnitState(whichUnit, UNIT_STATE_LIFE) + whichHP);
      return true;
    }

    public function PingMinimapLocForPlayerEx (player whichPlayer, location whichLoc, real duration, integer red, integer green, integer blue, boolean extraEffects)  -> nothing {
      if (GetLocalPlayer() == whichPlayer) {
        PingMinimapEx(GetLocationX(whichLoc), GetLocationY(whichLoc), duration, red, green, blue, extraEffects);
      }
    }

    public function SeparateText (player whichPlayer, real time)  -> nothing {
      DisplayTimedTextToPlayer(whichPlayer, 0, 0, time, " ");
    }

    public function DisplayTimedTextToPlayerSimple (player whichPlayer, real duration, string message)  -> nothing {
      DisplayTimedTextToPlayer(whichPlayer, 0, 0, duration, message);
    }
    
    public function CheckHeroMainAttribute (unit Hero) ->  integer {
      return LoadInteger(UnitInfoHashtable, GetUnitTypeId(Hero), HERO_MAIN_ATTR);
    }

    public function IsHeroRange (unit whichHero)  -> boolean {
      return IsUnitType(whichHero, UNIT_TYPE_RANGED_ATTACKER); 
      /*
      !(
      ! HeroID == Khadgar    ||
      !  HeroID == Derek      ||
      !  HeroID == Antonidas  ||
      !  HeroID == Aegwynn    ||
      !  HeroID == Kael       ||
      !  HeroID == Brann      ||
      !  HeroID == Gelbin     ||
      !  HeroID == Anasterian ||
      !  HeroID == Alleria    ||
      !  HeroID == Sylvanas   ||
      !  HeroID == Arugal     ||
      !  HeroID == AlonSUS    ||
      !  HeroID == ZulJin     ||
      !  HeroID == Guldan     ||
      !  HeroID == Nerzhul    ||
      !  HeroID == Teron      ||
      !  HeroID == Fenris     ||
      !  HeroID == Zuluhed    ||
      !  HeroID == Mediv      ||
      !  HeroID == Archimonde ||
      !  HeroID == KillJaeden 
      !);
      */
    }

    public function ClearTextMessagesForPlayer (player whichPlayer)  -> nothing {
      if (GetLocalPlayer() == whichPlayer) {
        ClearTextMessages();
      }
    }

    public function CountOfItems (unit whichUnit, integer whichItemID)  -> integer {
      integer index;
      integer count = 0;
      for (0 <= index <= 5) {
        if (GetItemTypeId(UnitItemInSlot(whichUnit, index)) == whichItemID) count += 1;
      }
      return count;
    }

    public function TriggerRegisterAnyPlayerChatEvent (trigger whichTrigger, string message, boolean exactMatchOnly)  -> nothing {
      integer index;
      for (0 <= index <= 11) {
        TriggerRegisterPlayerChatEvent(whichTrigger, Player(index), message, exactMatchOnly);
      }
    }

    public function IsTrainedUnitAHero ()  -> boolean {
      return IsHeroUnitId(GetTrainedUnitType());
    }

    public function SaveUnitData 
    (
      integer UnitID,
      integer UnitBasicArmor,
      integer UnitBasicAgi,
      integer UnitBasicInt,
      integer UnitBasicStr,
      real UnitIncAgi,
      real UnitIncInt,
      real UnitIncStr,
      integer UnitBasicDamage,
      integer UnitDiceSides,
      integer UnitDiceNumbers,
      integer UnitDefenceType,
      integer HeroAttrType
    )  -> nothing {
      SaveInteger(UnitInfoHashtable, UnitID, HERO_BASIC_ARMOR, UnitBasicArmor);
      SaveInteger(UnitInfoHashtable, UnitID, HERO_BASIC_AGI, UnitBasicAgi);
      SaveInteger(UnitInfoHashtable, UnitID, HERO_BASIC_INT, UnitBasicInt);
      SaveInteger(UnitInfoHashtable, UnitID, HERO_BASIC_STR, UnitBasicStr);
      SaveReal(UnitInfoHashtable, UnitID, HERO_INC_AGI, UnitIncAgi);
      SaveReal(UnitInfoHashtable, UnitID, HERO_INC_INT, UnitIncInt);
      SaveReal(UnitInfoHashtable, UnitID, HERO_INC_STR, UnitIncStr);
      SaveInteger(UnitInfoHashtable, UnitID, HERO_BASIC_DAMAGE, UnitBasicDamage);
      SaveInteger(UnitInfoHashtable, UnitID, HERO_DICE_SIDES, UnitDiceSides);
      SaveInteger(UnitInfoHashtable, UnitID, HERO_DICE_NUMBERS, UnitDiceNumbers);
      SaveInteger(UnitInfoHashtable, UnitID, HERO_DEFENCE_TYPE, UnitDefenceType);
      SaveInteger(UnitInfoHashtable, UnitID, HERO_MAIN_ATTR, HeroAttrType);
    }

    public function toUpperCase (string source)  -> string {
      return StringCase(source, true);
    }

    public function toLowerCase (string source)  -> string {
      return StringCase(source, false);
    }

    public function GetHeroTriggerOnDamage (unit whichUnit)  -> trigger {
      return LoadTriggerHandle(UnitInfoHashtable, GetUnitTypeId(whichUnit), HERO_TRIG_ONDAMAGE);
    }

    public function GetUnitDefaultArmor (unit whichUnit)  -> integer {
      return LoadInteger(UnitInfoHashtable, GetUnitTypeId(whichUnit), HERO_BASIC_ARMOR);
    }

    public function GetHeroAgiOnlyBonus (unit whichHero)  -> integer {
      return GetHeroAgi(whichHero, true) - GetHeroAgi(whichHero, false);
    }

    public function HelpSaveTargetItem (player whichPlayer, integer whichItemID)  -> nothing {
      SaveInteger(ItemDataHashtable, GetHandleId(whichPlayer), 0, whichItemID);
    }

    public function HelpLoadTargetItem (player whichPlayer)  -> integer {
      return LoadInteger(ItemDataHashtable, GetHandleId(whichPlayer), 0);
    }

    public function GetHeroArmor (unit whichHero)  -> real {
      real ArmorCount = 0;
      integer HeroAgi = GetHeroAgiOnlyBonus(whichHero);
      integer HeroDefaultAgi = GetHeroAgi(whichHero, false);
      real AGI_DEFENSE_BONUS = 0.2;
      ArmorCount += CountOfItems(whichHero, Breast_Plate_of_the_Lightbringer_Inventory) * 16;
      ArmorCount += CountOfItems(whichHero, Ring_of_Protection) * 2;
      ArmorCount += CountOfItems(whichHero, Spiked_Helm) * 4;
      ArmorCount += CountOfItems(whichHero, Cloak_of_Evasion) * 1;
      ArmorCount += CountOfItems(whichHero, Gauntlets_of_Attack_Speed) * 1;
      ArmorCount += CountOfItems(whichHero, Battle_Helm) * 5;
      ArmorCount += CountOfItems(whichHero, Boots_of_Speed) * 1;
      ArmorCount += CountOfItems(whichHero, Belt_of_Giants) * 1;
      ArmorCount += CountOfItems(whichHero, Veterans_Blade_Inventory) * 2;
      ArmorCount += CountOfItems(whichHero, Runed_Bracers_Inventory) * 4;
      ArmorCount += CountOfItems(whichHero, Helm_Of_Energy_Inventory) * 6;
      ArmorCount += CountOfItems(whichHero, Plated_Boots_Inventory) * 2;
      ArmorCount += CountOfItems(whichHero, Ring_of_Titus_Inventory) * 3;
      ArmorCount += CountOfItems(whichHero, Battlehirst_Helm_Inventory) * 6;
      ArmorCount += CountOfItems(whichHero, Bloodmoon_Plate_Inventory) * 6;
      ArmorCount += CountOfItems(whichHero, Sunscale_Helm_Inventory) * 8;
      ArmorCount += CountOfItems(whichHero, Bronze_Greaves_Inventory) * 5;
      ArmorCount += CountOfItems(whichHero, Dragonscale_Sheath_Inventory) * 14;
      ArmorCount += CountOfItems(whichHero, Bastion_of_Purity_Inventory) * 6;
      ArmorCount += CountOfItems(whichHero, Ring_of_Protection_RDD_Inventory) * 4;
      ArmorCount += CountOfItems(whichHero, Stonepath_Chestguard_Inventory) * 10;
      ArmorCount += CountOfItems(whichHero, Aegis_Gloves_Inventory) * 2;
      ArmorCount += CountOfItems(whichHero, Starlights_Inventory) * 6;
      ArmorCount += CountOfItems(whichHero, Chest_Plate) * 8;
      ArmorCount += (HeroAgi * AGI_DEFENSE_BONUS);
      ArmorCount += (GetUnitDefaultArmor(whichHero) - 2);
      if ( ModuloInteger(HeroDefaultAgi, 5) >= 3 ) {
        ArmorCount += I2R( (HeroDefaultAgi / 5) + 1 );
      } else {
        ArmorCount += I2R(HeroDefaultAgi / 5);
      }
      if (UnitHasBuffBJ(whichHero, 'BNsa')) ArmorCount += 2;
      if (UnitHasBuffBJ(whichHero, 'Bfae')) ArmorCount -= 3;
      if (UnitHasBuffBJ(whichHero, 'Brpb')) ArmorCount += 4;
      if (UnitHasBuffBJ(whichHero, 'BEst')) ArmorCount += 8;
      return ArmorCount;
    }

    public function DialogAddButtonSimple (dialog whichDialog, string message)  -> button {
      return DialogAddButton(whichDialog, message, 0);
    }

    public function IsGetFilterUnitAllyForAlliance ()  -> boolean {
      return (IsUnitAlly(GetFilterUnit(), Player(0)));
    }

    public function SaveUnitCastAbil (unit Caster, boolean flag)  -> nothing {
      if (!flag) RemoveSavedBoolean(UnitInfoHashtable, GetHandleId(Caster), UNIT_CASTING_ABILITY);
      else SaveBoolean(UnitInfoHashtable, GetHandleId(Caster), UNIT_CASTING_ABILITY, flag);
    }

    public function IsUnitCastingAbil (unit whichUnit)  -> boolean {
      return LoadBoolean(UnitInfoHashtable, GetHandleId(whichUnit), UNIT_CASTING_ABILITY);
    }

    public function UnitRemoveMana (unit whichUnit, real Mana)  -> nothing {
      SetUnitState(whichUnit, UNIT_STATE_MANA, GetUnitState(whichUnit, UNIT_STATE_MANA) - Mana);
    }

    public function UnitAddMana (unit whichUnit, real Mana)  -> nothing {
      SetUnitState(whichUnit, UNIT_STATE_MANA, GetUnitState(whichUnit, UNIT_STATE_MANA) + Mana);
    }

    function EventCastAbil ()  -> nothing {
      SaveUnitCastAbil(GetTriggerUnit(), true);
    }

    function EventEndCast ()  -> nothing {
      SaveUnitCastAbil(GetTriggerUnit(), false);
    }

    public function IsUnitMagicImmune (unit whichUnit)  -> boolean {
      return
      /*
      ! (
      !  UnitHasBuffBJ(whichUnit, 'B03N') ||
      !  UnitHasBuffBJ(whichUnit, 'B01E') ||
      !  UnitHasBuffBJ(whichUnit, 'Bams')
      ! );
      */
      IsUnitType(whichUnit, UNIT_TYPE_MAGIC_IMMUNE);
    }

    function GetUnitAdditionalDamageFromItems (unit whichUnit)  -> integer {
      integer DamageFromItems = 0;
      DamageFromItems += CountOfItems(whichUnit, Filling_Rifle_Inventory) * 55;
      DamageFromItems += CountOfItems(whichUnit, Lightning_Stave_Inventory) * 15;
      DamageFromItems += CountOfItems(whichUnit, Wisdom_Carver_Inventory) * 16;
      DamageFromItems += CountOfItems(whichUnit, Journeys_End_Inventory) * 45;
      DamageFromItems += CountOfItems(whichUnit, Amani_Throw_Axe_Inventory) * 15;
      DamageFromItems += CountOfItems(whichUnit, Bow_Windrunner_Inventory) * 15;
      DamageFromItems += CountOfItems(whichUnit, Royal_Hammer_Inventory_Melee) * 18;
      DamageFromItems += CountOfItems(whichUnit, Royal_Hammer_Inventory_Range) * 18;
      DamageFromItems += CountOfItems(whichUnit, Warsong_Drumes_Inventory) * 6;
      DamageFromItems += CountOfItems(whichUnit, Blackrock_Champions_Axe_Inventory) * 15;
      DamageFromItems += CountOfItems(whichUnit, Corruption_Edge_Inventory) * 45;
      DamageFromItems += CountOfItems(whichUnit, Liberators_Blade_Inventory) * 30;
      DamageFromItems += CountOfItems(whichUnit, Blades_of_Agony_Inventory) * 35;
      DamageFromItems += CountOfItems(whichUnit, Thunderfury_Inventory) * 75;
      DamageFromItems += CountOfItems(whichUnit, Executioner_Clearver_Inventory) * 45;
      DamageFromItems += CountOfItems(whichUnit, Obsidian_Spear_Inventory) * 55;
      DamageFromItems += CountOfItems(whichUnit, Venomstrike_Inventory) * 50;
      DamageFromItems += CountOfItems(whichUnit, Bronze_Sword_Inventory) * 70;
      DamageFromItems += CountOfItems(whichUnit, Sycophant_Inventory) * 45;
      DamageFromItems += CountOfItems(whichUnit, Duel_Blade_Inventory) * 50;
      DamageFromItems += CountOfItems(whichUnit, Skull_Blade_Inventory) * 16;
      DamageFromItems += CountOfItems(whichUnit, Assasins_Blade_Inventory) * 2;
      DamageFromItems += CountOfItems(whichUnit, Repeater_Crossbow_Inventory) * 3;
      DamageFromItems += CountOfItems(whichUnit, Ogre_Mallet_Inventory) * 3;
      DamageFromItems += CountOfItems(whichUnit, Argent_Spear_Inventory) * 25;
      DamageFromItems += CountOfItems(whichUnit, Veterans_Blade_Inventory) * 20;
      DamageFromItems += CountOfItems(whichUnit, Dwarven_Axe_Inventory) * 14;
      DamageFromItems += CountOfItems(whichUnit, Silver_Blade_Inventory) * 24;
      DamageFromItems += CountOfItems(whichUnit, Runed_Gauntlets_Inventory) * 2;
      DamageFromItems += CountOfItems(whichUnit, Mantle_of_Intelligence_Inventory) * 2;
      DamageFromItems += CountOfItems(whichUnit, Mana_Blade_Inventory) * 15;
      DamageFromItems += CountOfItems(whichUnit, Scimitar) * 10;
      DamageFromItems += CountOfItems(whichUnit, Falchion) * 12;
      DamageFromItems += CountOfItems(whichUnit, Hammer) * 14;
      DamageFromItems += CountOfItems(whichUnit, Claws_of_Attack) * 2;
      DamageFromItems += CountOfItems(whichUnit, Claymore) * 25;
      DamageFromItems += CountOfItems(whichUnit, Mace) * 12;
      DamageFromItems += CountOfItems(whichUnit, Gauntlets_of_Ogre) * 2;
      DamageFromItems += CountOfItems(whichUnit, Bow_of_Quelthalas) * 2;
      DamageFromItems += CountOfItems(whichUnit, Great_Sword) * 35;
      DamageFromItems += CountOfItems(whichUnit, Halberd) * 12;
      DamageFromItems += CountOfItems(whichUnit, War_Axe) * 2;
      return DamageFromItems;
    }

    function GetUnitAdditionalDamageFromAbils (unit whichUnit)  -> integer {
      real DamageFromAbils = 0;
      integer BasicDamage = LoadInteger(UnitInfoHashtable, GetUnitTypeId(whichUnit), HERO_BASIC_DAMAGE) + GetHeroStatBJ(LoadInteger(UnitInfoHashtable, GetUnitTypeId(whichUnit), HERO_MAIN_ATTR), whichUnit, false);
      if (UnitHasBuffBJ(whichUnit, 'B03K')) DamageFromAbils += BasicDamage * 1.15;
      if (UnitHasBuffBJ(whichUnit, 'Binf')) DamageFromAbils += BasicDamage * 1.1;
      if (UnitHasBuffBJ(whichUnit, 'BNso')) DamageFromAbils += BasicDamage * (1 + (GetUnitAbilityLevel(DaelinUnit, 'ACfd') * 4 + 2) / 100);
      if (R2I(DamageFromAbils) > BasicDamage) DamageFromAbils -= BasicDamage;
      return R2I(DamageFromAbils);

    }

    public struct UnitStats {
      integer MaxDamage;
      real HP;
      real MP;
      integer MinDamage;
      integer Damage;
      real Armor;
      integer ArmorType;
      
      integer StatType;
      integer CurrentAGI;
      integer CurrentINT;
      integer CurrentSTR;

      unit Unit;

      static method create (unit whichUnit)  -> thistype {
        UnitStats Unit = UnitStats.allocate();
        Unit.Unit = whichUnit;
        Unit.HP = GetUnitState(Unit.Unit, UNIT_STATE_MAX_LIFE);
        Unit.MP = GetUnitState(Unit.Unit, UNIT_STATE_MAX_MANA);
        Unit.Armor = GetHeroArmor(Unit.Unit);
        Unit.CurrentAGI = GetHeroAgi(Unit.Unit, true);
        Unit.CurrentSTR = GetHeroStr(Unit.Unit, true);
        Unit.CurrentINT = GetHeroInt(Unit.Unit, true);
        Unit.StatType = LoadInteger(UnitInfoHashtable, GetUnitTypeId(Unit.Unit), HERO_MAIN_ATTR);

        Unit.Damage =
        LoadInteger(UnitInfoHashtable, GetUnitTypeId(Unit.Unit), HERO_BASIC_DAMAGE) +
        GetHeroStatBJ(Unit.StatType, Unit.Unit, true) +
        GetUnitAdditionalDamageFromItems(Unit.Unit) +
        GetUnitAdditionalDamageFromAbils(Unit.Unit);
        Unit.MinDamage = Unit.Damage + LoadInteger(UnitInfoHashtable, GetUnitTypeId(Unit.Unit), HERO_DICE_NUMBERS);
        Unit.MaxDamage = Unit.Damage +
        (LoadInteger(UnitInfoHashtable, GetUnitTypeId(Unit.Unit), HERO_DICE_NUMBERS) * LoadInteger(UnitInfoHashtable, GetUnitTypeId(Unit.Unit), HERO_DICE_SIDES));

        return Unit;
      }

      method destroy ()  -> nothing {
        this.HP = 0;
        this.MP = 0;
        this.Armor = 0;
        this.CurrentAGI = 0;
        this.CurrentSTR = 0;
        this.CurrentINT = 0;
        this.StatType = 0;
        this.Damage = 0;
        this.MinDamage = 0;
        this.MaxDamage = 0;
        this.Unit = null;
        this.deallocate();
      }

      method GetDamage ()  -> integer {
        return GetRandomInt( this.MinDamage, this.MaxDamage );
      }

    }

    function OnLoadMap ()  -> nothing {
      SaveTriggerHandle(UnitInfoHashtable, Curdran, HERO_TRIG_ONDAMAGE, CurdranOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, CurdranMorphFirst, HERO_TRIG_ONDAMAGE, CurdranOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, CurdranMorphSecond, HERO_TRIG_ONDAMAGE, CurdranOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, CurdranMorphThird, HERO_TRIG_ONDAMAGE, CurdranOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Galen, HERO_TRIG_ONDAMAGE, GalenOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Thoras, HERO_TRIG_ONDAMAGE, ThorasOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Danath, HERO_TRIG_ONDAMAGE, DanathOnDamage);

      SaveTriggerHandle(UnitInfoHashtable, Anduin, HERO_TRIG_ONDAMAGE, AnduinOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Khadgar, HERO_TRIG_ONDAMAGE, KhadgarOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Llane, HERO_TRIG_ONDAMAGE, LlaneOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Mara, HERO_TRIG_ONDAMAGE, MaraOnDamage);

      SaveTriggerHandle(UnitInfoHashtable, Derek, HERO_TRIG_ONDAMAGE, DerekOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Mishan, HERO_TRIG_ONDAMAGE, MishanOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Daelin, HERO_TRIG_ONDAMAGE, DaelinOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Duke, HERO_TRIG_ONDAMAGE, DukeOnDamage);

      SaveTriggerHandle(UnitInfoHashtable, Rhonin, HERO_TRIG_ONDAMAGE, RhoninOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Aegwynn, HERO_TRIG_ONDAMAGE, AegwynnOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Kael, HERO_TRIG_ONDAMAGE, KaelOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Antonidas, HERO_TRIG_ONDAMAGE, AntonidasOnDamage);

      SaveTriggerHandle(UnitInfoHashtable, KillJaeden, HERO_TRIG_ONDAMAGE, KillJaedenOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Mediv, HERO_TRIG_ONDAMAGE, MedivOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, SargerasFirst, HERO_TRIG_ONDAMAGE, MedivOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, SargerasSecond, HERO_TRIG_ONDAMAGE, MedivOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, SargerasThird, HERO_TRIG_ONDAMAGE, MedivOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Mannoroth, HERO_TRIG_ONDAMAGE, MannorothOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Azgalor, HERO_TRIG_ONDAMAGE, AzgalorOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Archimonde, HERO_TRIG_ONDAMAGE, ArchimondeOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Tichondrius, HERO_TRIG_ONDAMAGE, TichondriusOnDamage);

      SaveTriggerHandle(UnitInfoHashtable, Muradin, HERO_TRIG_ONDAMAGE, MuradinOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, MuradinMorph, HERO_TRIG_ONDAMAGE, MuradinOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Magni, HERO_TRIG_ONDAMAGE, MagniOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Gelbin, HERO_TRIG_ONDAMAGE, GelbinOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Brann, HERO_TRIG_ONDAMAGE, BrannOnDamage);

      SaveTriggerHandle(UnitInfoHashtable, Sylvanas, HERO_TRIG_ONDAMAGE, SylvanasOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Alleria, HERO_TRIG_ONDAMAGE, AlleriaOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Anasterian, HERO_TRIG_ONDAMAGE, AnasterianOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, LorThermar, HERO_TRIG_ONDAMAGE, LorThermarOnDamage);

      SaveTriggerHandle(UnitInfoHashtable, Genn, HERO_TRIG_ONDAMAGE, GennOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Arugal, HERO_TRIG_ONDAMAGE, ArugalOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Darius, HERO_TRIG_ONDAMAGE, DariusOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Gavinrad, HERO_TRIG_ONDAMAGE, GavinradOnDamage);

      SaveTriggerHandle(UnitInfoHashtable, Uther, HERO_TRIG_ONDAMAGE, UtherOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Tyralion, HERO_TRIG_ONDAMAGE, TyralionOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, AlonSUS, HERO_TRIG_ONDAMAGE, AlonSUSOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Tirion, HERO_TRIG_ONDAMAGE, TirionOnDamage);

      SaveTriggerHandle(UnitInfoHashtable, Guldan, HERO_TRIG_ONDAMAGE, GuldanOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Nerzhul, HERO_TRIG_ONDAMAGE, NerzhulOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Teron, HERO_TRIG_ONDAMAGE, TeronOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, ChoGall, HERO_TRIG_ONDAMAGE, ChoGallOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Fenris, HERO_TRIG_ONDAMAGE, FenrisOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Zuluhed, HERO_TRIG_ONDAMAGE, ZuluhedOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Ratso, HERO_TRIG_ONDAMAGE, RatsoOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, RatsoMorphFirst, HERO_TRIG_ONDAMAGE, RatsoOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, RatsoMorphSecond, HERO_TRIG_ONDAMAGE, RatsoOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, RatsoMorphThird, HERO_TRIG_ONDAMAGE, RatsoOnDamage);

      SaveTriggerHandle(UnitInfoHashtable, Killrog, HERO_TRIG_ONDAMAGE, KillrogOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, ZulJin, HERO_TRIG_ONDAMAGE, ZulJinOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Grom, HERO_TRIG_ONDAMAGE, GromOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Garona, HERO_TRIG_ONDAMAGE, GaronaOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, GaronaMorphFirst, HERO_TRIG_ONDAMAGE, GaronaOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, GaronaMorphSecond, HERO_TRIG_ONDAMAGE, GaronaOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, GaronaMorphThird, HERO_TRIG_ONDAMAGE, GaronaOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Maim, HERO_TRIG_ONDAMAGE, MaimOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Griselda, HERO_TRIG_ONDAMAGE, GriseldaOnDamage);

      SaveTriggerHandle(UnitInfoHashtable, Blackhand, HERO_TRIG_ONDAMAGE, BlackhandOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Orgrim, HERO_TRIG_ONDAMAGE, OrgrimOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Kargath, HERO_TRIG_ONDAMAGE, KargathOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Dentarg, HERO_TRIG_ONDAMAGE, DentargOnDamage);
      SaveTriggerHandle(UnitInfoHashtable, Rend, HERO_TRIG_ONDAMAGE, RendOnDamage);
    }

    
    private function onInit ()  -> nothing {
      unit u = CreateUnit(Player(15), 'o008', 0, 0, 0);
      integer index;
      timer t = CreateTimer();
      trigger CastAbil = CreateTrigger();
      TriggerRegisterAnyUnitEventBJ(CastAbil, EVENT_PLAYER_UNIT_SPELL_EFFECT);
      TriggerAddAction(CastAbil, function EventCastAbil);
      CastAbil = CreateTrigger();
      TriggerRegisterAnyUnitEventBJ(CastAbil, EVENT_PLAYER_UNIT_SPELL_ENDCAST);
      TriggerAddAction(CastAbil, function EventEndCast);
      TimerStart(t, 0, false, function OnLoadMap);
      //Добавляем абилки ещё во время загрузки, что бы их проинициализировать и если мы будем их вновь добавлять - что бы не было пролага
      UnitAddAbility(u, 'A0GO');
      UnitAddAbility(u, 'A0GT');
      UnitAddAbility(u, 'A0GS');
      UnitAddAbility(u, 'A0GQ');
      UnitAddAbility(u, 'A0GV');
      UnitAddAbility(u, 'A0GW');
      UnitAddAbility(u, 'A0GU');
      UnitAddAbility(u, 'A0GX');
      UnitAddAbility(u, 'A0GR');
      UnitAddAbility(u, 'A0GY');
      RemoveUnit(u);
      u = null;
      for (0 <= index <= 8) {
        SetPlayerTechMaxAllowed(Player(index), Curdran , 0);
        SetPlayerTechMaxAllowed(Player(index), Galen , 0);
        SetPlayerTechMaxAllowed(Player(index), Thoras , 0);
        SetPlayerTechMaxAllowed(Player(index), Danath , 0);
        SetPlayerTechMaxAllowed(Player(index), Anduin , 0);
        SetPlayerTechMaxAllowed(Player(index), Khadgar , 0);
        SetPlayerTechMaxAllowed(Player(index), Llane , 0);
        SetPlayerTechMaxAllowed(Player(index), Mara , 0);
        SetPlayerTechMaxAllowed(Player(index), Daelin , 0);
        SetPlayerTechMaxAllowed(Player(index), Duke , 0);
        SetPlayerTechMaxAllowed(Player(index), Derek , 0);
        SetPlayerTechMaxAllowed(Player(index), Mishan , 0);
        SetPlayerTechMaxAllowed(Player(index), Antonidas , 0);
        SetPlayerTechMaxAllowed(Player(index), Rhonin , 0);
        SetPlayerTechMaxAllowed(Player(index), Kael , 0);
        SetPlayerTechMaxAllowed(Player(index), Aegwynn , 0);
        SetPlayerTechMaxAllowed(Player(index), Magni , 0);
        SetPlayerTechMaxAllowed(Player(index), Brann , 0);
        SetPlayerTechMaxAllowed(Player(index), Gelbin , 0);
        SetPlayerTechMaxAllowed(Player(index), Muradin , 0);
        SetPlayerTechMaxAllowed(Player(index), Anasterian , 0);
        SetPlayerTechMaxAllowed(Player(index), Alleria , 0);
        SetPlayerTechMaxAllowed(Player(index), LorThermar , 0);
        SetPlayerTechMaxAllowed(Player(index), Sylvanas , 0);
        SetPlayerTechMaxAllowed(Player(index), Genn , 0);
        SetPlayerTechMaxAllowed(Player(index), Arugal , 0);
        SetPlayerTechMaxAllowed(Player(index), Gavinrad , 0);
        SetPlayerTechMaxAllowed(Player(index), Darius , 0);
        SetPlayerTechMaxAllowed(Player(index), Uther , 0);
        SetPlayerTechMaxAllowed(Player(index), Tyralion , 0);
        SetPlayerTechMaxAllowed(Player(index), Tirion , 0);
        SetPlayerTechMaxAllowed(Player(index), AlonSUS , 0);
      }

      SetPlayerTechMaxAllowed(Player(0), Curdran , -1);
      SetPlayerTechMaxAllowed(Player(0), Galen , -1);
      SetPlayerTechMaxAllowed(Player(0), Thoras , -1);
      SetPlayerTechMaxAllowed(Player(0), Danath , -1);
      SetPlayerTechMaxAllowed(Player(1), Anduin , -1);
      SetPlayerTechMaxAllowed(Player(1), Khadgar , -1);
      SetPlayerTechMaxAllowed(Player(1), Llane , -1);
      SetPlayerTechMaxAllowed(Player(1), Mara , -1);
      SetPlayerTechMaxAllowed(Player(2), Daelin , -1);
      SetPlayerTechMaxAllowed(Player(2), Duke , -1);
      SetPlayerTechMaxAllowed(Player(2), Derek , -1);
      SetPlayerTechMaxAllowed(Player(2), Mishan , -1);
      SetPlayerTechMaxAllowed(Player(3), Antonidas , -1);
      SetPlayerTechMaxAllowed(Player(3), Rhonin , -1);
      SetPlayerTechMaxAllowed(Player(3), Kael , -1);
      SetPlayerTechMaxAllowed(Player(3), Aegwynn , -1);
      SetPlayerTechMaxAllowed(Player(5), Magni , -1);
      SetPlayerTechMaxAllowed(Player(5), Brann , -1);
      SetPlayerTechMaxAllowed(Player(5), Gelbin , -1);
      SetPlayerTechMaxAllowed(Player(5), Muradin , -1);
      SetPlayerTechMaxAllowed(Player(6), Sylvanas , -1);
      SetPlayerTechMaxAllowed(Player(6), Anasterian , -1);
      SetPlayerTechMaxAllowed(Player(6), Alleria , -1);
      SetPlayerTechMaxAllowed(Player(6), LorThermar , -1);
      SetPlayerTechMaxAllowed(Player(7), Genn , -1);
      SetPlayerTechMaxAllowed(Player(7), Arugal , -1);
      SetPlayerTechMaxAllowed(Player(7), Gavinrad , -1);
      SetPlayerTechMaxAllowed(Player(7), Darius , -1);
      SetPlayerTechMaxAllowed(Player(8), Tyralion , -1);
      SetPlayerTechMaxAllowed(Player(8), Uther , -1);
      SetPlayerTechMaxAllowed(Player(8), Tirion , -1);
      SetPlayerTechMaxAllowed(Player(8), AlonSUS , -1);

      ForceAddPlayer(HordeForce, Player(4));
      ForceAddPlayer(HordeForce, Player(9));
      ForceAddPlayer(HordeForce, Player(10));
      ForceAddPlayer(HordeForce, Player(11));

      ForceAddPlayer(AllianceForce, Player(0));
      ForceAddPlayer(AllianceForce, Player(1));
      ForceAddPlayer(AllianceForce, Player(2));
      ForceAddPlayer(AllianceForce, Player(3));
      ForceAddPlayer(AllianceForce, Player(5));
      ForceAddPlayer(AllianceForce, Player(6));
      ForceAddPlayer(AllianceForce, Player(7));
      ForceAddPlayer(AllianceForce, Player(8));
      //Сохранение информации о юнитах
      SaveUnitData
      (
        Curdran,
        3,
        13,
        18,
        19,
        1.2,
        2.4,
        2,
        6,
        6,
        3,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        CurdranMorphFirst,
        3,
        13,
        18,
        19,
        1.2,
        2.4,
        2,
        7,
        6,
        3,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        CurdranMorphSecond,
        3,
        13,
        18,
        19,
        1.2,
        2.4,
        2,
        6,
        6,
        3,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        CurdranMorphThird,
        3,
        13,
        18,
        19,
        1.2,
        2.4,
        2,
        6,
        6,
        3,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Galen,
        3,
        19,
        13,
        18,
        3.25,
        1.85,
        2.6,
        5,
        6,
        3,
        DEFENSE_TYPE_NORMAL,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        Thoras,
        2,
        15,
        14,
        21,
        1.9,
        1.8,
        2.9,
        7,
        6,
        3,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        Danath,
        4,
        13,
        14,
        23,
        1.5,
        1.7,
        3.15,
        5,
        4,
        3,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        Anduin,
        4,
        13,
        15,
        22,
        1.15,
        1.85,
        2.85,
        5,
        6,
        2,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        Khadgar,
        0,
        14,
        20,
        16,
        0.9,
        2.75,
        1.5,
        1,
        3,
        2,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Llane,
        2,
        15,
        13,
        22,
        1.9,
        1.8,
        2.9,
        8,
        6,
        3,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        Mara,
        2,
        22,
        16,
        19,
        1.4,
        2.8,
        2.4,
        6,
        6,
        2,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Daelin,
        3,
        19,
        13,
        18,
        3.1,
        1.9,
        2.6,
        6,
        6,
        3,
        DEFENSE_TYPE_LIGHT,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        Duke,
        3,
        19,
        14,
        17,
        3.0,
        1.7,
        2.55,
        7,
        6,
        4,
        DEFENSE_TYPE_LIGHT,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        Derek,
        0,
        16,
        18,
        16,
        2.2,
        2.65,
        1.5,
        2,
        8,
        2,
        DEFENSE_TYPE_LIGHT,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Mishan,
        4,
        18,
        15,
        17,
        2.5,
        2.5,
        2.5,
        6,
        6,
        4,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        Antonidas,
        1,
        15,
        20,
        15,
        1.0,
        2.75,
        1.5,
        2,
        3,
        2,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Rhonin,
        1,
        16,
        17,
        17,
        1.95,
        2.6,
        2.4,
        7,
        5,
        2,
        DEFENSE_TYPE_MEDIUM,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Kael,
        1,
        15,
        20,
        15,
        0.9,
        2.7,
        1.7,
        2,
        3,
        1,
        DEFENSE_TYPE_MEDIUM,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Aegwynn,
        0,
        15,
        20,
        15,
        0.9,
        2.55,
        1.5,
        1,
        3,
        1,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Magni,
        2,
        12,
        15,
        23,
        1.3,
        1.75,
        3.4,
        7,
        6,
        4,
        DEFENSE_TYPE_MEDIUM,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        Brann,
        0,
        20,
        14,
        16,
        2.4,
        1.9,
        1.55,
        3,
        8,
        3,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        Gelbin,
        0,
        13,
        20,
        17,
        0.8,
        2.7,
        1.65,
        1,
        4,
        2,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Muradin,
        2,
        12,
        14,
        24,
        1.3,
        1.7,
        3.5,
        8,
        5,
        4,
        DEFENSE_TYPE_MEDIUM,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        MuradinMorph,
        2,
        12,
        14,
        24,
        1.3,
        1.7,
        3.5,
        8,
        5,
        4,
        DEFENSE_TYPE_MEDIUM,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        Anasterian,
        0,
        15,
        19,
        16,
        1.0,
        2.5,
        1.5,
        2,
        4,
        2,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Alleria,
        0,
        21,
        14,
        15,
        2.15,
        1.95,
        1.5,
        2,
        6,
        2,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        LorThermar,
        1,
        19,
        15,
        16,
        3.1,
        2.3,
        2.65,
        5,
        6,
        3,
        DEFENSE_TYPE_MEDIUM,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        Sylvanas,
        0,
        20,
        14,
        16,
        2.2,
        1.95,
        1.5,
        2,
        5,
        2,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        Genn,
        2,
        13,
        17,
        22,
        1.85,
        1.95,
        2.9,
        6,
        7,
        3,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        Arugal,
        2,
        14,
        19,
        17,
        1.0,
        2.6,
        1.6,
        0,
        4,
        2,
        DEFENSE_TYPE_MEDIUM,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Gavinrad,
        2,
        13,
        17,
        22,
        1.55,
        2.0,
        2.8,
        6,
        7,
        2,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        Darius,
        1,
        19,
        14,
        17,
        2.85,
        1.9,
        2.55,
        3,
        6,
        3,
        DEFENSE_TYPE_LIGHT,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        Uther,
        3,
        14,
        14,
        22,
        1.95,
        2.2,
        2.75,
        5,
        5,
        2,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        Tyralion,
        3,
        18,
        15,
        17,
        3.1,
        2.3,
        2.65,
        6,
        6,
        3,
        DEFENSE_TYPE_MEDIUM,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        Tirion,
        1,
        14,
        17,
        19,
        1.5,
        2.0,
        2.65,
        7,
        6,
        2,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        AlonSUS,
        1,
        15,
        19,
        16,
        1.0,
        2.65,
        1.5,
        1,
        4,
        2,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      //*Орда

      SaveUnitData
      (
        Archimonde,
        2,
        14,
        17,
        19,
        1.55,
        2.9,
        2.65,
        1,
        4,
        2,
        DEFENSE_TYPE_LIGHT,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        KillJaeden,
        2,
        13,
        18,
        19,
        1.5,
        3.0,
        2.6,
        5,
        5,
        2,
        DEFENSE_TYPE_LIGHT,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Mannoroth,
        3,
        11,
        16,
        23,
        1.45,
        2.2,
        4.0,
        6,
        6,
        3,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        Tichondrius,
        3,
        16,
        14,
        20,
        3.15,
        1.9,
        2.75,
        4,
        6,
        3,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        Mediv,
        2,
        13,
        20,
        17,
        1.75,
        3.5,
        2.35,
        2,
        6,
        2,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        SargerasFirst,
        2,
        13,
        20,
        17,
        1.75,
        3.5,
        2.35,
        2,
        6,
        2,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        SargerasSecond,
        2,
        13,
        20,
        17,
        1.75,
        3.5,
        2.35,
        2,
        6,
        2,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        SargerasThird,
        2,
        13,
        20,
        17,
        1.75,
        3.5,
        2.35,
        2,
        6,
        2,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Azgalor,
        2,
        10,
        16,
        24,
        1.1,
        2.35,
        3.7,
        8,
        5,
        3,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        Guldan,
        2,
        18,
        19,
        16,
        1.0,
        2.75,
        2.3,
        2,
        3,
        2,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Nerzhul,
        2,
        20,
        18,
        15,
        1.7,
        2.5,
        2.25,
        2,
        4,
        2,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Teron,
        2,
        18,
        20,
        15,
        1.0,
        2.8,
        2.2,
        2,
        3,
        2,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        ChoGall,
        2,
        11,
        19,
        20,
        0.9,
        2.8,
        2.8,
        7,
        6,
        3,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Fenris,
        1,
        18,
        19,
        15,
        1.95,
        2.8,
        2.4,
        2,
        5,
        2,
        DEFENSE_TYPE_MEDIUM,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Ratso,
        1,
        15,
        19,
        19,
        1.65,
        2.45,
        2.25,
        2,
        3,
        2,
        DEFENSE_TYPE_LIGHT,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        RatsoMorphFirst,
        3,
        15,
        19,
        19,
        1.65,
        2.45,
        2.25,
        2,
        3,
        2,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        RatsoMorphSecond,
        5,
        15,
        19,
        19,
        1.65,
        2.45,
        2.25,
        2,
        3,
        2,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        RatsoMorphThird,
        7,
        15,
        19,
        19,
        1.65,
        2.45,
        2.25,
        2,
        3,
        2,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        RatsoMorphFouth,
        9,
        15,
        19,
        19,
        1.65,
        2.45,
        2.25,
        2,
        3,
        2,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Zuluhed,
        1,
        18,
        19,
        15,
        0.9,
        2.9,
        2.25,
        2,
        5,
        2,
        DEFENSE_TYPE_LIGHT,
        bj_HEROSTAT_INT
      );
      SaveUnitData
      (
        Blackhand,
        4,
        15,
        16,
        19,
        2.1,
        1.8,
        3.9,
        6,
        9,
        5,
        DEFENSE_TYPE_LIGHT,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        Orgrim,
        4,
        16,
        15,
        19,
        2.0,
        1.7,
        3.75,
        7,
        8,
        5,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        Kargath,
        4,
        12,
        15,
        23,
        1.85,
        1.8,
        3.9,
        7,
        7,
        3,
        DEFENSE_TYPE_MEDIUM,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        Dentarg,
        2,
        11,
        17,
        22,
        1.0,
        2.25,
        3.85,
        10,
        8,
        3,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        Rend,
        2,
        12,
        14,
        24,
        1.7,
        1.8,
        3.65,
        6,
        6,
        3,
        DEFENSE_TYPE_LARGE,
        bj_HEROSTAT_STR
      );
      SaveUnitData
      (
        Killrog,
        4,
        18,
        15,
        17,
        3.3,
        1.8,
        2.85,
        5,
        8,
        5,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        Grom,
        4,
        18,
        14,
        18,
        3.25,
        1.95,
        2.9,
        6,
        9,
        4,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        GromMorph,
        4,
        18,
        14,
        18,
        3.25,
        1.95,
        2.9,
        6,
        9,
        4,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        ZulJin,
        0,
        20,
        16,
        14,
        2.3,
        1.5,
        1.45,
        3,
        5,
        2,
        DEFENSE_TYPE_LIGHT,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        Garona,
        3,
        19,
        16,
        15,
        2.5,
        2.1,
        2.6,
        5,
        8,
        5,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        GaronaMorphFirst,
        3,
        19,
        16,
        15,
        2.5,
        2.1,
        2.6,
        5,
        8,
        5,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        GaronaMorphSecond,
        3,
        19,
        16,
        15,
        2.5,
        2.1,
        2.6,
        5,
        8,
        5,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        GaronaMorphThird,
        3,
        19,
        16,
        15,
        2.5,
        2.1,
        2.6,
        5,
        8,
        5,
        DEFENSE_TYPE_NONE,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        Maim,
        4,
        16,
        14,
        20,
        3.1,
        1.9,
        2.75,
        6,
        8,
        5,
        DEFENSE_TYPE_MEDIUM,
        bj_HEROSTAT_AGI
      );
      SaveUnitData
      (
        Griselda,
        1,
        18,
        17,
        15,
        2.4,
        1.95,
        2.6,
        5,
        6,
        3,
        DEFENSE_TYPE_MEDIUM,
        bj_HEROSTAT_AGI
      );

      CurdranUnit     = gg_unit_Hmbr_0462;
      GalenUnit       = gg_unit_H01I_0514;
      ThorasUnit      = gg_unit_Huth_0479;
      DanathUnit      = gg_unit_Hdgo_0520;
      AnduinUnit      = gg_unit_Hlgr_0523;
      KhadgarUnit     = gg_unit_Hgam_0513;
      LlaneUnit       = gg_unit_Hpb1_0517;
      MaraUnit        = gg_unit_Edem_0550;
      DaelinUnit      = gg_unit_Hapm_0503;
      DukeUnit        = gg_unit_Hhkl_0486;
      DerekUnit       = gg_unit_H01B_0507;
      AntonidasUnit   = gg_unit_Hant_0475;
      RhoninUnit      = gg_unit_Hjai_0459;
      KaelUnit        = gg_unit_Hblm_0508;
      AegwynnUnit     = gg_unit_Ewar_0489;
      MagniUnit       = gg_unit_Hmkg_0476;
      BrannUnit       = gg_unit_H005_0502;
      GelbinUnit      = gg_unit_Hpal_0463;
      MuradinUnit     = gg_unit_Ucrl_0500;
      AnasterianUnit  = gg_unit_Hkal_0491;
      AlleriaUnit     = gg_unit_Hvwd_0525;
      LorThemarUnit   = gg_unit_H01Q_0521;
      SylvanasUnit    = gg_unit_Hamg_0499;
      //GennUnit        = udg_Greymane;
      ArugalUnit      = gg_unit_Hvsh_0480;
      GavinradUnit    = gg_unit_H018_0506;
      DariusUnit      = gg_unit_Nalc_0495;
      UtherUnit       = gg_unit_Hmgd_0509;
      TyralionUnit    = gg_unit_Harf_0501;
      TirionUnit      = gg_unit_Hart_0504;
      AlonSUSUnit     = gg_unit_H01S_0510;
      ArchimondeUnit  = gg_unit_Uwar_0460;
      KillJaedenUnit  = gg_unit_Nklj_0461;
      MannorothUnit   = gg_unit_Nplh_0487;
      TichondriusUnit = gg_unit_Utic_0512;
      MedivUnit       = gg_unit_N007_0522;
      AzgalorUnit     = gg_unit_Npld_0527;
      GuldanUnit      = gg_unit_Othr_0515;
      NerzhulUnit     = gg_unit_Orkn_0516;
      TeronUnit       = gg_unit_Ogld_0530;
      ChoGallUnit     = gg_unit_Orex_0465;
      FenrisUnit      = gg_unit_Ofar_0481;
      RatsoUnit       = gg_unit_Ntin_0477;
      ZuluhedUnit     = gg_unit_Otch_0529;
      BlackhandUnit   = gg_unit_Nbbc_0485;
      OrgrimUnit      = gg_unit_Ogrh_0532;
      KargathUnit     = gg_unit_Nsjs_0498;
      DentargUnit     = gg_unit_Ocbh_0511;
      RendUnit        = gg_unit_Nbst_0519;
      KillrogUnit     = gg_unit_Osam_0526;
      ZulJinUnit      = gg_unit_Odrt_0524;
      GromUnit        = gg_unit_Opgh_0483;
      GaronaUnit      = gg_unit_O00M_0518;
      MaimUnit        = gg_unit_Obla_0496;
      GriseldaUnit    = gg_unit_Ekee_0528;
    }

  }
//! endzinc