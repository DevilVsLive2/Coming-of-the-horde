//! zinc
  library DeathsEdge requires CothUtilities {
    timer DeathsEdgeTimer[22];
    hashtable DeathsEdgeHashtable = InitHashtable();

    function IsAbillityADeathsEdge ()  -> boolean {
      return (GetSpellAbilityId() == 'A034');
    }

    function DeathsEdge_End ()  -> nothing {
      unit DeathsEdge_Target = LoadUnitHandle(DeathsEdgeHashtable, 0, GetHandleId(GetExpiredTimer()));
      UnitRemoveAbility(DeathsEdge_Target, 'A0BL');
      PauseTimer(GetExpiredTimer());
      DestroyTimer(GetExpiredTimer());
    }

    function DeathsEdge ()  -> nothing {
      unit DeathsEdge_Target = GetSpellTargetUnit();
      unit DeathsEdge_Caster = GetTriggerUnit();
      integer Caster_Id = GetPlayerId(GetOwningPlayer(DeathsEdge_Caster));
      //Добавление -20% к маг резисту
      UnitAddAbility(DeathsEdge_Target, 'A0BL');
      //Если прошлый дез эйдж прошёл, либо если цель та же, что была и прошлой - обновляем заново таймер
      if ( TimerGetRemaining(DeathsEdgeTimer[GetPlayerId(GetOwningPlayer(DeathsEdge_Caster))]) <= 0.1 || LoadUnitHandle(DeathsEdgeHashtable, 0, GetHandleId(DeathsEdgeTimer[Caster_Id])) == DeathsEdge_Target) {
        PauseTimer(DeathsEdgeTimer[Caster_Id]);
        DestroyTimer(DeathsEdgeTimer[Caster_Id]);
        DeathsEdgeTimer[Caster_Id] = CreateTimer();
        TimerStart(DeathsEdgeTimer[Caster_Id], 10, false, function DeathsEdge_End);
        SaveUnitHandle(DeathsEdgeHashtable, 0, GetHandleId(DeathsEdgeTimer[Caster_Id]), DeathsEdge_Target);
      } else { //Если мы кинули дез эйдж второй раз быстрее, чем прошло его время действия - запускаем другой таймер
        PauseTimer(DeathsEdgeTimer[Caster_Id * 2]);
        DestroyTimer(DeathsEdgeTimer[Caster_Id * 2]);
        DeathsEdgeTimer[Caster_Id * 2] = CreateTimer();
        TimerStart(DeathsEdgeTimer[Caster_Id * 2], 10, false, function DeathsEdge_End);
        SaveUnitHandle(DeathsEdgeHashtable, 0, GetHandleId(DeathsEdgeTimer[Caster_Id * 2]), DeathsEdge_Target);
      }
      PolledWait(DistanceBetweenPoints(GetUnitLoc(DeathsEdge_Caster), GetUnitLoc(DeathsEdge_Target)) / 900 * 0.15);
      UnitDamageTarget(DeathsEdge_Caster, DeathsEdge_Target, 150, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS);
      DeathsEdge_Target = null;
      DeathsEdge_Caster = null;
    }
    function onInit ()  -> nothing {
      trigger t = CreateTrigger();
      TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_EFFECT);
      TriggerAddCondition(t, Condition(function IsAbillityADeathsEdge));
      TriggerAddAction(t, function DeathsEdge);
    }
  }
//! endzinc