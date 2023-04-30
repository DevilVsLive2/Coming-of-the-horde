//! zinc
    library Camera requires CothUtilities {
        private function ChangeCamera ()  -> nothing {
            boolean ZoomMin = S2I(SubString(GetEventPlayerChatString(), 6, 10)) >= 1650;
            boolean ZoomMax = S2I(SubString(GetEventPlayerChatString(), 6, 10)) <= 4000;
            boolean ExactOnly = SubString(GetEventPlayerChatString(), 0, 6) == "-zoom " && SubString(GetEventPlayerChatString(), 10, StringLength(GetEventPlayerChatString())) == "";
            if (GetEventPlayerChatString() == "-far") {
                SetCameraFieldForPlayer(GetTriggerPlayer(), CAMERA_FIELD_TARGET_DISTANCE, 2975, 0.5);
                return;
            }
            if (GetEventPlayerChatString() == "-medium") {
                SetCameraFieldForPlayer(GetTriggerPlayer(), CAMERA_FIELD_TARGET_DISTANCE, 2300, 0.5);
                return;
            }
            if (GetEventPlayerChatString() == "-close") {
                ResetToGameCameraForPlayer(GetTriggerPlayer(), 0.5);
                return;
            }

            if (ZoomMin && ZoomMax && ExactOnly) {
                SetCameraFieldForPlayer(GetTriggerPlayer(), CAMERA_FIELD_TARGET_DISTANCE, S2R(SubString(GetEventPlayerChatString(), 6, 10)), 0.5);
            }
        }
        
        private function onInit ()  -> nothing {
            trigger t = CreateTrigger();
            integer index;
            for (0 <= index <= 11) {
                TriggerRegisterPlayerChatEvent(t, Player(index), "-far", true);
                TriggerRegisterPlayerChatEvent(t, Player(index), "-medium", true);
                TriggerRegisterPlayerChatEvent(t, Player(index), "-close", true);
                TriggerRegisterPlayerChatEvent(t, Player(index), "-zoom", false);
            }
            TriggerAddAction(t, function ChangeCamera);
        }
    }
//! endzinc