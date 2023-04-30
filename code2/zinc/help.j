//! zinc
  library libHelp requires CothUtilities, PlayerLeaves {

    boolean IsPlayerWroteHelp[11];
    integer TrainedHeroId[11];
    quest SelectHero[11];
    questitem SelectHeroItem[11];

    public function WaitWhileHeroBuyItem (unit Hero, integer ItemId)  -> nothing {

      while (true) {
        if (UnitHasItemOfTypeBJ(Hero, ItemId)) return;
        //Задержка перед проверкой
        TriggerSleepAction(0.01);
      }

    }

    public function WaitWhenPlayerGetEnoughItemPoints (player whichPlayer, integer amountofItemPoints)  -> nothing {
      while (GetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_GOLD) < amountofItemPoints) {
        //Задержка перед проверкой
        TriggerSleepAction(0.01);
      }
    }

    function HelpMessages ()  -> nothing {
      integer TriggerPlayerId = GetPlayerId(GetTriggerPlayer());
      //Человек уже написал хелп
      if (IsPlayerWroteHelp[TriggerPlayerId]) {
        DisplayTimedTextToPlayerSimple(GetTriggerPlayer(), 20, "Если вы забыли текущее задание - нажмите |cfffed312F9|r.");
        return;
      }
      //Человек ещё не писал хелп
      IsPlayerWroteHelp[TriggerPlayerId] = true;
      ClearTextMessagesForPlayer(GetTriggerPlayer());
      if (GetTriggerPlayer() == Player(0)) 
      {
        DisplayTimedTextToPlayerSimple(GetTriggerPlayer(), 20, "Вам рекомендуется герой Курдран. Он аннигилирует толпы юнитов, и сам является ещё тем толстяком.");
        DisplayTimedTextToPlayerSimple(GetTriggerPlayer(), 15, "Дальнейшие указания ждите после того, как вы выберите героя.");
        SelectHero[TriggerPlayerId] = CreateQuest();
        SelectHeroItem[TriggerPlayerId] = QuestCreateItem(SelectHero[TriggerPlayerId]);
        QuestSetTitle(SelectHero[TriggerPlayerId], "Выбор Героя");
        QuestItemSetDescription(SelectHeroItem[TriggerPlayerId], "Первое дело");
        QuestSetDescription(SelectHero[TriggerPlayerId], "Для вас рекомендуется герой Курдран.");
        QuestSetCompleted(SelectHero[TriggerPlayerId], false);
        QuestSetIconPath(SelectHero[TriggerPlayerId], "ReplaceableTextures\\CommandButtons\\BTNKurdran.BLP");
        if (GetLocalPlayer() != GetTriggerPlayer()) QuestSetEnabled(SelectHero[TriggerPlayerId], false);
        else QuestSetEnabled(SelectHero[TriggerPlayerId], true);
      }
      else if (GetTriggerPlayer() == Player(1))
      {
        DisplayTimedTextToPlayerSimple(GetTriggerPlayer(), 20, "Вам рекомендуется герой Кадгар. Он аннигилирует толпы юнитов, но и героев может побесить.");
        DisplayTimedTextToPlayerSimple(GetTriggerPlayer(), 15, "Дальнейшие указания ждите после того, как вы выберите героя.");
        SelectHero[TriggerPlayerId] = CreateQuest();
        SelectHeroItem[TriggerPlayerId] = QuestCreateItem(SelectHero[TriggerPlayerId]);
        QuestSetTitle(SelectHero[TriggerPlayerId], "Выбор Героя");
        QuestItemSetDescription(SelectHeroItem[TriggerPlayerId], "Первое дело");
        QuestSetDescription(SelectHero[TriggerPlayerId], "Для вас рекомендуется герой Кадгар.");
        QuestSetCompleted(SelectHero[TriggerPlayerId], false);
        QuestSetIconPath(SelectHero[TriggerPlayerId], "ReplaceableTextures\\CommandButtons\\BTNBanditMage.blp");
        if (GetLocalPlayer() != GetTriggerPlayer()) QuestSetEnabled(SelectHero[TriggerPlayerId], false);
        else QuestSetEnabled(SelectHero[TriggerPlayerId], true);
      }
      else if (GetTriggerPlayer() == Player(2))
      {
        
      } 
      else if (GetTriggerPlayer() == Player(3))
      {
        
      } 
      else if (GetTriggerPlayer() == Player(4))
      {
      } 
      else if (GetTriggerPlayer() == Player(5))
      {
        DisplayTimedTextToPlayerSimple(GetTriggerPlayer(), 20, "Вам рекомендуется герой Бранн. Он неплохо убивает войска, а героев вовсе режет на фарш.");
        DisplayTimedTextToPlayerSimple(GetTriggerPlayer(), 15, "Дальнейшие указания ждите после того, как вы выберите героя.");
        SelectHero[TriggerPlayerId] = CreateQuest();
        SelectHeroItem[TriggerPlayerId] = QuestCreateItem(SelectHero[TriggerPlayerId]);
        QuestSetTitle(SelectHero[TriggerPlayerId], "Выбор Героя");
        QuestItemSetDescription(SelectHeroItem[TriggerPlayerId], "Первое дело");
        QuestSetDescription(SelectHero[TriggerPlayerId], "Для вас рекомендуется герой Бранн.");
        QuestSetCompleted(SelectHero[TriggerPlayerId], false);
        QuestSetIconPath(SelectHero[TriggerPlayerId], "ReplaceableTextures\\CommandButtons\\BTNBrann.BLP");
        if (GetLocalPlayer() != GetTriggerPlayer()) QuestSetEnabled(SelectHero[TriggerPlayerId], false);
        else QuestSetEnabled(SelectHero[TriggerPlayerId], true);
      } 
      else if (GetTriggerPlayer() == Player(6)) 
      {
      
      } 
      else if (GetTriggerPlayer() == Player(7)) 
      {
        DisplayTimedTextToPlayerSimple(GetTriggerPlayer(), 20, "Вам рекомендуется герой Аругал. Он хорошо уничтожает толпы войск, а героев заставляет страдать.");
        DisplayTimedTextToPlayerSimple(GetTriggerPlayer(), 15, "Дальнейшие указания ждите после того, как вы выберите героя.");
        SelectHero[TriggerPlayerId] = CreateQuest();
        SelectHeroItem[TriggerPlayerId] = QuestCreateItem(SelectHero[TriggerPlayerId]);
        QuestSetTitle(SelectHero[TriggerPlayerId], "Выбор Героя");
        QuestItemSetDescription(SelectHeroItem[TriggerPlayerId], "Первое дело");
        QuestSetDescription(SelectHero[TriggerPlayerId], "Для вас рекомендуется герой Аругал.");
        QuestSetCompleted(SelectHero[TriggerPlayerId], false);
        QuestSetIconPath(SelectHero[TriggerPlayerId], "ReplaceableTextures\\CommandButtons\\BTNDarthFalric.blp");
        if (GetLocalPlayer() != GetTriggerPlayer()) QuestSetEnabled(SelectHero[TriggerPlayerId], false);
        else QuestSetEnabled(SelectHero[TriggerPlayerId], true);
      } 
      else if (GetTriggerPlayer() == Player(8)) 
      {
        
      } 
      else if (GetTriggerPlayer() == Player(9) || GetTriggerPlayer() == Player(10) || GetTriggerPlayer() == Player(11)) 
      {
        
      } 

    }

    function Help ()  -> nothing {
      player TriggerPlayer = GetTriggerPlayer();
      integer TriggerPlayerId = GetPlayerId(TriggerPlayer);
      unit TrainedHero;
      quest PlayerHelpQuest;
      questitem PlayerHelpQuestItem;
      if ( !IsUnitType(GetTrainedUnit(), UNIT_TYPE_HERO) || !IsPlayerWroteHelp[TriggerPlayerId]) return;

      DestroyQuest(SelectHero[TriggerPlayerId]);

      TrainedHeroId[TriggerPlayerId] = GetTrainedUnitType();
      if ( TrainedHeroId[TriggerPlayerId] == Curdran )
      {
        TrainedHero = CurdranUnit;
        ClearTextMessagesForPlayer(TriggerPlayer);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Первым делом выйдите на локацию \"Мосты\". Её месторасположение у вас отображается на миникарте");
        PingMinimapLocForPlayerEx(GetTriggerPlayer(), Bridges, 30, 19, 78, 111, true);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "|cd5db5212ВАЖНО:|r Ворота открываются РЫЧАГОМ, он стоит рядом с воротами, обычно на пригорке.");
        SeparateText(TriggerPlayer, 20);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "Прокачивайте 1 и 2 спобности, они ваши основные.");
        PolledWait(18);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "|cff1518d4Информация:|r У вас есть Книга Заклинаний среди способностей героя. Пользуйтесь телепортацией в ней, что бы помогать тем союзникам, которых атакуют.");
        SeparateText(TriggerPlayer, 20);
        PolledWait(8);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "Ваша первая задача: накопить 1600 |cff99b4d1Очков Предметов.|r");
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "|cff1518d4Информация:|r Вы можете посмотреть текущую задачу, нажав |cfffed312F9|r.");
        SeparateText(TriggerPlayer, 20);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "|cff1518d4Информация:|r |cff99b4d1Очки Предметов|r выдаются за убийства врагов, а так же просто так со временем");
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
        QuestSetTitle(PlayerHelpQuest, "Первая задача");
        QuestItemSetDescription(PlayerHelpQuestItem, "Первые очки предметов");
        QuestSetDescription(PlayerHelpQuest, "Ваша первая задача: накопить 1600 |cff99b4d1Очков Предметов.|r |n|n|cff99b4d1Очки Предметов|r выдаются за убийства врагов, а так же просто со временем");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNRune.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);
        WaitWhenPlayerGetEnoughItemPoints(TriggerPlayer, 1600);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "Отлично! Вы смогли накопить 1600 |cff99b4d1Очков Предметов.|r");
        SeparateText(TriggerPlayer, 15);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Новая цель: Купите |cffffcc00\"Шлем Энергии\".|r Он находится в магазине |cffffcc00F - Редкая Броня,|r на центральной строке, 3-й по счету предмет.");
        SeparateText(TriggerPlayer, 30);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Магазины находятся в левом верхнем углу карты. Их месторасположение у вас отображается на мини-карте.");
        PingMinimapLocForPlayerEx(TriggerPlayer, Shop, 20, 26, 192, 198, true);
        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);

        QuestSetTitle(PlayerHelpQuest, "Первый предмет");
        QuestItemSetDescription(PlayerHelpQuestItem, "Ваш первый предмет");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cffffcc00\"Шлем Энергии\". Он находится в магазине |cffffcc00F - Редкая Броня,|r на центральной строке, 3-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNSpell_Magic_MageArmor.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);
        PolledWait(5);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "|cff1518d4Информация:|r Если вы забыли текущее задание - вы всегда сможете его найти во вкладке \"Задания\", хоткей: F9. ");
        if (!UnitHasItemOfTypeBJ(TrainedHero, Helm_Of_Energy_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Helm_Of_Energy_Inventory);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "А вы быстро учитесь! Для вас новое задание: накопить 1350 |cff99b4d1Очков Предметов.|r");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
        QuestSetTitle(PlayerHelpQuest, "Больше предметов");
        QuestItemSetDescription(PlayerHelpQuestItem, "Больше очков предметов");
        QuestSetDescription(PlayerHelpQuest, "Ваша третья задача: накопить 1350 |cff99b4d1Очков Предметов.|r |n|n|cff99b4d1Очки Предметов|r выдаются за убийства врагов, а так же просто со временем");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNRune.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        WaitWhenPlayerGetEnoughItemPoints(TriggerPlayer, 1350);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Новые очки предметов - новый предмет: Купите |cffffcc00\"Самоцвет Кадгара\".|r Он находится в магазине |cffffcc00G - Редкие Аксессуары,|r на верхней строке, 3-й по счету предмет.");
        SeparateText(TriggerPlayer, 30);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "|cff1518d4Информация:|r Если вы забудете задачу или где магазины - всегда сможете посмотреть в F9.");
        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);

        QuestSetTitle(PlayerHelpQuest, "Второй предмет");
        QuestItemSetDescription(PlayerHelpQuestItem, "Ещё один предмет");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cffffcc00\"Самоцвет Кадгара\". Он находится в магазине |cffffcc00G - Редкие Аксессуары,|r на верхней строке, 3-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNPeriapt1.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Khadgar_Gem_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Khadgar_Gem_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "Просто замечательно! Думаю, тогда вы и справитесь с тем, что бы накопить 600 |cff99b4d1Очков Предметов.|r");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
        QuestSetTitle(PlayerHelpQuest, "Ещё очков!");
        QuestItemSetDescription(PlayerHelpQuestItem, "Нужно большое очков предметов");
        QuestSetDescription(PlayerHelpQuest, "Ваша пятая задача: накопить 600 |cff99b4d1Очков Предметов.|r |n|n|cff99b4d1Очки Предметов|r выдаются за убийства врагов, а так же просто со временем");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNRune.blp");

        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        WaitWhenPlayerGetEnoughItemPoints(TriggerPlayer, 600);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Круто! Время для крутых предметов: Купите |cff8b00ff\"Аркан Вондер\".|r Он находится в магазине |cff8b00ffJ - Уникальные Аксессуары,|r на верхней строке, 1-й по счету предмет.");
        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);

        QuestSetTitle(PlayerHelpQuest, "Крутые предметы");
        QuestItemSetDescription(PlayerHelpQuestItem, "По-настоящему уникальный!");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Аркан Вондер\". Он находится в магазине |cff8b00ffJ - Уникальные Аксессуары,|r на верхней строке, 1-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNHelmOfValor.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Arcane_Wonder_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Arcane_Wonder_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Прекрасно! Теперь вы знаете, как собирать предметы. Я верю, ты сможешь собрать: |cff8b00ff\"Душу Азуны\".|r в магазине |cff8b00ffI|r.");
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Ты можешь его собрать по частям, как ты это сделал с Аркан Вондером, либо купить сразу весь, в 1 клик, как только тебе станет хватать |cff99b4d1Очков Предметов.|r");
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Постарайся сам купить этот предмет, вдруг что всегда можешь вспомнить где его взять, нажав |cfffed312F9|r.");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
  
        QuestSetTitle(PlayerHelpQuest, "Ещё круче");
        QuestItemSetDescription(PlayerHelpQuestItem, "Двойная Уникальность!");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Душу Азуны\". Он находится в магазине |cff8b00ffI - Уникальная Броня,|r на нижней строке, 2-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNHeartOfAszune.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Essence_of_Aszune_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Essence_of_Aszune_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Отлично! А теперь собери: |cff8b00ff\"Непробиваемый Нагрудник\".|r в магазине |cff8b00ffI|r.");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
    
        QuestSetTitle(PlayerHelpQuest, "Непробиваем");
        QuestItemSetDescription(PlayerHelpQuestItem, "Настоящая защита!");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Непробиваемый Нагрудник\". Он находится в магазине |cff8b00ffI - Уникальная Броня,|r на нижней строке, 1-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNINV_Chest_Plate09.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Stonepath_Chestguard_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Stonepath_Chestguard_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Отлично! А теперь собери: |cff8b00ff\"Бульварк Демоноборца\".|r в магазине |cff8b00ffM|r.");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
    
        QuestSetTitle(PlayerHelpQuest, "Защищен");
        QuestItemSetDescription(PlayerHelpQuestItem, "Ещё прочнее");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Бульварк Демоноборца\". Он находится в магазине |cff8b00ffM - Уникальные Артефакты Силы,|r на нижней строке, 2-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNINV_Chest_Chain_15.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Bulwark_Demonbone_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Bulwark_Demonbone_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Отлично! А теперь собери: |cff8b00ff\"Нагрудник Светоносца\".|r в магазине |cff8b00ffI|r.");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
    
        QuestSetTitle(PlayerHelpQuest, "Защищеннее");
        QuestItemSetDescription(PlayerHelpQuestItem, "Максимальная защищённость");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Нагрудник Светоносца\". Он находится в магазине |cff8b00ffI - Уникальная Броня,|r на верхней строке, 1-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNSpell_Chest_Plate.blp");

        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Thoras )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Danath )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Galen )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Anduin )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Khadgar )
      {
        TrainedHero = KhadgarUnit;
        ClearTextMessagesForPlayer(TriggerPlayer);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "Первым делом раздайте всем вашим союзникам контроль в F11. Приготовтесь, вас скоро начнут атаковать!");
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 25, "|cd5db5212ВАЖНО:|r Ворота открываются РЫЧАГОМ, он стоит рядом с воротами, обычно на пригорке.");
        SeparateText(TriggerPlayer, 25);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Прокачивайте 1 и 2 спобности, они ваши основные.");
        PolledWait(10);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "|cff1518d4Информация:|r Вы можете сделать улучшения в \"Лесопилке\". Её месторасположение сейчас у вас указано на мини-карте.");
        PingMinimapLocForPlayerEx(TriggerPlayer, Blue_Lumbermill, 25, 255, 97, 80, true);
        SeparateText(TriggerPlayer, 20);
        PolledWait(8);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "Ваша первая задача: накопить 1600 |cff99b4d1Очков Предметов.|r");
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "|cff1518d4Информация:|r Вы можете посмотреть текущую задачу, нажав |cfffed312F9|r.");
        SeparateText(TriggerPlayer, 20);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "|cff1518d4Информация:|r |cff99b4d1Очки Предметов|r выдаются за убийства врагов, а так же просто так со временем");
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
        QuestSetTitle(PlayerHelpQuest, "Первая задача");
        QuestItemSetDescription(PlayerHelpQuestItem, "Первые очки предметов");
        QuestSetDescription(PlayerHelpQuest, "Ваша первая задача: накопить 1600 |cff99b4d1Очков Предметов.|r |n|n|cff99b4d1Очки Предметов|r выдаются за убийства врагов, а так же просто со временем");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNRune.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);
        
        WaitWhenPlayerGetEnoughItemPoints(TriggerPlayer, 1600);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "Отлично! Вы смогли накопить 1600 |cff99b4d1Очков Предметов.|r");
        SeparateText(TriggerPlayer, 15);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Новая цель: Купите |cffffcc00\"Шлем Энергии\".|r Он находится в магазине |cffffcc00F - Редкая Броня,|r на центральной строке, 3-й по счету предмет.");
        SeparateText(TriggerPlayer, 30);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Магазины находятся в левом верхнем углу карты. Их месторасположение у вас отображается на мини-карте.");
        PingMinimapLocForPlayerEx(TriggerPlayer, Shop, 20, 26, 192, 198, true);
        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);

        QuestSetTitle(PlayerHelpQuest, "Первый предмет");
        QuestItemSetDescription(PlayerHelpQuestItem, "Ваш первый предмет");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cffffcc00\"Шлем Энергии\". Он находится в магазине |cffffcc00F - Редкая Броня,|r на центральной строке, 3-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNSpell_Magic_MageArmor.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);
        PolledWait(5);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "|cff1518d4Информация:|r Если вы забыли текущее задание - вы всегда сможете его найти во вкладке \"Задания\", хоткей: F9. ");
        if (!UnitHasItemOfTypeBJ(TrainedHero, Helm_Of_Energy_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Helm_Of_Energy_Inventory);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "А вы быстро учитесь! Для вас новое задание: накопить 1350 |cff99b4d1Очков Предметов.|r");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
        QuestSetTitle(PlayerHelpQuest, "Больше предметов");
        QuestItemSetDescription(PlayerHelpQuestItem, "Больше очков предметов");
        QuestSetDescription(PlayerHelpQuest, "Ваша третья задача: накопить 1350 |cff99b4d1Очков Предметов.|r |n|n|cff99b4d1Очки Предметов|r выдаются за убийства врагов, а так же просто со временем");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNRune.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        WaitWhenPlayerGetEnoughItemPoints(TriggerPlayer, 1350);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Новые очки предметов - новый предмет: Купите |cffffcc00\"Самоцвет Кадгара\".|r Он находится в магазине |cffffcc00G - Редкие Аксессуары,|r на верхней строке, 3-й по счету предмет.");
        SeparateText(TriggerPlayer, 30);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "|cff1518d4Информация:|r Если вы забудете задачу или где магазины - всегда сможете посмотреть в F9.");
        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);

        QuestSetTitle(PlayerHelpQuest, "Второй предмет");
        QuestItemSetDescription(PlayerHelpQuestItem, "Ещё один предмет");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cffffcc00\"Самоцвет Кадгара\". Он находится в магазине |cffffcc00G - Редкие Аксессуары,|r на верхней строке, 3-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNPeriapt1.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Khadgar_Gem_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Khadgar_Gem_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "Просто замечательно! Думаю, тогда вы и справитесь с тем, что бы накопить 600 |cff99b4d1Очков Предметов.|r");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
        QuestSetTitle(PlayerHelpQuest, "Ещё очков!");
        QuestItemSetDescription(PlayerHelpQuestItem, "Нужно большое очков предметов");
        QuestSetDescription(PlayerHelpQuest, "Ваша пятая задача: накопить 600 |cff99b4d1Очков Предметов.|r |n|n|cff99b4d1Очки Предметов|r выдаются за убийства врагов, а так же просто со временем");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNRune.blp");

        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        WaitWhenPlayerGetEnoughItemPoints(TriggerPlayer, 600);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Круто! Время для крутых предметов: Купите |cff8b00ff\"Аркан Вондер\".|r Он находится в магазине |cff8b00ffJ - Уникальные Аксессуары,|r на верхней строке, 1-й по счету предмет.");
        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);

        QuestSetTitle(PlayerHelpQuest, "Крутые предметы");
        QuestItemSetDescription(PlayerHelpQuestItem, "По-настоящему уникальный!");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Аркан Вондер\". Он находится в магазине |cff8b00ffJ - Уникальные Аксессуары,|r на верхней строке, 1-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNHelmOfValor.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Arcane_Wonder_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Arcane_Wonder_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Прекрасно! Теперь вы знаете, как собирать предметы. Я верю, ты сможешь собрать: |cff8b00ff\"Посох Молний\".|r в магазине |cff8b00ffK|r.");
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Ты можешь его собрать по частям, как ты это сделал с Аркан Вондером, либо купить сразу весь, в 1 клик, как только тебе станет хватать |cff99b4d1Очков Предметов.|r");
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Постарайся сам купить этот предмет, вдруг что всегда можешь вспомнить где его взять, нажав |cfffed312F9|r.");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
  
        QuestSetTitle(PlayerHelpQuest, "Ещё круче");
        QuestItemSetDescription(PlayerHelpQuestItem, "Двойная Уникальность!");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Посох Молний\". Он находится в магазине |cff8b00ffK - Уникальные артефакты Интеллекта,|r на центральной строке, 1-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNINV_Wand_08.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Lightning_Stave_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Lightning_Stave_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Отлично! А теперь собери: |cff8b00ff\"Посох Ветра\".|r в магазине |cff8b00ffK|r.");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
    
        QuestSetTitle(PlayerHelpQuest, "Полёт");
        QuestItemSetDescription(PlayerHelpQuestItem, "Покоряя небеса");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Посох Ветра\". Он находится в магазине |cff8b00ffK - Уникальные артефакты Интеллекта,|r на верхней строке, 1-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNScepterOfMastery.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Wind_Stave_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Wind_Stave_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Отлично! А теперь собери: |cff8b00ff\"Путеводный Жезл\".|r во всё том же магазине |cff8b00ffK|r.");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
        
        QuestSetTitle(PlayerHelpQuest, "Быстро");
        QuestItemSetDescription(PlayerHelpQuestItem, "Need For Speed");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Путеводный Жезл\". Он находится в магазине |cff8b00ffK - Уникальные Артефакты Интеллекта,|r на нижней строке, 1-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNStaffOfPreservation.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);  
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Llane )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Mara )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Daelin )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Duke )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Derek )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Mishan )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Antonidas )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Rhonin )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Kael )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Aegwynn )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Brann )
      {
        TrainedHero = BrannUnit;
        ClearTextMessagesForPlayer(TriggerPlayer);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "Вы - одна из самых защищенных баз. Войска, что находятся у подножья горы поднимите на гору, это важно! Ни в коем случае с неё не спускайтесь, ваша сила - в узких проходах.");
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 25, "|cd5db5212ВАЖНО:|r Ворота открываются РЫЧАГОМ, он стоит рядом с воротами, обычно на пригорке.");
        SeparateText(TriggerPlayer, 25);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Прокачивайте 1 и 2 спобности, они ваши основные.");
        PolledWait(10);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "|cff1518d4Информация:|r У вашего героя есть \"Книга Заклинаний\". Используйте в ней Телепортацию, что бы помогать союзникам.");
        SeparateText(TriggerPlayer, 20);
        PolledWait(8);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "Ваша первая задача: накопить 1650 |cff99b4d1Очков Предметов.|r.");
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "|cff1518d4Информация:|r Вы можете посмотреть текущую задачу, нажав |cfffed312F9|r.");
        SeparateText(TriggerPlayer, 20);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "|cff1518d4Информация:|r |cff99b4d1Очки Предметов|r выдаются за убийства врагов, а так же просто так со временем");
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);

        QuestSetTitle(PlayerHelpQuest, "Первая задача");
        QuestItemSetDescription(PlayerHelpQuestItem, "Первые очки предметов");
        QuestSetDescription(PlayerHelpQuest, "Ваша первая задача: накопить 1650 |cff99b4d1Очков Предметов.|r |n|n|cff99b4d1Очки Предметов|r выдаются за убийства врагов, а так же просто со временем");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNRune.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);
        
        WaitWhenPlayerGetEnoughItemPoints(TriggerPlayer, 1650);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "Отлично! Вы смогли накопить 1650 |cff99b4d1Очков Предметов.|r");
        SeparateText(TriggerPlayer, 15);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Новая цель: Купите |cffffcc00\"Клинок Ветерана\".|r Он находится в магазине |cffffcc00E - Редкое Оружие,|r на центральной строке, 3-й по счету предмет.");
        SeparateText(TriggerPlayer, 30);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Магазины находятся в левом верхнем углу карты. Их месторасположение у вас отображается на мини-карте.");
        PingMinimapLocForPlayerEx(TriggerPlayer, Shop, 20, 26, 192, 198, true);
        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);

        QuestSetTitle(PlayerHelpQuest, "Первый предмет");
        QuestItemSetDescription(PlayerHelpQuestItem, "Ваш первый предмет");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cffffcc00\"Клинок Ветерана\". Он находится в магазине |cffffcc00E - Редкое Оружие,|r на центральной строке, 3-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNRustySword.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);
        PolledWait(5);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "|cff1518d4Информация:|r Если вы забыли текущее задание - вы всегда сможете его найти во вкладке \"Задания\", хоткей: F9. ");
        if (!UnitHasItemOfTypeBJ(TrainedHero, Veterans_Blade_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Veterans_Blade_Inventory);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "А вы быстро учитесь! Для вас новое задание: накопить 2400 |cff99b4d1Очков Предметов.|r");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
        QuestSetTitle(PlayerHelpQuest, "Больше предметов");
        QuestItemSetDescription(PlayerHelpQuestItem, "Больше очков предметов");
        QuestSetDescription(PlayerHelpQuest, "Ваша третья задача: накопить 2400 |cff99b4d1Очков Предметов.|r |n|n|cff99b4d1Очки Предметов|r выдаются за убийства врагов, а так же просто со временем");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNRune.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        WaitWhenPlayerGetEnoughItemPoints(TriggerPlayer, 2400);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Новые очки предметов - новый предмет: Купите |cff99b4d1\"Гигантский Меч\".|r Он находится в магазине |cff99b4d1A - Базовое Оружие,|r на нижней строке, 1-й по счету предмет.");
        SeparateText(TriggerPlayer, 30);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "|cff1518d4Информация:|r Если вы забудете задачу или где магазины - всегда сможете посмотреть в F9.");
        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);

        QuestSetTitle(PlayerHelpQuest, "Второй предмет");
        QuestItemSetDescription(PlayerHelpQuestItem, "Ещё один предмет");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff99b4d1\"Гигантский Меч\".|r Он находится в магазине |cff99b4d1A - Базовое Оружие,|r на нижней строке, 1-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNINV_Sword_23.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Great_Sword)) WaitWhileHeroBuyItem(TrainedHero, Great_Sword);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "Просто замечательно! Думаю, тогда вы и справитесь с тем, что бы накопить 850 |cff99b4d1Очков Предметов.|r");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
        QuestSetTitle(PlayerHelpQuest, "Ещё очков!");
        QuestItemSetDescription(PlayerHelpQuestItem, "Нужно большое очков предметов");
        QuestSetDescription(PlayerHelpQuest, "Ваша пятая задача: накопить 850 |cff99b4d1Очков Предметов.|r |n|n|cff99b4d1Очки Предметов|r выдаются за убийства врагов, а так же просто со временем");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNRune.blp");

        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        WaitWhenPlayerGetEnoughItemPoints(TriggerPlayer, 850);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Круто! Время для крутых предметов: Купите |cff8b00ff\"Тандерфьюри\".|r Он находится в магазине |cff8b00ffH - Уникальное Оружие,|r на центральной строке, 1-й по счету предмет.");
        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);

        QuestSetTitle(PlayerHelpQuest, "Крутые предметы");
        QuestItemSetDescription(PlayerHelpQuestItem, "По-настоящему уникальный!");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Тандерфьюри\".|r Он находится в магазине |cff8b00ffH - Уникальное Оружие,|r на центральной строке, 1-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNINV_Sword_19.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Thunderfury_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Thunderfury_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Прекрасно! Теперь вы знаете, как собирать предметы. Я верю, ты сможешь собрать: |cffffcc00\"Серебрянный Меч\"|r в магазине |cffffcc00E|r.");
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Ты можешь его собрать по частям, как ты это сделал с Аркан Вондером, либо купить сразу весь, в 1 клик, как только тебе станет хватать |cff99b4d1Очков Предметов.|r");
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Постарайся сам купить этот предмет, вдруг что всегда можешь вспомнить где его взять, нажав |cfffed312F9|r.");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
  
        QuestSetTitle(PlayerHelpQuest, "Ммм... Блестит");
        QuestItemSetDescription(PlayerHelpQuestItem, "Редкий, но меткий!");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cffffcc00\"Серебрянный Меч\"|r в магазине |cffffcc00E - Редкое Оружие,|r на нижней строке, 2-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNINV_Weapon_ShortBlade_05.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Silver_Blade_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Silver_Blade_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Отлично! А теперь собери: |cff8b00ff\"Топор Амани\".|r в магазине |cff8b00ffL|r.");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
    
        QuestSetTitle(PlayerHelpQuest, "Пронзая Броню");
        QuestItemSetDescription(PlayerHelpQuestItem, "Вроде топор, а так хорошо броню пробивает");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Топор Амани\". Он находится в магазине |cff8b00ffL - Уникальные артефакты Ловкости,|r на верхней строке, 1-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNINV_ThrowingAxe_04.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Amani_Throw_Axe_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Amani_Throw_Axe_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Отлично! А теперь собери: |cff8b00ff\"Флейту Меткости\".|r во всё том же магазине |cff8b00ffL|r.");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
        
        QuestSetTitle(PlayerHelpQuest, "Быстро");
        QuestItemSetDescription(PlayerHelpQuestItem, "Need For Speed");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Флейту Меткости\". Он находится в магазине |cff8b00ffL - Уникальные Артефакты Ловкости,|r на центральной строке, 1-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNAlleriaFlute.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);  
        
        if (!UnitHasItemOfTypeBJ(TrainedHero, Flute_Accurance_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Flute_Accurance_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Отлично! А теперь собери: |cff8b00ff\"Меч Рока\".|r в магазине |cff8b00ffH|r.");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
        
        QuestSetTitle(PlayerHelpQuest, "Меньше брони");
        QuestItemSetDescription(PlayerHelpQuestItem, "Чем меньше брони - тем лучше удары");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Меч Рока\". Он находится в магазине |cff8b00ffH - Уникальное Оружие,|r на верхней строке, 1-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNINV_Sword_26.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);  
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Magni )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Muradin )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Gelbin )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Anasterian )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Alleria )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == LorThermar )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Sylvanas )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Genn )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Arugal )
      {
        TrainedHero = ArugalUnit;
        ClearTextMessagesForPlayer(TriggerPlayer);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Первым делом выйдите на локацию \"Мосты\". Её месторасположение у вас отображается на миникарте");
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "Ваша задача - помогать союзникам, у вас одна из самых далёких баз.");
        PingMinimapLocForPlayerEx(GetTriggerPlayer(), Bridges, 30, 19, 78, 111, true);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "|cd5db5212ВАЖНО:|r Ворота открываются РЫЧАГОМ, он стоит рядом с воротами, обычно на пригорке.");
        SeparateText(TriggerPlayer, 20);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "Прокачивайте 1 и 2 спобности, они ваши основные.");
        PolledWait(18);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "|cff1518d4Информация:|r У вас есть Книга Заклинаний среди способностей героя. Пользуйтесь телепортацией в ней, что бы помогать тем союзникам, которых атакуют.");
        SeparateText(TriggerPlayer, 20);
        PolledWait(8);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "Ваша первая задача: накопить 1600 |cff99b4d1Очков Предметов.|r");
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "|cff1518d4Информация:|r Вы можете посмотреть текущую задачу, нажав |cfffed312F9|r.");
        SeparateText(TriggerPlayer, 20);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 20, "|cff1518d4Информация:|r |cff99b4d1Очки Предметов|r выдаются за убийства врагов, а так же просто так со временем");
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
        QuestSetTitle(PlayerHelpQuest, "Первая задача");
        QuestItemSetDescription(PlayerHelpQuestItem, "Первые очки предметов");
        QuestSetDescription(PlayerHelpQuest, "Ваша первая задача: накопить 1600 |cff99b4d1Очков Предметов.|r |n|n|cff99b4d1Очки Предметов|r выдаются за убийства врагов, а так же просто со временем");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNRune.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);
        WaitWhenPlayerGetEnoughItemPoints(TriggerPlayer, 1600);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "Отлично! Вы смогли накопить 1600 |cff99b4d1Очков Предметов.|r");
        SeparateText(TriggerPlayer, 15);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Новая цель: Купите |cffffcc00\"Шлем Энергии\".|r Он находится в магазине |cffffcc00F - Редкая Броня,|r на центральной строке, 3-й по счету предмет.");
        SeparateText(TriggerPlayer, 30);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Магазины находятся в левом верхнем углу карты. Их месторасположение у вас отображается на мини-карте.");
        PingMinimapLocForPlayerEx(TriggerPlayer, Shop, 20, 26, 192, 198, true);
        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);

        QuestSetTitle(PlayerHelpQuest, "Первый предмет");
        QuestItemSetDescription(PlayerHelpQuestItem, "Ваш первый предмет");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cffffcc00\"Шлем Энергии\". Он находится в магазине |cffffcc00F - Редкая Броня,|r на центральной строке, 3-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNSpell_Magic_MageArmor.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);
        PolledWait(5);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "|cff1518d4Информация:|r Если вы забыли текущее задание - вы всегда сможете его найти во вкладке \"Задания\", хоткей: F9. ");
        if (!UnitHasItemOfTypeBJ(TrainedHero, Helm_Of_Energy_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Helm_Of_Energy_Inventory);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "А вы быстро учитесь! Для вас новое задание: накопить 1350 |cff99b4d1Очков Предметов.|r");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
        QuestSetTitle(PlayerHelpQuest, "Больше предметов");
        QuestItemSetDescription(PlayerHelpQuestItem, "Больше очков предметов");
        QuestSetDescription(PlayerHelpQuest, "Ваша третья задача: накопить 1350 |cff99b4d1Очков Предметов.|r |n|n|cff99b4d1Очки Предметов|r выдаются за убийства врагов, а так же просто со временем");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNRune.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        WaitWhenPlayerGetEnoughItemPoints(TriggerPlayer, 1350);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Новые очки предметов - новый предмет: Купите |cffffcc00\"Самоцвет Кадгара\".|r Он находится в магазине |cffffcc00G - Редкие Аксессуары,|r на верхней строке, 3-й по счету предмет.");
        SeparateText(TriggerPlayer, 30);
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "|cff1518d4Информация:|r Если вы забудете задачу или где магазины - всегда сможете посмотреть в F9.");
        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);

        QuestSetTitle(PlayerHelpQuest, "Второй предмет");
        QuestItemSetDescription(PlayerHelpQuestItem, "Ещё один предмет");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cffffcc00\"Самоцвет Кадгара\". Он находится в магазине |cffffcc00G - Редкие Аксессуары,|r на верхней строке, 3-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNPeriapt1.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Khadgar_Gem_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Khadgar_Gem_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 15, "Просто замечательно! Думаю, тогда вы и справитесь с тем, что бы накопить 600 |cff99b4d1Очков Предметов.|r");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
        QuestSetTitle(PlayerHelpQuest, "Ещё очков!");
        QuestItemSetDescription(PlayerHelpQuestItem, "Нужно большое очков предметов");
        QuestSetDescription(PlayerHelpQuest, "Ваша пятая задача: накопить 600 |cff99b4d1Очков Предметов.|r |n|n|cff99b4d1Очки Предметов|r выдаются за убийства врагов, а так же просто со временем");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNRune.blp");

        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        WaitWhenPlayerGetEnoughItemPoints(TriggerPlayer, 600);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Круто! Время для крутых предметов: Купите |cff8b00ff\"Аркан Вондер\".|r Он находится в магазине |cff8b00ffJ - Уникальные Аксессуары,|r на верхней строке, 1-й по счету предмет.");
        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);

        QuestSetTitle(PlayerHelpQuest, "Крутые предметы");
        QuestItemSetDescription(PlayerHelpQuestItem, "По-настоящему уникальный!");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Аркан Вондер\". Он находится в магазине |cff8b00ffJ - Уникальные Аксессуары,|r на верхней строке, 1-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNHelmOfValor.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Arcane_Wonder_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Arcane_Wonder_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Прекрасно! Теперь вы знаете, как собирать предметы. Я верю, ты сможешь собрать: |cff8b00ff\"Посох Молний\".|r в магазине |cff8b00ffK|r.");
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Ты можешь его собрать по частям, как ты это сделал с Аркан Вондером, либо купить сразу весь, в 1 клик, как только тебе станет хватать |cff99b4d1Очков Предметов.|r");
        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Постарайся сам купить этот предмет, вдруг что всегда можешь вспомнить где его взять, нажав |cfffed312F9|r.");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
  
        QuestSetTitle(PlayerHelpQuest, "Ещё круче");
        QuestItemSetDescription(PlayerHelpQuestItem, "Двойная Уникальность!");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Посох Молний\". Он находится в магазине |cff8b00ffK - Уникальные артефакты Интеллекта,|r на центральной строке, 1-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNINV_Wand_08.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Lightning_Stave_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Lightning_Stave_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Отлично! А теперь собери: |cff8b00ff\"Жезл Смерти\".|r в магазине |cff8b00ffK|r.");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
    
        QuestSetTitle(PlayerHelpQuest, "Смерть");
        QuestItemSetDescription(PlayerHelpQuestItem, "Уничтожая магией");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Жезл Смерти\". Он находится в магазине |cff8b00ffK - Уникальные артефакты Интеллекта,|r на нижней строке, 2-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNEntrapmentWard.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Death_Edge_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Death_Edge_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Отлично! А теперь собери: |cff8b00ff\"Посох Ветра\".|r в магазине |cff8b00ffK|r.");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
    
        QuestSetTitle(PlayerHelpQuest, "Полёт");
        QuestItemSetDescription(PlayerHelpQuestItem, "Время полетать");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Посох Ветра\". Он находится в магазине |cff8b00ffK - Уникальные артефакты Интеллекта,|r на верхней строке, 1-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNScepterOfMastery.blp");
        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);

        if (!UnitHasItemOfTypeBJ(TrainedHero, Wind_Stave_Inventory)) WaitWhileHeroBuyItem(TrainedHero, Wind_Stave_Inventory);

        DisplayTimedTextToPlayerSimple(TriggerPlayer, 30, "Отлично! А теперь собери: |cff8b00ff\"Путеводный Жезл\".|r в том же магазине |cff8b00ffK|r.");

        DestroyQuest(PlayerHelpQuest);
        PlayerHelpQuest = CreateQuest();
        PlayerHelpQuestItem = QuestCreateItem(PlayerHelpQuest);
    
        QuestSetTitle(PlayerHelpQuest, "Скорость");
        QuestItemSetDescription(PlayerHelpQuestItem, "Как Усейн Болт");
        QuestSetDescription(PlayerHelpQuest, "Ваша задача: купить |cff8b00ff\"Путеводный Жезл\". Он находится в магазине |cff8b00ffK - Уникальные артефакты Интеллекта,|r на нижней строке, 1-й по счету предмет. |nЧто бы указать месторасположение магазинов на миникарте, напишите в чат |cff134e6f-магазин|r");
        QuestSetCompleted(PlayerHelpQuest, false);
        QuestSetIconPath(PlayerHelpQuest, "ReplaceableTextures\\CommandButtons\\BTNStaffOfPreservation.blp");

        if (GetLocalPlayer() != TriggerPlayer) QuestSetEnabled(PlayerHelpQuest, false);
        else QuestSetEnabled(PlayerHelpQuest, true);
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Gavinrad )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Darius )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == VincenctGodfrey )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Uther )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Tirion )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == AlonSUS )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Tyralion )
      {
        
      }
      //* Орда
      else if ( TrainedHeroId[TriggerPlayerId] == Archimonde )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == KillJaeden )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Mannoroth )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Tichondrius )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Mediv )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Azgalor )
      {
        
      }
      //* Из Алтаря Силы
      else if ( TrainedHeroId[TriggerPlayerId] == Blackhand )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Orgrim )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Kargath )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Dentarg )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Rend )
      {
        
      }
      //* Алтарь Духа
      else if ( TrainedHeroId[TriggerPlayerId] == Guldan )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Nerzhul )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Teron )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == ChoGall )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Fenris )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Ratso )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Zuluhed )
      {
        
      }
      //* Алтарь Ловкости
      else if ( TrainedHeroId[TriggerPlayerId] == Killrog )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Grom )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == ZulJin )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Garona )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Maim )
      {
        
      }
      else if ( TrainedHeroId[TriggerPlayerId] == Griselda )
      {
        
      }
    }

    function IsCommandShop ()  -> boolean {
      return (toLowerCase(GetEventPlayerChatString()) == "магазин" || toLowerCase(GetEventPlayerChatString()) == "-магазин" || toLowerCase(GetEventPlayerChatString()) == "магазины");
    }

    function IsCommandBridges ()  -> boolean {
      return (toLowerCase(GetEventPlayerChatString()) == "-мост" || toLowerCase(GetEventPlayerChatString()) == "мосты" || toLowerCase(GetEventPlayerChatString()) == "мост");
    }

    function ShopPing ()  -> nothing {
      PingMinimapLocForPlayerEx(GetTriggerPlayer(), Shop, 20, 26, 192, 198, true);
      DisplayTimedTextToPlayerSimple(GetTriggerPlayer(), 10, "Магазины находятся в левом верхнем углу карты (они отображаются на миникарте)");
    }

    function BridgesPing ()  -> nothing {
      PingMinimapLocForPlayerEx(GetTriggerPlayer(), Bridges, 20, 19, 78, 111, true);
      DisplayTimedTextToPlayerSimple(GetTriggerPlayer(), 10, "Мосты находятся прямо перед базой " + PlayerColorPrefix[0] + "красного|r (они отображаются на миникарте)");
    }

    function onInit ()  -> nothing {
      trigger t = CreateTrigger();
      TriggerRegisterAnyPlayerChatEvent(t, "-help", true);
      TriggerAddAction(t, function HelpMessages);
      t = CreateTrigger();
      TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_TRAIN_FINISH);
      TriggerAddAction(t, function Help);
      //* Различные команды, напоминающие о позициях локаций
      t = CreateTrigger();
      TriggerRegisterAnyPlayerChatEvent(t, "", false);
      TriggerAddCondition(t, Condition(function IsCommandShop));
      TriggerAddAction(t, function ShopPing);
      t = CreateTrigger();
      TriggerRegisterAnyPlayerChatEvent(t, "", false);
      TriggerAddCondition(t, Condition(function IsCommandBridges));
      TriggerAddAction(t, function BridgesPing);
    }

  }
//! endzinc