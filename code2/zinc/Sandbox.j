//! zinc
  library Sandbox requires CothUtilities, PlayerLeaves {
    integer CountofLeavedPlayers = 0;
    string tempString[];
    dialog SelectHeroDialog = DialogCreate();
    button PlayerStromgardHeroButtons[4];
    button PlayerAzerothHeroButtons[4];
    button PlayerKulTirasHeroButtons[4];
    button PlayerDalaranHeroButtons[4];
    button PlayerLegionHeroButtons[6];
    button PlayerGnomeHeroButtons[4];
    button PlayerKaelThalasHeroButtons[4];
    button PlayerGilneasHeroButtons[4];
    button PlayerLordaeronHeroButtons[4];
    button IntelligenceHeroes[7];
    button AgillityHeroes[6];
    button StrengthHeroes[5];

    button NextFraction;
    button PrevFraction;

    integer DialogId = 0;

    hashtable SandboxHash = InitHashtable();

    //*Изменение гейроя
    struct EditHero {
      button ChangeOwner;
      button ChangeStats;
      button ChangeAGI;
      button ChangeSTR;
      button ChangeINT;
      button OPTYPEADD;
      button OPTYPESUB;
      button EditDefaultStats;
      button EditHP;
      button EditMP;
      button EditDamage;
      button EditArmor;
      button ChangeDamageType;
      button ChangeArmorType;
      button ChangeMS;

      string ChangingStatName;

      button ChangeOwnerHeroPlayer[12];

      dialog Dialog;
      button HideDialog;

      unit Target;
      player Caller;

      method changeOwner ()  -> nothing {
        DialogClear(this.Dialog);
        this.ChangeOwnerHeroPlayer[0] = DialogAddButtonSimple(this.Dialog, "На " + PlayerColorPrefix[0] + "красного|r");
        this.ChangeOwnerHeroPlayer[1] = DialogAddButtonSimple(this.Dialog, "На " + PlayerColorPrefix[1] + "синего|r");
        this.ChangeOwnerHeroPlayer[2] = DialogAddButtonSimple(this.Dialog, "На " + PlayerColorPrefix[2] + "бирюзового|r");
        this.ChangeOwnerHeroPlayer[3] = DialogAddButtonSimple(this.Dialog, "На " + PlayerColorPrefix[3] + "фиолетового|r");
        this.ChangeOwnerHeroPlayer[4] = DialogAddButtonSimple(this.Dialog, "На " + PlayerColorPrefix[4] + "желтого|r");
        this.ChangeOwnerHeroPlayer[5] = DialogAddButtonSimple(this.Dialog, "На " + PlayerColorPrefix[5] + "оранжевого|r");
        this.ChangeOwnerHeroPlayer[6] = DialogAddButtonSimple(this.Dialog, "На " + PlayerColorPrefix[6] + "зелёного|r");
        this.ChangeOwnerHeroPlayer[7] = DialogAddButtonSimple(this.Dialog, "На " + PlayerColorPrefix[7] + "розового|r");
        this.ChangeOwnerHeroPlayer[8] = DialogAddButtonSimple(this.Dialog, "На " + PlayerColorPrefix[8] + "серого|r");
        this.ChangeOwnerHeroPlayer[9] = DialogAddButtonSimple(this.Dialog, "На " + PlayerColorPrefix[9] + "голубого|r");
        this.ChangeOwnerHeroPlayer[10] = DialogAddButtonSimple(this.Dialog, "На " + PlayerColorPrefix[10] + "тёмно-зелёного|r");
        this.ChangeOwnerHeroPlayer[11] = DialogAddButtonSimple(this.Dialog, "На " + PlayerColorPrefix[11] + "коричневого|r");
      }

      method optype ()  -> nothing {
        DialogClear(this.Dialog);
        this.OPTYPEADD = DialogAddButtonSimple(this.Dialog, "Добавить " + this.ChangingStatName);
        this.OPTYPESUB = DialogAddButtonSimple(this.Dialog, "Отнять " + this.ChangingStatName);
      }

      method editHeroStats ()  -> nothing {
        DialogClear(this.Dialog);
        this.ChangeAGI = DialogAddButtonSimple(this.Dialog, "Изменить ловкость");
        this.ChangeSTR = DialogAddButtonSimple(this.Dialog, "Изменить силу");
        this.ChangeINT = DialogAddButtonSimple(this.Dialog, "Изменить интеллект");
      }

      method editStats ()  -> nothing {
        DialogClear(this.Dialog);
        this.EditHP = DialogAddButtonSimple(this.Dialog, "Изменить здоровье");
        this.EditMP = DialogAddButtonSimple(this.Dialog, "Изменить ману");
        this.EditDamage = DialogAddButtonSimple(this.Dialog, "Изменить урон");
        this.EditArmor = DialogAddButtonSimple(this.Dialog, "Изменить защиту");
        this.ChangeDamageType = DialogAddButtonSimple(this.Dialog, "Изменить тип урона");
        this.ChangeArmorType = DialogAddButtonSimple(this.Dialog, "Изменить тип защиты");
        this.ChangeMS = DialogAddButtonSimple(this.Dialog, "Изменить скорость передвижения");
        this.ChangeOwner = DialogAddButtonSimple(this.Dialog, "Изменить владельца");
      }

      static method create ()  -> thistype {
        EditHero Edit = EditHero.allocate();
        Edit.Dialog = DialogCreate();
        DialogSetMessage(Edit.Dialog, "Управление героем");
        Edit.ChangeStats = DialogAddButtonSimple(Edit.Dialog, "Изменение силы/инты/агилы");
        Edit.EditDefaultStats = DialogAddButtonSimple(Edit.Dialog, "Изменение характеристик");
        Edit.HideDialog = DialogAddButtonSimple(Edit.Dialog, "Назад");
        Edit.Caller = GetTriggerPlayer();
        Edit.Target = GetTriggerUnit();
        return Edit;
      }
    }


    public function InitSandbox ()  -> nothing {
      quest commandDescriptionHeading = CreateQuest();
      questitem commandDescriptionBody = QuestCreateItem(comamndDescriptionHeading);
      integer PlayerIndex;
      SetForceAllianceStateBJ(GetPlayersAll(), GetPlayersAll(), bj_ALLIANCE_ALLIED_ADVUNITS);
      SetForceAllianceStateBJ(GetPlayersAll(), bj_FORCE_PLAYER[PLAYER_NEUTRAL_AGGRESSIVE], bj_ALLIANCE_UNALLIED_VISION);
      SetForceAllianceStateBJ(bj_FORCE_PLAYER[PLAYER_NEUTRAL_AGGRESSIVE],GetPlayersAll(),bj_ALLIANCE_UNALLIED_VISION);

      for (0 <= PlayerIndex <= 11) {
        SetPlayerState(Player(PlayerIndex), PLAYER_STATE_RESOURCE_GOLD, 500000);
        SetPlayerState(Player(PlayerIndex), PLAYER_STATE_RESOURCE_LUMBER, 500000);
      }

      ClearTextMessages();
      DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 30, "Добро пожаловать в режим Песочницы. Ознакомиться со всеми командами вы можете в F9");
      QuestSetTitle(CommandDescription, "Команды");
      QuestItemSetDescription(CommandInfoItem, "Команды Песочницы");
      tempString[0] = "Что бы сбросить перезарядку способностей напишите -refresh.|n";
      tempString[1] = "Что бы добавить героя напишите -addhero|n";
      tempString[2] = "Что бы установить владельца героя/его уровень напишите -edithero|n";
      tempString[3] = "Что бы сделать альянс и орду врагами: -enemy, что бы союзниками -ally|n";
      tempString[4] = "Что бы сделать альянс и орду врагами, ПРИ ЭТОМ вы являетесь союзником и для ОРДЫ и для АЛЬЯНСА напишите -onlyme|n";
      tempString[5] = "Что бы изменить количество очков предметов, напишите -itempoints число";
      tempString[6] = "Что бы изменить количество золота, напишите -gold число";
      QuestSetDescription
      (
        CommandInfo,
        tempString[0] +
        tempString[1] +
        tempString[2] +
        tempString[3] +
        tempString[4] +
        tempString[5] +
        tempString[6]
      );
      QuestSetCompleted(CommandInfo, false);
      QuestSetIconPath(CommandInfo, "ReplaceableTextures\\CommandButtons\\BTNSpell_Magic_MageArmor.blp");
      AddItemToStock(gg_unit_ngwr_0458, 'texp', 1, 1);
      CreateUnitAtLoc(Player(PLAYER_NEUTRAL_AGGRESSIVE), 'nogm', GetRandomLocInRect(gg_rct_Sandbox), 270);
      CreateUnitAtLoc(Player(PLAYER_NEUTRAL_AGGRESSIVE), 'nogm', GetRandomLocInRect(gg_rct_Sandbox), 270);
      CreateUnitAtLoc(Player(PLAYER_NEUTRAL_AGGRESSIVE), 'nogm', GetRandomLocInRect(gg_rct_Sandbox), 270);
      CreateUnitAtLoc(Player(PLAYER_NEUTRAL_AGGRESSIVE), 'nogl', GetRandomLocInRect(gg_rct_Sandbox), 270);
      CreateUnitAtLoc(Player(PLAYER_NEUTRAL_AGGRESSIVE), 'Ekgg', GetRandomLocInRect(gg_rct_Sandbox), 270);
      TriggerSleepAction(3);
      DisableTrigger(gg_trg_Team_Killing_Alliance);
      DisableTrigger(gg_trg_Team_Killing_Horde);
      DisableTrigger(gg_trg_Throne_Reduce);
      DisableTrigger(gg_trg_Allied_Victory_Two);
      DisableTrigger(gg_trg_Horde_Victory);
      DisableTrigger(gg_trg_Horde_Victory);
      EnableTrigger(gg_trg_Item_Orb_On);
      for (0 <= PlayerIndex <= 11) {
        SetPlayerState(Player(PlayerIndex), PLAYER_STATE_RESOURCE_GOLD, 500000);
        SetPlayerState(Player(PlayerIndex), PLAYER_STATE_RESOURCE_LUMBER, 500000);
      }
    }

    function DisplayNewFraction (player ForWhoDisplayDialog, boolean NextDialog)  -> nothing {
      DialogClear(SelectHeroDialog);
      if (NextDialog) {
        if (DialogId == 11) DialogId = 0;
        else DialogId += 1;
      }
      else {
        if (DialogId == 0) DialogId = 11;
        else DialogId -= 1;
      }

      if (DialogId == 0) {
        DialogSetMessage(SelectHeroDialog, PlayerColorPrefix[0] + "Герои Стромгарда|r");
        PlayerStromgardHeroButtons[0]     = DialogAddButtonSimple(SelectHeroDialog, "Торас Троллбейн"          );
        PlayerStromgardHeroButtons[1]     = DialogAddButtonSimple(SelectHeroDialog, "Данат Троллбейн"          );
        PlayerStromgardHeroButtons[2]     = DialogAddButtonSimple(SelectHeroDialog, "Гален Троллбейн"          );
        PlayerStromgardHeroButtons[3]     = DialogAddButtonSimple(SelectHeroDialog, "Курдран Вилдхаммер"       );
        NextFraction                      = DialogAddButtonSimple(SelectHeroDialog, "Следующая фракция"        );
        PrevFraction                      = DialogAddButtonSimple(SelectHeroDialog, "Перейти к героям орды"    );
      } else if (DialogId == 1) {
        DialogSetMessage(SelectHeroDialog, PlayerColorPrefix[1] + "Герои Азерота|r");
        PlayerAzerothHeroButtons[0]     = DialogAddButtonSimple(SelectHeroDialog, "Андуин Лотар"               );
        PlayerAzerothHeroButtons[1]     = DialogAddButtonSimple(SelectHeroDialog, "Кадгар"                     );
        PlayerAzerothHeroButtons[2]     = DialogAddButtonSimple(SelectHeroDialog, "Ллейн Ринн I"               );
        PlayerAzerothHeroButtons[3]     = DialogAddButtonSimple(SelectHeroDialog, "Мара Фордрагон"             );
        NextFraction                    = DialogAddButtonSimple(SelectHeroDialog, "Следующая фракция"          );
        PrevFraction                    = DialogAddButtonSimple(SelectHeroDialog, "Предыдущая фракция"         );
      } else if (DialogId == 2) {
        DialogSetMessage(SelectHeroDialog, PlayerColorPrefix[2] + "Герои Кул'Тираса|r");
        PlayerKulTirasHeroButtons[0]    = DialogAddButtonSimple(SelectHeroDialog, "Даэлин Праудмур"            );
        PlayerKulTirasHeroButtons[1]    = DialogAddButtonSimple(SelectHeroDialog, "Дюк Фальривер"              );
        PlayerKulTirasHeroButtons[2]    = DialogAddButtonSimple(SelectHeroDialog, "Дерек Праудмур"             );
        PlayerKulTirasHeroButtons[3]    = DialogAddButtonSimple(SelectHeroDialog, "Мишан Уэйкрест"             );
        NextFraction                    = DialogAddButtonSimple(SelectHeroDialog, "Следующая фракция"          );
        PrevFraction                    = DialogAddButtonSimple(SelectHeroDialog, "Предыдущая фракция"         );
      } else if (DialogId == 3) {
        DialogSetMessage(SelectHeroDialog, PlayerColorPrefix[3] + "Герои Даларана|r");
        PlayerDalaranHeroButtons[0]    = DialogAddButtonSimple(SelectHeroDialog, "Антонидас"                   );
        PlayerDalaranHeroButtons[1]    = DialogAddButtonSimple(SelectHeroDialog, "Ронин Редхаир"               );
        PlayerDalaranHeroButtons[2]    = DialogAddButtonSimple(SelectHeroDialog, "Кель'Тас Сол. Скиталец"      );
        PlayerDalaranHeroButtons[3]    = DialogAddButtonSimple(SelectHeroDialog, "Аэгвинн"                     );
        NextFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Следующая фракция"           );
        PrevFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Предыдущая фракция"          );
      } else if (DialogId == 4) {
        DialogSetMessage(SelectHeroDialog, PlayerColorPrefix[4] + "Герои Легиона|r");
        PlayerLegionHeroButtons[0]     = DialogAddButtonSimple(SelectHeroDialog, "Архимонд"                    );
        PlayerLegionHeroButtons[1]     = DialogAddButtonSimple(SelectHeroDialog, "Килл'Джеден"                 );
        PlayerLegionHeroButtons[2]     = DialogAddButtonSimple(SelectHeroDialog, "Маннорот"                    );
        PlayerLegionHeroButtons[3]     = DialogAddButtonSimple(SelectHeroDialog, "Тихондриус"                  );
        PlayerLegionHeroButtons[4]     = DialogAddButtonSimple(SelectHeroDialog, "Медив"                       );
        PlayerLegionHeroButtons[5]     = DialogAddButtonSimple(SelectHeroDialog, "Азгалор"                     );
        NextFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Следующая фракция"           );
        PrevFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Предыдущая фракция"          );
      } else if (DialogId == 5) {
        DialogSetMessage(SelectHeroDialog, PlayerColorPrefix[5] + "Герои Гномов|r");
        PlayerGnomeHeroButtons[0]      = DialogAddButtonSimple(SelectHeroDialog, "Магни Бронзобород"           );
        PlayerGnomeHeroButtons[1]      = DialogAddButtonSimple(SelectHeroDialog, "Бранн Бронзобород"           );
        PlayerGnomeHeroButtons[2]      = DialogAddButtonSimple(SelectHeroDialog, "Гелбин Меггакрут"            );
        PlayerGnomeHeroButtons[3]      = DialogAddButtonSimple(SelectHeroDialog, "Мурадин Бронзобород"         );
        NextFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Следующая фракция"           );
        PrevFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Предыдущая фракция"          );
      } else if (DialogId == 6) {
        DialogSetMessage(SelectHeroDialog, PlayerColorPrefix[6] + "Герои Кель'Таласа|r");
        PlayerKaelThalasHeroButtons[0] = DialogAddButtonSimple(SelectHeroDialog, "Анастериан Сол. Скиталец"    );
        PlayerKaelThalasHeroButtons[1] = DialogAddButtonSimple(SelectHeroDialog, "Аллерия Ветрокрылая"         );
        PlayerKaelThalasHeroButtons[2] = DialogAddButtonSimple(SelectHeroDialog, "Лор'Темар Терон"             );
        PlayerKaelThalasHeroButtons[3] = DialogAddButtonSimple(SelectHeroDialog, "Сильванна Ветрокрылая"       );
        NextFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Следующая фракция"           );
        PrevFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Предыдущая фракция"          );
      } else if (DialogId == 7) {
        DialogSetMessage(SelectHeroDialog, PlayerColorPrefix[7] + "Герои Гилнеаса|r");
        PlayerGilneasHeroButtons[0]    = DialogAddButtonSimple(SelectHeroDialog, "Генн Седогрив"               );
        PlayerGilneasHeroButtons[1]    = DialogAddButtonSimple(SelectHeroDialog, "Аругал"                      );
        PlayerGilneasHeroButtons[2]    = DialogAddButtonSimple(SelectHeroDialog, "Гевинрад Дийре"              );
        PlayerGilneasHeroButtons[3]    = DialogAddButtonSimple(SelectHeroDialog, "Дариус Кроули"               );
        NextFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Следующая фракция"           );
        PrevFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Предыдущая фракция"          );
      } else if (DialogId == 8) {
        DialogSetMessage(SelectHeroDialog, PlayerColorPrefix[8] + "Герои Лордерона|r");
        PlayerLordaeronHeroButtons[0]  = DialogAddButtonSimple(SelectHeroDialog, "Утер Светоносный"            );
        PlayerLordaeronHeroButtons[1]  = DialogAddButtonSimple(SelectHeroDialog, "Тирион Фордринг"             );
        PlayerLordaeronHeroButtons[2]  = DialogAddButtonSimple(SelectHeroDialog, "Алонсий Фаол"                );
        PlayerLordaeronHeroButtons[3]  = DialogAddButtonSimple(SelectHeroDialog, "Туралион"                    );
        NextFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Следующая фракция"           );
        PrevFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Предыдущая фракция"          );
      } else if (DialogId == 9) {
        DialogSetMessage(SelectHeroDialog, PlayerColorPrefix[9] + "Герои Интеллекта|r");
        IntelligenceHeroes[0]          = DialogAddButtonSimple(SelectHeroDialog, "Гулдан"                      );
        IntelligenceHeroes[1]          = DialogAddButtonSimple(SelectHeroDialog, "Нер'Зул"                     );
        IntelligenceHeroes[2]          = DialogAddButtonSimple(SelectHeroDialog, "Терон"                       );
        IntelligenceHeroes[3]          = DialogAddButtonSimple(SelectHeroDialog, "Чо'Галл"                     );
        IntelligenceHeroes[4]          = DialogAddButtonSimple(SelectHeroDialog, "Фенрис"                      );
        IntelligenceHeroes[5]          = DialogAddButtonSimple(SelectHeroDialog, "Ратсо"                       );
        IntelligenceHeroes[6]          = DialogAddButtonSimple(SelectHeroDialog, "Зулухед"                     );
        NextFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Следующая фракция"           );
        PrevFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Предыдущая фракция"          );
      } else if (DialogId == 10) {
        DialogSetMessage(SelectHeroDialog, PlayerColorPrefix[10] + "Герои Ловкости|r");
        AgillityHeroes[0]              = DialogAddButtonSimple(SelectHeroDialog, "Киллрог Мёртвый Глаз"        );
        AgillityHeroes[1]              = DialogAddButtonSimple(SelectHeroDialog, "Гром Задира"                 );
        AgillityHeroes[2]              = DialogAddButtonSimple(SelectHeroDialog, "Зул'Джин"                    );
        AgillityHeroes[3]              = DialogAddButtonSimple(SelectHeroDialog, "Гарона Халфорсен"            );
        AgillityHeroes[4]              = DialogAddButtonSimple(SelectHeroDialog, "Мейм"                        );
        AgillityHeroes[5]              = DialogAddButtonSimple(SelectHeroDialog, "Гризельда"                   );
        NextFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Следующая фракция"           );
        PrevFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Предыдущая фракция"          );
      } else if (DialogId == 11) {
        DialogSetMessage(SelectHeroDialog, PlayerColorPrefix[11] + "Герои Силы|r");
        StrengthHeroes[0]              = DialogAddButtonSimple(SelectHeroDialog, "Блекхенд"                    );
        StrengthHeroes[1]              = DialogAddButtonSimple(SelectHeroDialog, "Оргрим Думхаммер"            );
        StrengthHeroes[2]              = DialogAddButtonSimple(SelectHeroDialog, "Каргат Острорук"             );
        StrengthHeroes[3]              = DialogAddButtonSimple(SelectHeroDialog, "Дентарг"                     );
        StrengthHeroes[4]              = DialogAddButtonSimple(SelectHeroDialog, "Ренд"                        );
        NextFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Перейти к героям Стромгарда" );
        PrevFraction                   = DialogAddButtonSimple(SelectHeroDialog, "Предыдущая фракция"          );
      }

      DialogDisplay(ForWhoDisplayDialog, SelectHeroDialog, true);

    }

    function DialogAction ()  -> nothing {
      unit AddedUnit = null;
      if (GetClickedButton() == PlayerStromgardHeroButtons[0]) AddedUnit = CreateUnitAtLoc(Player(0), Thoras, Bridges, 0);
      else if (GetClickedButton() == PlayerStromgardHeroButtons[1]) AddedUnit = CreateUnitAtLoc(Player(0), Danath, Bridges, 0);
      else if (GetClickedButton() == PlayerStromgardHeroButtons[2]) AddedUnit = CreateUnitAtLoc(Player(0), Galen, Bridges, 0);
      else if (GetClickedButton() == PlayerStromgardHeroButtons[3]) AddedUnit = CreateUnitAtLoc(Player(0), Curdran, Bridges, 0);
      else if (GetClickedButton() == PlayerAzerothHeroButtons[0]) AddedUnit = CreateUnitAtLoc(Player(1), Anduin, Bridges, 0);
      else if (GetClickedButton() == PlayerAzerothHeroButtons[1]) AddedUnit = CreateUnitAtLoc(Player(1), Khadgar, Bridges, 0);
      else if (GetClickedButton() == PlayerAzerothHeroButtons[2]) AddedUnit = CreateUnitAtLoc(Player(1), Llane, Bridges, 0);
      else if (GetClickedButton() == PlayerAzerothHeroButtons[3]) AddedUnit = CreateUnitAtLoc(Player(1), Mara, Bridges, 0);
      else if (GetClickedButton() == PlayerKulTirasHeroButtons[0]) AddedUnit = CreateUnitAtLoc(Player(2), Daelin, Bridges, 0);
      else if (GetClickedButton() == PlayerKulTirasHeroButtons[1]) AddedUnit = CreateUnitAtLoc(Player(2), Duke, Bridges, 0);
      else if (GetClickedButton() == PlayerKulTirasHeroButtons[2]) AddedUnit = CreateUnitAtLoc(Player(2), Derek, Bridges, 0);
      else if (GetClickedButton() == PlayerKulTirasHeroButtons[3]) AddedUnit = CreateUnitAtLoc(Player(2), Mishan, Bridges, 0);
      else if (GetClickedButton() == PlayerDalaranHeroButtons[0]) AddedUnit = CreateUnitAtLoc(Player(3), Antonidas, Bridges, 0);
      else if (GetClickedButton() == PlayerDalaranHeroButtons[1]) AddedUnit = CreateUnitAtLoc(Player(3), Rhonin, Bridges, 0);
      else if (GetClickedButton() == PlayerDalaranHeroButtons[2]) AddedUnit = CreateUnitAtLoc(Player(3), Kael, Bridges, 0);
      else if (GetClickedButton() == PlayerDalaranHeroButtons[3]) AddedUnit = CreateUnitAtLoc(Player(3), Aegwynn, Bridges, 0);
      else if (GetClickedButton() == PlayerLegionHeroButtons[0]) AddedUnit = CreateUnitAtLoc(Player(4), Archimonde, Bridges, 0);
      else if (GetClickedButton() == PlayerLegionHeroButtons[1]) AddedUnit = CreateUnitAtLoc(Player(4), KillJaeden, Bridges, 0);
      else if (GetClickedButton() == PlayerLegionHeroButtons[2]) AddedUnit = CreateUnitAtLoc(Player(4), Mannoroth, Bridges, 0);
      else if (GetClickedButton() == PlayerLegionHeroButtons[3]) AddedUnit = CreateUnitAtLoc(Player(4), Tichondrius, Bridges, 0);
      else if (GetClickedButton() == PlayerLegionHeroButtons[4]) AddedUnit = CreateUnitAtLoc(Player(4), Mediv, Bridges, 0);
      else if (GetClickedButton() == PlayerLegionHeroButtons[5]) AddedUnit = CreateUnitAtLoc(Player(4), Azgalor, Bridges, 0);
      else if (GetClickedButton() == PlayerGnomeHeroButtons[0]) AddedUnit = CreateUnitAtLoc(Player(5), Magni, Bridges, 0);
      else if (GetClickedButton() == PlayerGnomeHeroButtons[1]) AddedUnit = CreateUnitAtLoc(Player(5), Brann, Bridges, 0);
      else if (GetClickedButton() == PlayerGnomeHeroButtons[2]) AddedUnit = CreateUnitAtLoc(Player(5), Gelbin, Bridges, 0);
      else if (GetClickedButton() == PlayerGnomeHeroButtons[3]) AddedUnit = CreateUnitAtLoc(Player(5), Muradin, Bridges, 0);
      else if (GetClickedButton() == PlayerKaelThalasHeroButtons[0]) AddedUnit = CreateUnitAtLoc(Player(6), Anasterian, Bridges, 0);
      else if (GetClickedButton() == PlayerKaelThalasHeroButtons[1]) AddedUnit = CreateUnitAtLoc(Player(6), Alleria, Bridges, 0);
      else if (GetClickedButton() == PlayerKaelThalasHeroButtons[2]) AddedUnit = CreateUnitAtLoc(Player(6), LorThermar, Bridges, 0);
      else if (GetClickedButton() == PlayerKaelThalasHeroButtons[3]) AddedUnit = CreateUnitAtLoc(Player(6), Sylvanas, Bridges, 0);
      else if (GetClickedButton() == PlayerGilneasHeroButtons[0]) AddedUnit = CreateUnitAtLoc(Player(7), Genn, Bridges, 0);
      else if (GetClickedButton() == PlayerGilneasHeroButtons[1]) AddedUnit = CreateUnitAtLoc(Player(7), Arugal, Bridges, 0);
      else if (GetClickedButton() == PlayerGilneasHeroButtons[2]) AddedUnit = CreateUnitAtLoc(Player(7), Gavinrad, Bridges, 0);
      else if (GetClickedButton() == PlayerGilneasHeroButtons[3]) AddedUnit = CreateUnitAtLoc(Player(7), Darius, Bridges, 0);
      else if (GetClickedButton() == PlayerLordaeronHeroButtons[0]) AddedUnit = CreateUnitAtLoc(Player(8), Uther, Bridges, 0);
      else if (GetClickedButton() == PlayerLordaeronHeroButtons[1]) AddedUnit = CreateUnitAtLoc(Player(8), Tirion, Bridges, 0);
      else if (GetClickedButton() == PlayerLordaeronHeroButtons[2]) AddedUnit = CreateUnitAtLoc(Player(8), AlonSUS, Bridges, 0);
      else if (GetClickedButton() == PlayerLordaeronHeroButtons[3]) AddedUnit = CreateUnitAtLoc(Player(8), Tyralion, Bridges, 0);
      else if (GetClickedButton() == IntelligenceHeroes[0]) AddedUnit = CreateUnitAtLoc(Player(9), Guldan, Bridges, 0);
      else if (GetClickedButton() == IntelligenceHeroes[1]) AddedUnit = CreateUnitAtLoc(Player(9), Nerzhul, Bridges, 0);
      else if (GetClickedButton() == IntelligenceHeroes[2]) AddedUnit = CreateUnitAtLoc(Player(9), Teron, Bridges, 0);
      else if (GetClickedButton() == IntelligenceHeroes[3]) AddedUnit = CreateUnitAtLoc(Player(9), ChoGall, Bridges, 0);
      else if (GetClickedButton() == IntelligenceHeroes[4]) AddedUnit = CreateUnitAtLoc(Player(9), Fenris, Bridges, 0);
      else if (GetClickedButton() == IntelligenceHeroes[5]) AddedUnit = CreateUnitAtLoc(Player(9), Ratso, Bridges, 0);
      else if (GetClickedButton() == IntelligenceHeroes[6]) AddedUnit = CreateUnitAtLoc(Player(9), Zuluhed, Bridges, 0);
      else if (GetClickedButton() == AgillityHeroes[0]) AddedUnit = CreateUnitAtLoc(Player(10), Killrog, Bridges, 0);
      else if (GetClickedButton() == AgillityHeroes[1]) AddedUnit = CreateUnitAtLoc(Player(10), Grom, Bridges, 0);
      else if (GetClickedButton() == AgillityHeroes[2]) AddedUnit = CreateUnitAtLoc(Player(10), ZulJin, Bridges, 0);
      else if (GetClickedButton() == AgillityHeroes[3]) AddedUnit = CreateUnitAtLoc(Player(10), Garona, Bridges, 0);
      else if (GetClickedButton() == AgillityHeroes[4]) AddedUnit = CreateUnitAtLoc(Player(10), Maim, Bridges, 0);
      else if (GetClickedButton() == AgillityHeroes[5]) AddedUnit = CreateUnitAtLoc(Player(10), Griselda, Bridges, 0);
      else if (GetClickedButton() == StrengthHeroes[0]) AddedUnit = CreateUnitAtLoc(Player(11), Blackhand, Bridges, 0);
      else if (GetClickedButton() == StrengthHeroes[1]) AddedUnit = CreateUnitAtLoc(Player(11), Orgrim, Bridges, 0);
      else if (GetClickedButton() == StrengthHeroes[2]) AddedUnit = CreateUnitAtLoc(Player(11), Kargath, Bridges, 0);
      else if (GetClickedButton() == StrengthHeroes[3]) AddedUnit = CreateUnitAtLoc(Player(11), Dentarg, Bridges, 0);
      else if (GetClickedButton() == StrengthHeroes[4]) AddedUnit = CreateUnitAtLoc(Player(11), Rend, Bridges, 0);
      
      if (AddedUnit != null) TriggerRegisterUnitEvent(GetHeroTriggerOnDamage(AddedUnit), AddedUnit, EVENT_UNIT_DAMAGED);

      if (GetClickedButton() == NextFraction) {
        DisplayNewFraction(GetTriggerPlayer(), true);
      }
      if (GetClickedButton() == PrevFraction) {
        DisplayNewFraction(GetTriggerPlayer(), false);
      }
    }

    function CreateWindowSelectHero ()  -> nothing {
      trigger t = CreateTrigger();
      DialogDestroy(SelectHeroDialog);
      SelectHeroDialog = DialogCreate();
      DialogSetMessage(SelectHeroDialog, PlayerColorPrefix[0] + "Герои Стромгарда|r");
      PlayerStromgardHeroButtons[0] = DialogAddButton(SelectHeroDialog, "Торас Троллбейн",       0);
      PlayerStromgardHeroButtons[1] = DialogAddButton(SelectHeroDialog, "Данат Троллбейн",       0);
      PlayerStromgardHeroButtons[2] = DialogAddButton(SelectHeroDialog, "Гален Троллбейн",       0);
      PlayerStromgardHeroButtons[3] = DialogAddButton(SelectHeroDialog, "Курдран Вилдхаммер",    0);
      NextFraction                  = DialogAddButton(SelectHeroDialog, "Следующая фракция",     0);
      PrevFraction                  = DialogAddButton(SelectHeroDialog, "Перейти к героям орды", 0);
      DialogId = 0;
      DialogDisplay(GetTriggerPlayer(), SelectHeroDialog, true);
      TriggerRegisterDialogEvent(t, SelectHeroDialog);
      TriggerAddAction(t, function DialogAction);
    }

    function AddAGI ()  -> nothing {
      ModifyHeroStat(bj_HEROSTAT_AGI, LoadUnitHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0), bj_MODIFYMETHOD_ADD, S2I(GetEventPlayerChatString()));
      BJDebugMsg("Герою " + GetUnitName(LoadUnitHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0)) + " успешно добавлено " + I2S(S2I(GetEventPlayerChatString())) + " ловкости.");
      RemoveSavedHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0);
      DestroyTrigger(GetTriggeringTrigger());
    }

    function AddSTR ()  -> nothing {
      ModifyHeroStat(bj_HEROSTAT_STR, LoadUnitHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0), bj_MODIFYMETHOD_ADD, S2I(GetEventPlayerChatString()));
      BJDebugMsg("Герою " + GetUnitName(LoadUnitHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0)) + " успешно добавлено " + I2S(S2I(GetEventPlayerChatString())) + " силы.");
      RemoveSavedHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0);
      DestroyTrigger(GetTriggeringTrigger());
    }

    function AddINT ()  -> nothing {
      ModifyHeroStat(bj_HEROSTAT_INT, LoadUnitHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0), bj_MODIFYMETHOD_ADD, S2I(GetEventPlayerChatString()));
      BJDebugMsg("Герою " + GetUnitName(LoadUnitHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0)) + " успешно добавлено " + I2S(S2I(GetEventPlayerChatString())) + " интеллекта.");
      RemoveSavedHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0);
      DestroyTrigger(GetTriggeringTrigger());
    }

    function SubAGI ()  -> nothing {
      ModifyHeroStat(bj_HEROSTAT_AGI, LoadUnitHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0), bj_MODIFYMETHOD_ADD, S2I(GetEventPlayerChatString()));
      BJDebugMsg("У героя " + GetUnitName(LoadUnitHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0)) + " успешно отнято " + I2S(S2I(GetEventPlayerChatString())) + " ловкости.");
      RemoveSavedHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0);
      DestroyTrigger(GetTriggeringTrigger());
    }

    function SubSTR ()  -> nothing {
      ModifyHeroStat(bj_HEROSTAT_STR, LoadUnitHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0), bj_MODIFYMETHOD_ADD, S2I(GetEventPlayerChatString()));
      BJDebugMsg("У героя " + GetUnitName(LoadUnitHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0)) + " успешно отнято " + I2S(S2I(GetEventPlayerChatString())) + " силы.");
      RemoveSavedHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0);
      DestroyTrigger(GetTriggeringTrigger());
    }

    function SubINT ()  -> nothing {
      ModifyHeroStat(bj_HEROSTAT_INT, LoadUnitHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0), bj_MODIFYMETHOD_ADD, S2I(GetEventPlayerChatString()));
      BJDebugMsg("У героя " + GetUnitName(LoadUnitHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0)) + " успешно отнято " + I2S(S2I(GetEventPlayerChatString())) + " интеллекта.");
      RemoveSavedHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0);
      DestroyTrigger(GetTriggeringTrigger());
    }

    function AddSpeed ()  -> nothing {
      integer CountOfMS;
      unit Target = LoadUnitHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0);

      CountOfMS = (S2I(GetEventPlayerChatString()));

      if (GetUnitMoveSpeed(Target) + S2I(GetEventPlayerChatString()) > 522) {
        CountOfMS = R2I( 522 - GetUnitMoveSpeed(Target) );
      }



      SetUnitMoveSpeed( Target, GetUnitMoveSpeed(Target) + CountOfMS );
      DisplayTextToPlayer(GetTriggerPlayer(), 0, 0,
      "К скорости героя " +
      GetUnitName(LoadUnitHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0)) +
      " успешно добавлено " + I2S(CountOfMS) +
      " скорости. Текущая скорость: " + I2S(R2I(GetUnitMoveSpeed(Target)))
      );
      RemoveSavedHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0);
      DestroyTrigger(GetTriggeringTrigger());
    }

    function SubSpeed ()  -> nothing {
      integer CountOfMS;
      unit Target = LoadUnitHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0);

      CountOfMS = (S2I(GetEventPlayerChatString()));

      if (S2I(GetEventPlayerChatString()) > GetUnitMoveSpeed(Target)) {
        CountOfMS = R2I(GetUnitMoveSpeed(Target) - 50);
      }



      SetUnitMoveSpeed( Target, GetUnitMoveSpeed(Target) - CountOfMS );
      DisplayTextToPlayer(GetTriggerPlayer(), 0, 0,
      "От скорости героя " +
      GetUnitName(LoadUnitHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0)) +
      " успешно отнято " + I2S(CountOfMS) +
      " скорости. Текущая скорость: " + I2S(R2I(GetUnitMoveSpeed(Target)))
      );
      RemoveSavedHandle(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0);
      DestroyTrigger(GetTriggeringTrigger());
    }

    function EditHeroAction ()  -> nothing {
      trigger t;
      EditHero Edit = LoadInteger(SandboxHash, GetHandleId(GetTriggeringTrigger()), 0);
      if (GetClickedButton() == Edit.ChangeStats) Edit.editHeroStats();
      else if (GetClickedButton() == Edit.EditDefaultStats) Edit.editStats();

      else if (GetClickedButton() == Edit.EditHP){
        Edit.optype();
        Edit.ChangingStatName = "здоровье";
      }
      else if (GetClickedButton() == Edit.EditMP){
        Edit.optype();
        Edit.ChangingStatName = "ману";
      }
      else if (GetClickedButton() == Edit.EditHP){
        Edit.optype();
        Edit.ChangingStatName = "урон";
      }
      else if (GetClickedButton() == Edit.EditHP){
        Edit.optype();
        Edit.ChangingStatName = "защиту";
      }
      else if (GetClickedButton() == Edit.EditHP){
        Edit.optype();
        Edit.ChangingStatName = "скорость передвижения";
      }
      else if (GetClickedButton() == Edit.ChangeAGI){
        Edit.optype();
        Edit.ChangingStatName = "ловкость";
      }
      else if (GetClickedButton() == Edit.ChangeSTR){
        Edit.optype();
        Edit.ChangingStatName = "силу";
      }
      else if (GetClickedButton() == Edit.ChangeINT){
        Edit.optype();
        Edit.ChangingStatName = "интеллект";
      }

      if (GetClickedButton() == Edit.OPTYPEADD) {
        if (Edit.ChangingStatName == "ловкость") {
          t = CreateTrigger();
          TriggerRegisterPlayerChatEvent(t, GetTriggerPlayer(), "", false);
          DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 15, "Укажите количество ловкости в чате.");
          TriggerAddAction(t, function AddAGI);
          SaveUnitHandle(SandboxHash, GetHandleId(t), 0, Edit.Target);
          Edit.destroy();
          return;
        }
        if (Edit.ChangingStatName == "силу") {
          t = CreateTrigger();
          TriggerRegisterPlayerChatEvent(t, GetTriggerPlayer(), "", false);
          DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 15, "Укажите количество силы в чате.");
          TriggerAddAction(t, function AddSTR);
          SaveUnitHandle(SandboxHash, GetHandleId(t), 0, Edit.Target);
          Edit.destroy();
          return;
        }
        if (Edit.ChangingStatName == "интеллект") {
          t = CreateTrigger();
          TriggerRegisterPlayerChatEvent(t, GetTriggerPlayer(), "", false);
          DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 15, "Укажите количество интеллекта в чате.");
          TriggerAddAction(t, function AddINT);
          SaveUnitHandle(SandboxHash, GetHandleId(t), 0, Edit.Target);
          Edit.destroy();
          return;
        }

        if (Edit.ChangingStatName == "скорость передвижения") {
          t = CreateTrigger();
          TriggerRegisterPlayerChatEvent(t, GetTriggerPlayer(), "", false);
          DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 15, "Укажите количество скорости в чате.");
          TriggerAddAction(t, function AddSpeed);
          SaveUnitHandle(SandboxHash, GetHandleId(t), 0, Edit.Target);
          Edit.destroy();
          return;
        }
      }
      else if (GetClickedButton() == Edit.OPTYPESUB) {
        if (Edit.ChangingStatName == "ловкость") {
          t = CreateTrigger();
          TriggerRegisterPlayerChatEvent(t, GetTriggerPlayer(), "", false);
          DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 15, "Укажите количество ловкости в чате.");
          TriggerAddAction(t, function SubAGI);
          SaveUnitHandle(SandboxHash, GetHandleId(t), 0, Edit.Target);
          Edit.destroy();
          return;
        }
        if (Edit.ChangingStatName == "силу") {
          t = CreateTrigger();
          TriggerRegisterPlayerChatEvent(t, GetTriggerPlayer(), "", false);
          DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 15, "Укажите количество силы в чате.");
          TriggerAddAction(t, function SubSTR);
          SaveUnitHandle(SandboxHash, GetHandleId(t), 0, Edit.Target);
          Edit.destroy();
          return;
        }
        if (Edit.ChangingStatName == "интеллект") {
          t = CreateTrigger();
          TriggerRegisterPlayerChatEvent(t, GetTriggerPlayer(), "", false);
          DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 15, "Укажите количество интеллекта в чате.");
          TriggerAddAction(t, function SubINT);
          SaveUnitHandle(SandboxHash, GetHandleId(t), 0, Edit.Target);
          Edit.destroy();
          return;
        }

        if (Edit.ChangingStatName == "скорость передвижения") {
          t = CreateTrigger();
          TriggerRegisterPlayerChatEvent(t, GetTriggerPlayer(), "", false);
          DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 15, "Укажите количество скорости в чате.");
          TriggerAddAction(t, function SubSpeed);
          SaveUnitHandle(SandboxHash, GetHandleId(t), 0, Edit.Target);
          Edit.destroy();
          return;
        }
      }
      

      if (GetClickedButton() == Edit.HideDialog) {
        DialogDisplay(GetTriggerPlayer(), Edit.Dialog, false);
        Edit.destroy();
        return;
      }

      DialogDisplay(GetTriggerPlayer(), Edit.Dialog, true);
    }

    function CreateWindowEditHero ()  -> nothing {
      trigger DialogClick;
      EditHero Edit;
      DestroyTrigger(GetTriggeringTrigger());
      if (!IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO)) {
        DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 15, "Изменение отменено. Вы выбрали не героя.");
        return;
      }
      DialogClick = CreateTrigger(); 
      Edit = EditHero.create();
      DialogDisplay(GetTriggerPlayer(), Edit.Dialog, true);
      TriggerRegisterDialogEvent(DialogClick, Edit.Dialog);
      SaveInteger(SandboxHash, GetHandleId(DialogClick), 0, Edit);
      TriggerAddAction(DialogClick, function EditHeroAction);
    }

    function SelectHero ()  -> nothing {
      trigger t = CreateTrigger();
      TriggerRegisterPlayerUnitEvent(t, GetTriggerPlayer(), EVENT_PLAYER_UNIT_SELECTED, null);
      TriggerAddAction(t, function CreateWindowEditHero);
      DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 20, "Выберите героя");
      //TODO Если герой уже выбран - изменять характеристики уже выбранного героя, а не ждать, пока выберешь юнита
    }

    function ChangeAllyType ()  -> nothing {
      integer AlliancePlayerIndex;
      integer HordePlayerIndex;
      if (GetEventPlayerChatString() == "-ally") {
        SetForceAllianceStateBJ(GetPlayersAll(), GetPlayersAll(), bj_ALLIANCE_ALLIED_ADVUNITS);
        SetForceAllianceStateBJ(GetPlayersAll(), bj_FORCE_PLAYER[PLAYER_NEUTRAL_AGGRESSIVE], bj_ALLIANCE_UNALLIED_VISION);
        SetForceAllianceStateBJ(bj_FORCE_PLAYER[PLAYER_NEUTRAL_AGGRESSIVE],GetPlayersAll(),bj_ALLIANCE_UNALLIED_VISION);
        ClearTextMessages();
        DisplayTimedTextToPlayerSimple(GetLocalPlayer(), 15, "Все стали союзниками!");
      } else if (GetEventPlayerChatString() == "-enemy") {
        SetForceAllianceStateBJ(AllianceForce, HordeForce, bj_ALLIANCE_UNALLIED);
        SetForceAllianceStateBJ(HordeForce, AllianceForce, bj_ALLIANCE_UNALLIED);
        ClearTextMessages();
        DisplayTimedTextToPlayerSimple(GetLocalPlayer(), 15, "Альянс и орда стали врагами!");
      } else {
        SetForceAllianceStateBJ(AllianceForce, HordeForce, bj_ALLIANCE_UNALLIED);
        SetForceAllianceStateBJ(HordeForce, AllianceForce, bj_ALLIANCE_UNALLIED);

        SetForceAllianceStateBJ(AllianceForce, bj_FORCE_PLAYER[GetPlayerId(GetTriggerPlayer())], bj_ALLIANCE_ALLIED_ADVUNITS);
        SetForceAllianceStateBJ(HordeForce, bj_FORCE_PLAYER[GetPlayerId(GetTriggerPlayer())], bj_ALLIANCE_ALLIED_ADVUNITS);
        ClearTextMessages();
        DisplayTimedTextToPlayerSimple(GetLocalPlayer(), 15, "Альянс и орда стали врагами, но союзниками для вас!");
      }
    }

    function EveryEnemyesButAlliesForSandboxPlayer ()  -> nothing {
      
    }

    function Refresh ()  -> nothing {
      group AllUnits = CreateGroup();
      unit Unit;
      GroupEnumUnitsInRect(AllUnits, GetWorldBounds(), null);
      while (FirstOfGroup(AllUnits) != null) {
        Unit = FirstOfGroup(AllUnits);
        UnitResetCooldown(Unit);
        SetUnitState(Unit, UNIT_STATE_LIFE, GetUnitState(Unit, UNIT_STATE_MAX_LIFE));
        SetUnitState(Unit, UNIT_STATE_MANA, GetUnitState(Unit, UNIT_STATE_MAX_MANA));
        GroupRemoveUnit(AllUnits, Unit);
      }
      DestroyGroup(AllUnits);
      AllUnits = null;
      Unit = null;
    }

    function ChangePlayerState ()  -> nothing {
      if (SubString(GetEventPlayerChatString(), 0, StringLength("-itempoints")) == "-itempoints") {
        SetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, S2I(SubString(GetEventPlayerChatString(), StringLength("-itempoints") + 1, StringLength(GetEventPlayerChatString()))));
      } else if (SubString(GetEventPlayerChatString(), 0, StringLength("-gold")) == "-gold") {
        SetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER
        , S2I(SubString(GetEventPlayerChatString(), StringLength("-gold") + 1, StringLength(GetEventPlayerChatString()))));
      }
    }

    function onInit ()  -> nothing {
      integer index;
      trigger t;
      for (0 <= index <= 11) {
        if
        (
          GetPlayerSlotState(Player(index)) == PLAYER_SLOT_STATE_EMPTY ||
          GetPlayerSlotState(Player(index)) == PLAYER_SLOT_STATE_LEFT  ||
          GetPlayerController(Player(index)) == MAP_CONTROL_COMPUTER
        )
        {
          CountofLeavedPlayers += 1;
        }
      }
      if (CountofLeavedPlayers == 11) {
        ExecuteFunc("InitSandbox");
      } else {
        return;
      }
      t = CreateTrigger();
      TriggerRegisterAnyPlayerChatEvent(t, "-refresh", false);
      TriggerAddAction(t, function Refresh);
      t = CreateTrigger();
      TriggerRegisterAnyPlayerChatEvent(t, "-addhero", false);
      TriggerAddAction(t, function CreateWindowSelectHero);
      t = CreateTrigger();
      TriggerRegisterAnyPlayerChatEvent(t, "-edithero", false);
      TriggerAddAction(t, function SelectHero);
      t = CreateTrigger();
      TriggerRegisterAnyPlayerChatEvent(t, "-ally", false);
      TriggerRegisterAnyPlayerChatEvent(t, "-enemy", false);
      TriggerRegisterAnyPlayerChatEvent(t, "-onlyme", false);
      TriggerAddAction(t, function ChangeAllyType);

      t = CreateTrigger();
      TriggerRegisterAnyPlayerChatEvent(t, "-itempoints", false);
      TriggerRegisterAnyPlayerChatEvent(t, "-gold", false);
      TriggerAddAction(t, function ChangePlayerState);

    }
  }
//! endzinc