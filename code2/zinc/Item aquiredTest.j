//! zinc
  library TestItemAq requires CothUtilities {

    integer RemovedItem[6];
    integer RemovedItemIndex = 0;
    integer RemovedItemPosition[6];
    hashtable ItemDataHashtable = InitHashtable();
    group Stonepath_Owners = CreateGroup();

    function ItemIndex (integer itemType, unit whichUnit)  -> integer {
      integer i;
      for (0 <= i <= 5) {
        if (GetItemTypeId(UnitItemInSlot(whichUnit, i)) == itemType && UnitItemInSlot(whichUnit, i) != null) return i;
      }
      return -1;
    }

    function UnitHasItemOfType (unit whichUnit, integer ItemID)  -> boolean {
      return ItemIndex(ItemID, whichUnit) != -1;
    }

    function GetHeroFreeSlots (unit whichHero)  -> integer {
      integer index;
      integer count = 0;
      for (0 <= index <= 5) {
          if (GetItemTypeId(UnitItemInSlot(whichHero, index)) == 0) count += 1;
      }
      return count;
    }

    function CountOfItemPointsForItem (integer ItemID, unit whichUnit)  -> integer {
      integer i;
      integer SubItem;
      integer price = LoadInteger(ItemDataHashtable, ItemID, 6);
      //У нас есть нужный нам айтем - возвращаем 0 и удаляем этот айтем
      if (UnitHasItemOfType(whichUnit, ItemID)) {
        //BJDebugMsg("У юнита есть айтем " + GetObjectName(ItemID) + " возвращаю 0");
        RemovedItem[RemovedItemIndex] = ItemID;
        RemovedItemPosition[RemovedItemIndex] = ItemIndex(ItemID, whichUnit);
        RemovedItemIndex += 1;
        RemoveItem(UnitItemInSlot(whichUnit, ItemIndex(ItemID, whichUnit)));
        return 0;
      }
      
      //Проверяем все 6 слотов для под-айтемов, нашего айтема-цели
      for (0 <= i <= 5) {
        SubItem = LoadInteger(ItemDataHashtable, ItemID, i);
        //Если у нас есть этот предмет - удаляем его и сохраняем айди
        if (UnitHasItemOfType(whichUnit, SubItem) && SubItem > 0) {
          RemovedItem[RemovedItemIndex] = SubItem;
          RemovedItemPosition[RemovedItemIndex] = ItemIndex(SubItem, whichUnit);
          RemovedItemIndex += 1;
          RemoveItem(UnitItemInSlot(whichUnit, ItemIndex(SubItem, whichUnit)));
        } else if (LoadInteger(ItemDataHashtable, SubItem, 0) != 0) {
          //Если у нас нет этого предмета, но он из чего-то собирается - вызываем эту же функцию, для проверки уже его цены
          price += CountOfItemPointsForItem(SubItem, whichUnit);
        } else if (LoadInteger(ItemDataHashtable, SubItem, 0) == 0 && !UnitHasItemOfType(whichUnit, SubItem)) {
          //Если у нас нет этого прдемета и он не собирается - добавляем его цену
          price += LoadInteger(ItemDataHashtable, SubItem, 6);
        }
      }
      return price;
    }

    function IsItemUnique (integer ItemID)  -> boolean {
      return
      (
        ItemID == Corruption_Edge_Inventory ||
        ItemID == Liberators_Blade_Inventory ||
        ItemID == Blades_of_Agony_Inventory ||
        ItemID == Filling_Rifle_Inventory ||
        ItemID == Thunderfury_Inventory ||
        ItemID == Executioner_Clearver_Inventory || 
        ItemID == Obsidian_Spear_Inventory ||
        ItemID == Venomstrike_Inventory ||
        ItemID == Bronze_Sword_Inventory ||
        ItemID == Sycophant_Inventory ||
        ItemID == Duel_Blade_Inventory ||
        ItemID == Breast_Plate_of_the_Lightbringer_Inventory ||
        ItemID == Bronze_Greaves_Inventory || 
        ItemID == Grim_Ward_Inventory ||
        ItemID == Steel_Shield_Inventory ||
        ItemID == Dragonscale_Sheath_Inventory || 
        ItemID == Soul_Slippers_Inventory ||
        ItemID == Bastion_of_Purity_Inventory ||
        ItemID == Ring_of_Protection_RDD_Inventory ||
        ItemID == Stonepath_Chestguard_Inventory ||
        ItemID == Essence_of_Aszune_Inventory ||
        ItemID == Glacial_Shield_Inventory ||
        ItemID == Arcane_Wonder_Inventory ||
        ItemID == Battlehirst_Helm_Inventory ||
        ItemID == Aegis_Gloves_Inventory ||
        ItemID == Wisdom_Carver_Inventory ||
        ItemID == Starlights_Inventory ||
        ItemID == Journeys_End_Inventory ||
        ItemID == Wind_Stave_Inventory ||
        ItemID == Death_Edge_Inventory ||
        ItemID == Radiant_Savior_Inventory ||
        ItemID == Lightning_Stave_Inventory ||
        ItemID == Talisman_of_the_Wild_Inventory ||
        ItemID == Wand_of_the_Wayward_Inventory ||
        ItemID == Urn_Inventory ||
        ItemID == Amani_Throw_Axe_Inventory ||
        ItemID == Soul_Ring_Inventory || 
        ItemID == Flute_Accurance_Inventory ||
        ItemID == Bloodmoon_Plate_Inventory ||
        ItemID == Bow_Windrunner_Inventory ||
        ItemID == Wolf_Hunters_Guise_Inventory ||
        ItemID == Royal_Hammer_Inventory_Melee ||
        ItemID == Royal_Hammer_Inventory_Range ||
        ItemID == Sunscale_Helm_Inventory ||
        ItemID == Warsong_Drumes_Inventory ||
        ItemID == Ogreskull_Inventory ||
        ItemID == Blackrock_Champions_Axe_Inventory ||
        ItemID == Bulwark_Demonbone_Inventory
      );
    }

    function IsHeroInventoryFullWithUniqueItems (unit whichUnit)  -> boolean {
      integer i;
      integer count = 0;
      for (0 <= i <= 5) {
        if (IsItemUnique(GetItemTypeId(UnitItemInSlot(whichUnit, i)))) count += 1;
      }
      return count == 6;
    }

    function ItemHasTwoVariants (integer ItemID)  -> boolean {
      return LoadInteger(ItemDataHashtable, ItemID, 8) != 0;
    }

    function onItemBuy ()  -> nothing {
      integer ItemID = GetItemTypeId(GetManipulatedItem());
      integer i;
      integer price = LoadInteger(ItemDataHashtable, ItemID, 6);
      integer TargetItemID;
      effect e = null;
      //Попытались подобрать чужой предмет
      if (GetItemPlayer(GetManipulatedItem()) != Player(15) && GetItemPlayer(GetManipulatedItem()) != GetTriggerPlayer() && udg_Sandbox != 11) {
        DisplayTimedTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, 15, "Ты не можешь поднять чужой предмет!");
        UnitRemoveItem(GetTriggerUnit(), GetManipulatedItem());
        return;
      }
      //Мы подобрали предмет, а не купили руну
      if (LoadInteger(ItemDataHashtable, ItemID, 7) == 0) {
        SetItemPlayer(GetManipulatedItem(), GetTriggerPlayer(), false);
        return;
      }
      //Проверка, купили ли мы урну для игрока альянса и наоборот
      if (ItemID == Urn && !IsPlayerInForce(GetTriggerPlayer(), HordeForce)) {
        DisplayTextToPlayer(GetTriggerPlayer(), 0, 0, "Этот предмет доступен только игрокам орды! Его аналог для альянса - талисман леса");
        return;
      }
      if (ItemID == Talisman_of_the_Wild && !IsPlayerInForce(GetTriggerPlayer(), AllianceForce)) {
        DisplayTextToPlayer(GetTriggerPlayer(), 0, 0, "Этот предмет доступен только игрокам альянса! Его аналог для орды - урна");
        return;
      }
      if (ItemID == Book_of_Agillity || ItemID == Book_of_Strength || ItemID == Book_of_Intelligence) {
        if (!IsHeroInventoryFullWithUniqueItems(GetTriggerUnit())) {
          DisplayTextToPlayer(GetTriggerPlayer(), 0, 0, "Необходимо, что бы у вас инвентарь был заполнен уникальными предметами!");
          SetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD) + price);
          return;
        }
        //Если у нас все уникальные - добавляем триггерно характеристику
        if (ItemID == Book_of_Agillity) SetHeroAgi(GetTriggerUnit(), GetHeroAgi(GetTriggerUnit(), false) + 1, true);
        if (ItemID == Book_of_Intelligence) SetHeroInt(GetTriggerUnit(), GetHeroInt(GetTriggerUnit(), false) + 1, true);
        if (ItemID == Book_of_Strength) SetHeroStr(GetTriggerUnit(), GetHeroStr(GetTriggerUnit(), false) + 1, true);
      }
      if (ItemID == Journeys_End) {
        if
        (
          GetUnitTypeId(GetTriggerUnit()) == Aegwynn ||
          GetUnitTypeId(GetTriggerUnit()) == Archimonde ||
          GetUnitTypeId(GetTriggerUnit()) == Arugal ||
          GetUnitTypeId(GetTriggerUnit()) == Blackhand ||
          GetUnitTypeId(GetTriggerUnit()) == ChoGall ||
          GetUnitTypeId(GetTriggerUnit()) == Fenris ||
          GetUnitTypeId(GetTriggerUnit()) == Galen ||
          GetUnitTypeId(GetTriggerUnit()) == Garona ||
          GetUnitTypeId(GetTriggerUnit()) == Grom ||
          GetUnitTypeId(GetTriggerUnit()) == Curdran ||
          GetUnitTypeId(GetTriggerUnit()) == Maim ||
          GetUnitTypeId(GetTriggerUnit()) == Thoras ||
          GetUnitTypeId(GetTriggerUnit()) == Darius ||
          GetUnitTypeId(GetTriggerUnit()) == Tyralion
        )
        {
          DisplayTextToPlayer(GetTriggerPlayer(), 0, 0, "Этот предмет недоступен для вашего героя!");
          return;
        }
      }
      //Мы купили предмет, который из ничего не собирается - значит он не должен быть руной и просто ничего не делаем
      if (LoadInteger(ItemDataHashtable, ItemID, 0) == 0) return;

      //Смотрим для всех 6 мест под собирающийся айтем, есть ли он
      for (0 <= i <= 5) {
        TargetItemID = LoadInteger(ItemDataHashtable, ItemID, i);
        //Если доп айтем под слотом i не существует - мы перебрали все доп айтемы
        if (TargetItemID == 0) break;
        //Высчитываем то, сколько надо потратить денег на то, что бы получить под-айтем (если он уже есть - значение будет равно 0)
        price += CountOfItemPointsForItem(TargetItemID, GetTriggerUnit() );
      }
      if (GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD) < price) {
        DisplayTextToPlayer(GetTriggerPlayer(), 0, 0, "Вам необходимо ещё: " + I2S(price - GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD)) + " очков предметов.");
        for (0 <= i <= 5) {
          if (RemovedItem[i] > 0) UnitAddItemToSlotById(GetTriggerUnit(), RemovedItem[i], RemovedItemPosition[i]);
          RemovedItem[i] = 0;
          RemovedItemPosition[i] = -1;
        }
        RemovedItemIndex = 0;
        return;
      }
      if (GetHeroFreeSlots(GetTriggerUnit()) + RemovedItemIndex == 0) {
        DisplayTextToPlayer(GetTriggerPlayer(), 0, 0, "У вас заполнен инвентарь!");
        for (0 <= i <= 5) {
          if (RemovedItem[i] > 0) {
            UnitAddItemToSlotById(GetTriggerUnit(), RemovedItem[i], RemovedItemPosition[i]);
          }
          RemovedItem[i] = 0;
          RemovedItemPosition[i] = -1;
        }
        RemovedItemIndex = 0;
        return;
      }
      SetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD) - price);
      e = AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl", GetTriggerUnit(), "origin");
      if (ItemHasTwoVariants(ItemID)) {
        if (IsHeroRange(GetTriggerUnit())) {
          SetItemPlayer(UnitAddItemById(GetTriggerUnit(), LoadInteger(ItemDataHashtable, ItemID, 7)), GetTriggerPlayer(), false);
        } else {
          SetItemPlayer(UnitAddItemById(GetTriggerUnit(), LoadInteger(ItemDataHashtable, ItemID, 8)), GetTriggerPlayer(), false);
        }
      } else {
        SetItemPlayer(UnitAddItemById(GetTriggerUnit(), LoadInteger(ItemDataHashtable, ItemID, 7)), GetTriggerPlayer(), false);
      }
      for (0 <= i <= 5) {
        RemovedItem[i] = 0;
        RemovedItemPosition[i] = -1;
      }
      RemovedItemIndex = 0;
    }

    function CreateItem
    (
      integer SourceItem,
      integer FirstRequirement, 
      integer SecondRequirement, 
      integer ThirdRequirement,
      integer FourthRequirement,
      integer FivethRequirement,
      integer SixthRequirement,
      integer Price,
      integer ItemInventory
    )  -> nothing {
      SaveInteger(ItemDataHashtable, SourceItem, 0, FirstRequirement);
      SaveInteger(ItemDataHashtable, SourceItem, 1, SecondRequirement);
      SaveInteger(ItemDataHashtable, SourceItem, 2, ThirdRequirement);
      SaveInteger(ItemDataHashtable, SourceItem, 3, FourthRequirement);
      SaveInteger(ItemDataHashtable, SourceItem, 4, FivethRequirement);
      SaveInteger(ItemDataHashtable, SourceItem, 5, SixthRequirement);
      SaveInteger(ItemDataHashtable, SourceItem, 6, Price);
      SaveInteger(ItemDataHashtable, SourceItem, 7, ItemInventory);

      if (ItemInventory != 0) {
        SaveInteger(ItemDataHashtable, ItemInventory, 0, FirstRequirement);
        SaveInteger(ItemDataHashtable, ItemInventory, 1, SecondRequirement);
        SaveInteger(ItemDataHashtable, ItemInventory, 2, ThirdRequirement);
        SaveInteger(ItemDataHashtable, ItemInventory, 3, FourthRequirement);
        SaveInteger(ItemDataHashtable, ItemInventory, 4, FivethRequirement);
        SaveInteger(ItemDataHashtable, ItemInventory, 5, SixthRequirement);
        SaveInteger(ItemDataHashtable, ItemInventory, 6, Price);
      }
    }

    function CreateItemFiveReq
    (
      integer SourceItem,
      integer FirstRequirement, 
      integer SecondRequirement, 
      integer ThirdRequirement,
      integer FourthRequirement,
      integer FivethRequirement,
      integer Price,
      integer ItemInventory
    )  -> nothing {
      CreateItem(SourceItem, FirstRequirement, SecondRequirement, ThirdRequirement, FourthRequirement, FivethRequirement, 0, Price, ItemInventory);
    }

    function CreateItemFourReq
    (
      integer SourceItem,
      integer FirstRequirement, 
      integer SecondRequirement, 
      integer ThirdRequirement,
      integer FourthRequirement,
      integer Price,
      integer ItemInventory
    )  -> nothing {
      CreateItem(SourceItem, FirstRequirement, SecondRequirement, ThirdRequirement, FourthRequirement, 0, 0, Price, ItemInventory);
    }

    function CreateItemThreeReq
    (
      integer SourceItem,
      integer FirstRequirement, 
      integer SecondRequirement, 
      integer ThirdRequirement,
      integer Price,
      integer ItemInventory
    )  -> nothing {
      CreateItem(SourceItem, FirstRequirement, SecondRequirement, ThirdRequirement, 0, 0, 0, Price, ItemInventory);
    }

    function CreateItemTwoReq
    (
      integer SourceItem,
      integer FirstRequirement, 
      integer SecondRequirement, 
      integer Price,
      integer ItemInventory
    )  -> nothing {
      CreateItem(SourceItem, FirstRequirement, SecondRequirement, 0, 0, 0, 0, Price, ItemInventory);
    }

    function CreateItemOneReq
    (
      integer SourceItem,
      integer FirstRequirement, 
      integer Price,
      integer ItemInventory
    )  -> nothing {
      CreateItem(SourceItem, FirstRequirement, 0, 0, 0, 0, 0, Price, ItemInventory);
    }

    function CreateSimpleItem
    (
      integer ItemID,
      integer Price
    )  -> nothing {
      CreateItem(ItemID, 0, 0, 0, 0, 0, 0, Price, 0);
    }

    function Stonepath_Armor ()  -> nothing {
      unit TriggerUnit = GetTriggerUnit();
      player TriggerPlayer = GetTriggerPlayer();
      TriggerSleepAction(0.01);
      if (UnitHasItemOfType(TriggerUnit, Stonepath_Chestguard_Inventory)) {
        GroupAddUnit(Stonepath_Owners, TriggerUnit);
        UnitAddAbility(TriggerUnit, 'A0GT');
        UnitAddAbility(TriggerUnit, 'A0GV');
        UnitAddAbility(TriggerUnit, 'A0GU');
      } else {
        GroupRemoveUnit(Stonepath_Owners, TriggerUnit);
        UnitRemoveAbility(TriggerUnit, 'A0GT');
        UnitRemoveAbility(TriggerUnit, 'A0GV');
        UnitRemoveAbility(TriggerUnit, 'A0GU');
        UnitRemoveAbility(TriggerUnit, 'B04O');
        UnitRemoveAbility(TriggerUnit, 'B04N');
      }
      TriggerUnit = null;
      TriggerPlayer = null;
    }

    function Update ()  -> nothing {
      real HeroArmor = GetHeroArmor(GetEnumUnit()) * 0.25;
      string HeroArmorStr = R2SW(HeroArmor, 2, 2);
      unit EnumUnit = GetEnumUnit();
      if (IsUnitDeadBJ(EnumUnit)) return;
      debug BJDebugMsg("Армор юнита: " + R2SW(GetHeroArmor(GetEnumUnit()), 2, 2));
      debug BJDebugMsg("Грудак даёт армора: " + HeroArmorStr);
      if (HeroArmor >= 100) {
        SetUnitAbilityLevel(EnumUnit, 'A0GU', S2I(SubString(HeroArmorStr, 0, 1)) + 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GT', S2I(SubString(HeroArmorStr, 1, 2)) + 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GV', S2I(SubString(HeroArmorStr, 2, 3)) + 1);

        SetUnitAbilityLevel(EnumUnit, 'A0GQ', S2I(SubString(HeroArmorStr, 4, 5)) + 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GR', S2I(SubString(HeroArmorStr, 5, 6)) + 1);
      } else if (HeroArmor >= 10) {
        SetUnitAbilityLevel(EnumUnit, 'A0GU', 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GT', S2I(SubString(HeroArmorStr, 0, 1)) + 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GV', S2I(SubString(HeroArmorStr, 1, 2)) + 1);

        SetUnitAbilityLevel(EnumUnit, 'A0GQ', S2I(SubString(HeroArmorStr, 3, 4)) + 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GR', S2I(SubString(HeroArmorStr, 4, 5)) + 1);
      } else if (HeroArmor >= 1) {
        SetUnitAbilityLevel(EnumUnit, 'A0GU', 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GT', 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GV', S2I(SubString(HeroArmorStr, 0, 1)) + 1);

        SetUnitAbilityLevel(EnumUnit, 'A0GQ', S2I(SubString(HeroArmorStr, 2, 3)) + 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GR', S2I(SubString(HeroArmorStr, 3, 4)) + 1);
      } else if (HeroArmor >= 0.1) {
        SetUnitAbilityLevel(EnumUnit, 'A0GU', 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GT', 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GV', 1);

        SetUnitAbilityLevel(EnumUnit, 'A0GQ', S2I(SubString(HeroArmorStr, 1, 2)) + 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GR', S2I(SubString(HeroArmorStr, 2, 3)) + 1);
      } else if (HeroArmor >= 0.01) {
        SetUnitAbilityLevel(EnumUnit, 'A0GU', 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GT', 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GV', 1);

        SetUnitAbilityLevel(EnumUnit, 'A0GQ', 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GR', S2I(SubString(HeroArmorStr, 1, 2)) + 1);
      } else {
        SetUnitAbilityLevel(EnumUnit, 'A0GU', 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GT', 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GV', 1);

        SetUnitAbilityLevel(EnumUnit, 'A0GQ', 1);
        SetUnitAbilityLevel(EnumUnit, 'A0GR', 1);
      }
      if (IsUnitInGroup(GetEnumUnit(), Stonepath_Owners)) {
        UnitAddAbility(GetEnumUnit(), 'A0GT');
        UnitAddAbility(GetEnumUnit(), 'A0GV');
        UnitAddAbility(GetEnumUnit(), 'A0GU');
      } else {
        UnitRemoveAbility(GetEnumUnit(), 'A0GT');
        UnitRemoveAbility(GetEnumUnit(), 'A0GV');
        UnitRemoveAbility(GetEnumUnit(), 'A0GU');
      }
      EnumUnit = null;
    }
    
    function Stonepath_Update ()  -> nothing {
      ForGroup(Stonepath_Owners, function Update);
    }

    function onInit ()  -> nothing {
      trigger t = CreateTrigger();
      CreateSimpleItem(Great_Sword, 2400);
      CreateSimpleItem(Halberd, 900);
      CreateSimpleItem(War_Axe, 1000);
      CreateSimpleItem(Claymore, 1700);
      CreateSimpleItem(Mace, 925);
      CreateSimpleItem(Gauntlets_of_Ogre, 325);
      CreateSimpleItem(Bow_of_Quelthalas, 1000);
      CreateSimpleItem(Scimitar, 775);
      CreateSimpleItem(Falchion, 875);
      CreateSimpleItem(Hammer, 950);
      CreateSimpleItem(Claws_of_Attack, 325);

      CreateSimpleItem(Ring_of_Protection, 225);
      CreateSimpleItem(Spiked_Helm, 820);
      CreateSimpleItem(Cloak_of_Evasion, 650);
      CreateSimpleItem(Gauntlets_of_Attack_Speed, 500);
      CreateSimpleItem(Wooden_Shield, 500);
      CreateSimpleItem(Battle_Helm, 875);
      CreateSimpleItem(Robe_of_the_Magi, 650);
      CreateSimpleItem(Boots_of_Speed, 350);
      CreateSimpleItem(Bronze_Shield, 850);
      CreateSimpleItem(Chest_Plate, 1000);
      CreateSimpleItem(Belt_of_Giants, 650);

      CreateSimpleItem(Ring_of_Regeneration, 390);
      CreateSimpleItem(Periart_of_Vitality, 475);
      CreateSimpleItem(Star_Wand, 325);
      CreateSimpleItem(Circlet_of_Nobility, 175);
      CreateSimpleItem(Amulet_of_Health, 600);
      CreateSimpleItem(Sobi_Mask, 400);
      CreateSimpleItem(Pedant_of_Mana, 450);
      CreateSimpleItem(Medallion_of_Curage, 1000);
      CreateSimpleItem(Cursed_Bones, 975);
      CreateSimpleItem(Enchanted_Skull, 600);
      CreateSimpleItem(Mage_Stave, 1000);

      CreateSimpleItem(Book_of_Agillity, 600);
      CreateSimpleItem(Book_of_Strength, 575);
      CreateSimpleItem(Book_of_Intelligence, 550);

      //*Редкие предметы
      //*Редкое оружие
      CreateItemTwoReq(Skull_Blade, Mace, Enchanted_Skull, 275, Skull_Blade_Inventory);
      CreateItemTwoReq(Assasins_Blade, Claws_of_Attack, Circlet_of_Nobility, 275, Assasins_Blade_Inventory);
      CreateItemTwoReq(Repeater_Crossbow, Claws_of_Attack, Cloak_of_Evasion, 275, Repeater_Crossbow_Inventory);
      CreateItemTwoReq(Ogre_Mallet, Gauntlets_of_Ogre, Belt_of_Giants, 275, Ogre_Mallet_Inventory);
      CreateItemTwoReq(Argent_Spear, Halberd, Scimitar, 275, Argent_Spear_Inventory);
      CreateItemTwoReq(Veterans_Blade, Falchion, Ring_of_Protection, 550, Veterans_Blade_Inventory);
      CreateItemTwoReq(Dwarven_Axe, Halberd, Belt_of_Giants, 275, Dwarven_Axe_Inventory);
      CreateItemTwoReq(Silver_Blade, Scimitar, Falchion, 275, Silver_Blade_Inventory);
      //*Редкая броня
      CreateItemTwoReq(Gauntlets_of_Power, Gauntlets_of_Attack_Speed, Medallion_of_Curage, 275, Gauntlets_of_Power_Inventory);
      CreateItemTwoReq(Runed_Gauntlets, Gauntlets_of_Ogre, Circlet_of_Nobility, 275, Runed_Gauntlets_Inventory);
      CreateItemTwoReq(Swift_Shield, Gauntlets_of_Attack_Speed, Wooden_Shield, 275, Swift_Shield_Inventory);
      CreateItemTwoReq(Slippers_of_Agillity, Cloak_of_Evasion, Boots_of_Speed, 275, Slippers_of_Agillity_Inventory);
      CreateItemTwoReq(Runed_Bracers, Amulet_of_Health, Ring_of_Protection, 275, Runed_Bracers_Inventory);
      CreateItemTwoReq(Helm_Of_Energy, Battle_Helm, Pedant_of_Mana, 275, Helm_Of_Energy_Inventory);
      CreateItemTwoReq(Plated_Boots, Boots_of_Speed, Ring_of_Regeneration, 275, Plated_Boots_Inventory);
      CreateItemTwoReq(Ring_of_Titus, Periart_of_Vitality, Ring_of_Protection, 275, Ring_of_Titus_Inventory);
      CreateItemTwoReq(Great_Shield, Wooden_Shield, Ring_of_Protection, 325, Great_Shield_Inventory);
      //*Редкие аксессуары
      CreateItemTwoReq(Shaman_Claws, Claws_of_Attack, Sobi_Mask, 275, Shaman_Claws_Inventory);
      CreateItemTwoReq(Mantle_of_Intelligence, Star_Wand, Circlet_of_Nobility, 275, Mantle_of_Intelligence_Inventory);
      CreateItemTwoReq(Khadgar_Gem, Amulet_of_Health, Periart_of_Vitality, 275, Khadgar_Gem_Inventory);
      CreateItemTwoReq(Frozen_Shard, Sobi_Mask, Ring_of_Regeneration, 275, Frozen_Shard_Inventory);
      CreateItemTwoReq(Rod_of_Necromancy, Star_Wand, Enchanted_Skull, 275, Rod_of_Necromancy_Inventory);
      CreateItemTwoReq(Mana_Blade, Robe_of_the_Magi, Scimitar, 275, Mana_Blade_Inventory);
      CreateItemTwoReq(Crystall_Ball, Robe_of_the_Magi, Enchanted_Skull, 275, Crystall_Ball_Inventory);

      //*Уникальные предметы
      //*Уникальное оружие
      CreateItemTwoReq(Corruption_Edge, Claymore, Skull_Blade_Inventory, 600, Corruption_Edge_Inventory);
      CreateItemTwoReq(Liberators_Blade, Cursed_Bones, Silver_Blade, 700, Liberators_Blade_Inventory);
      CreateItemThreeReq(Blades_of_Agony, Claymore, Gauntlets_of_Attack_Speed, Assasins_Blade_Inventory, 730, Blades_of_Agony_Inventory);
      CreateItemTwoReq(Filling_Rifle, Crystall_Ball_Inventory, Argent_Spear_Inventory, 700, Filling_Rifle_Inventory);
      CreateItemTwoReq(Thunderfury, Great_Sword, Veterans_Blade_Inventory, 850, Thunderfury_Inventory);
      CreateItemTwoReq(Executioner_Clearver, Claymore, Dwarven_Axe_Inventory, 700, Executioner_Clearver_Inventory);
      CreateItemTwoReq(Obsidian_Spear, Mace, Argent_Spear_Inventory, 1075, Obsidian_Spear_Inventory);
      CreateItemTwoReq(Venomstrike, Falchion, Skull_Blade_Inventory, 1200, Venomstrike_Inventory);
      CreateItemTwoReq(Bronze_Sword, Great_Sword, Silver_Blade_Inventory, 675, Bronze_Sword_Inventory);
      CreateItemThreeReq(Sycophant, Hammer, Cursed_Bones, Skull_Blade_Inventory, 700, Sycophant_Inventory);
      CreateItemTwoReq(Duel_Blade, Claymore, Veterans_Blade_Inventory, 700, Duel_Blade_Inventory);
      //*Уникальная броня
      CreateItemTwoReq(Breast_Plate_of_the_Lightbringer, Chest_Plate, Runed_Bracers_Inventory, 1200, Breast_Plate_of_the_Lightbringer_Inventory);
      CreateItemTwoReq(Bronze_Greaves, Bronze_Shield, Plated_Boots_Inventory, 1035, Bronze_Greaves_Inventory);
      CreateItemTwoReq(Grim_Ward, Cursed_Bones, Swift_Shield_Inventory, 730, Grim_Ward_Inventory);
      CreateItemThreeReq(Steel_Shield, Battle_Helm, Periart_of_Vitality, Great_Shield_Inventory, 850, Steel_Shield_Inventory);
      CreateItemThreeReq(Dragonscale_Sheath, Spiked_Helm, Ring_of_Protection, Runed_Bracers_Inventory, 1030, Dragonscale_Sheath_Inventory);
      CreateItemTwoReq(Soul_Slippers, Frozen_Shard_Inventory, Plated_Boots_Inventory, 620, Soul_Slippers_Inventory);
      CreateItemTwoReq(Bastion_of_Purity, Bronze_Shield, Runed_Bracers_Inventory, 900, Bastion_of_Purity_Inventory);
      CreateItemThreeReq(Ring_of_Protection_RDD, Circlet_of_Nobility, Medallion_of_Curage, Great_Shield_Inventory, 925, Ring_of_Protection_RDD_Inventory);
      CreateItemThreeReq(Stonepath_Chestguard, Battle_Helm, Chest_Plate, Ring_of_Titus_Inventory, 650, Stonepath_Chestguard_Inventory);
      CreateItemTwoReq(Essence_of_Aszune, Ring_of_Titus_Inventory, Khadgar_Gem_Inventory, 730, Essence_of_Aszune_Inventory);
      CreateItemThreeReq(Glacial_Shield, Ring_of_Protection, Bronze_Shield, Frozen_Shard_Inventory, 730, Glacial_Shield_Inventory);
      //*Уникальные аксессуары
      CreateItemTwoReq(Arcane_Wonder, Helm_Of_Energy_Inventory, Khadgar_Gem_Inventory, 600, Arcane_Wonder_Inventory);
      CreateItemTwoReq(Battlehirst_Helm, Spiked_Helm, Gauntlets_of_Power_Inventory, 730, Battlehirst_Helm_Inventory);
      CreateItemThreeReq(Aegis_Gloves, Gauntlets_of_Ogre, Star_Wand, Gauntlets_of_Power_Inventory, 730, Aegis_Gloves_Inventory);
      CreateItemThreeReq(Wisdom_Carver, Falchion, Robe_of_the_Magi, Shaman_Claws_Inventory, 975, Wisdom_Carver_Inventory);
      CreateItemThreeReq(Starlights, Robe_of_the_Magi, Belt_of_Giants, Slippers_of_Agillity_Inventory, 600, Starlights_Inventory);
      CreateItemThreeReq(Journeys_End, Sobi_Mask, Claymore, Mana_Blade_Inventory, 730, Journeys_End_Inventory);
      //*Уникальные артефакты
      //*Интеллекта
      CreateItemThreeReq(Wind_Stave, Mage_Stave, Sobi_Mask, Mantle_of_Intelligence_Inventory, 730, Wind_Stave_Inventory);
      CreateItemThreeReq(Death_Edge, Mage_Stave, Enchanted_Skull, Rod_of_Necromancy_Inventory, 730, Death_Edge_Inventory);
      CreateItemThreeReq(Radiant_Savior, Robe_of_the_Magi, Bronze_Shield, Mantle_of_Intelligence_Inventory, 1025, Radiant_Savior_Inventory);
      CreateItemThreeReq(Lightning_Stave, Pedant_of_Mana, Star_Wand, Mana_Blade_Inventory, 730, Lightning_Stave_Inventory);
      CreateItemTwoReq(Talisman_of_the_Wild, Medallion_of_Curage, Rod_of_Necromancy_Inventory, 730, Talisman_of_the_Wild_Inventory);
      CreateItemThreeReq(Wand_of_the_Wayward, Mage_Stave, Boots_of_Speed, Crystall_Ball_Inventory, 730, Wand_of_the_Wayward_Inventory);
      CreateItemTwoReq(Urn, Medallion_of_Curage, Rod_of_Necromancy_Inventory, 730, Urn_Inventory);
      //*Ловкости
      CreateItemThreeReq(Amani_Throw_Axe, Claws_of_Attack, Scimitar, Repeater_Crossbow_Inventory, 1250, Amani_Throw_Axe_Inventory);
      CreateItemThreeReq(Soul_Ring, Ring_of_Regeneration, Shaman_Claws_Inventory, Bow_of_Quelthalas, 730, Soul_Ring_Inventory);
      CreateItemThreeReq(Flute_Accurance, Gauntlets_of_Attack_Speed, Cloak_of_Evasion, Repeater_Crossbow_Inventory, 1275, Flute_Accurance_Inventory);
      CreateItemThreeReq(Bloodmoon_Plate, Cloak_of_Evasion, Chest_Plate, Assasins_Blade_Inventory, 700, Bloodmoon_Plate_Inventory);
      CreateItemThreeReq(Bow_Windrunner, Bow_of_Quelthalas, Bow_of_Quelthalas, Slippers_of_Agillity_Inventory, 625, Bow_Windrunner_Inventory);
      CreateItemThreeReq(Wolf_Hunters_Guise, Periart_of_Vitality, Bow_of_Quelthalas, Swift_Shield_Inventory, 650, Wolf_Hunters_Guise_Inventory);
      //*Силы
      CreateItemTwoReq(Royal_Hammer, Hammer, Ogre_Mallet_Inventory, 800, Royal_Hammer_Inventory_Melee);
      CreateItemTwoReq(Royal_Hammer, Hammer, Ogre_Mallet_Inventory, 800, Royal_Hammer_Inventory_Range);
      SaveInteger(ItemDataHashtable, Royal_Hammer, 8, Royal_Hammer_Inventory_Melee);
      CreateItemThreeReq(Sunscale_Helm, Battle_Helm, Belt_of_Giants, Runed_Gauntlets_Inventory, 1030, Sunscale_Helm_Inventory);
      CreateItemTwoReq(Warsong_Drumes, War_Axe, Ogre_Mallet_Inventory, 1250, Warsong_Drumes_Inventory);
      CreateItemThreeReq(Ogreskull, Belt_of_Giants, Ring_of_Regeneration, Helm_Of_Energy_Inventory, 850, Ogreskull_Inventory);
      CreateItemTwoReq(Blackrock_Champions_Axe, War_Axe, Dwarven_Axe_Inventory, 900, Blackrock_Champions_Axe_Inventory);
      CreateItemThreeReq(Bulwark_Demonbone, Chest_Plate, War_Axe, Runed_Gauntlets_Inventory, 825, Bulwark_Demonbone_Inventory);
      TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_PICKUP_ITEM);
      TriggerAddAction(t, function onItemBuy);
      t = CreateTrigger();
      TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_PICKUP_ITEM);
      TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_DROP_ITEM);
      TriggerAddAction(t, function Stonepath_Armor);
      t = CreateTrigger();
      TriggerRegisterTimerEvent(t, 0.1, true);
      TriggerAddAction(t, function Stonepath_Update);
    }
  }
//! endzinc