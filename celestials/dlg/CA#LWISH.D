BEGIN ~CA#LWISH~

IF ~Global("wishjames","LOCALS",0)~ THEN BEGIN 0
  SAY #58561 /* ~Choose then, but be aware that unwise wishes shall leave the wisher wanting.~ */
  IF ~  CheckStatGT(LastTalkedToBy,9,WIS)
~ THEN REPLY #58562 /* ~I wish for my entire party to be healed.~ */ DO ~SetGlobal("wishjames","LOCALS",1)
~ GOTO 13
  IF ~  CheckStatLT(LastTalkedToBy,10,WIS)
~ THEN REPLY #58563 /* ~I wish that none of my party would die of their wounds.~ */ DO ~SetGlobal("wishjames","LOCALS",1)
~ GOTO 14
  IF ~  CheckStatGT(LastTalkedToBy,15,WIS)
~ THEN REPLY #58564 /* ~I wish that spells I have cast would be restored, that I might cast them again!~ */ DO ~SetGlobal("wishjames","LOCALS",1)
~ GOTO 15
  IF ~  CheckStatLT(LastTalkedToBy,16,WIS)
~ THEN REPLY #58565 /* ~I wish for my spells to be restored!~ */ DO ~SetGlobal("wishjames","LOCALS",1)
~ GOTO 16
  IF ~  CheckStatGT(LastTalkedToBy,11,WIS)
~ THEN REPLY #58566 /* ~I wish to make my party invulnerable.~ */ DO ~SetGlobal("wishjames","LOCALS",1)
~ GOTO 17
  IF ~  CheckStatLT(LastTalkedToBy,12,WIS)
~ THEN REPLY #58567 /* ~I wish that magic would fail to affect me or my party.~ */ DO ~SetGlobal("wishjames","LOCALS",1)
~ GOTO 18
  IF ~~ THEN REPLY #58568 /* ~I wish to summon a horde to overrun my enemies.~ */ DO ~SetGlobal("wishjames","LOCALS",1)
~ GOTO 19
  IF ~  CheckStatGT(LastTalkedToBy,9,WIS)
~ THEN REPLY #58569 /* ~I wish to be protected from the undead.~ */ DO ~SetGlobal("wishjames","LOCALS",1)
~ GOTO 20
  IF ~  CheckStatLT(LastTalkedToBy,10,WIS)
~ THEN REPLY #58570 /* ~I wish to be protected from undead right now.~ */ DO ~SetGlobal("wishjames","LOCALS",1)
~ GOTO 21
  IF ~~ THEN REPLY #58572 /* ~I do not want a wish now~ */ DO ~SetGlobal("wishjames","LOCALS",1)
~ GOTO 2
END

IF ~~ THEN BEGIN 2 // from: 0.2 1.1 12.10
  SAY #58550 /* ~Very well then.  I am gone.~ */
  IF ~~ THEN DO ~SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)
~ EXIT
END

IF ~~ THEN BEGIN 13 // from: 12.0
  SAY #58573 /* ~Then all shall be healed.~ */
  IF ~~ THEN DO ~ActionOverride(LastTalkedToBy,ReallyForceSpell(Myself,WISH_HEAL_PARTY))
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)
~ EXIT
END

IF ~~ THEN BEGIN 14 // from: 12.1
  SAY #58574 /* ~Granted.  All will die of other afflictions, but not of the wounds they have.~ */
  IF ~~ THEN DO ~ActionOverride(LastTalkedToBy,ReallyForceSpell(Myself,WISH_POISON))
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)
~ EXIT
END

IF ~~ THEN BEGIN 15 // from: 12.2
  SAY #58575 /* ~Then I shall grant your wish and restore some of your lost spells.~ */
  IF ~~ THEN DO ~ActionOverride(LastTalkedToBy,ReallyForceSpell(Myself,WISH_MEMORIZE))
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)
~ EXIT
END

IF ~~ THEN BEGIN 16 // from: 12.3
  SAY #58576 /* ~Granted. Your spells have been restored to the way they were before you memorized them.~ */
  IF ~~ THEN DO ~ActionOverride(LastTalkedToBy,ReallyForceSpell(Myself,WISH_LOSE_SPELL))
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)
~ EXIT
END

IF ~~ THEN BEGIN 17 // from: 12.4
  SAY #58577 /* ~Invulnerability you shall have!~ */
  IF ~~ THEN DO ~ActionOverride(Player1,ReallyForceSpell(Myself,WISH_GLOBE))
ActionOverride(Player2,ReallyForceSpell(Myself,WISH_GLOBE))
ActionOverride(Player3,ReallyForceSpell(Myself,WISH_GLOBE))
ActionOverride(Player4,ReallyForceSpell(Myself,WISH_GLOBE))
ActionOverride(Player5,ReallyForceSpell(Myself,WISH_GLOBE))
ActionOverride(Player6,ReallyForceSpell(Myself,WISH_GLOBE))
ActionOverride("A7Afaaq",ReallyForceSpell(Myself,WISH_GLOBE))
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)
~ EXIT
END

IF ~~ THEN BEGIN 18 // from: 12.5
  SAY #58578 /* ~A curious request, but consider it granted. None of your spells shall function.~ */
  IF ~~ THEN DO ~ActionOverride(LastTalkedToBy,ReallyForceSpell(Myself,WISH_SPELL_FAILURE))
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)
~ EXIT
END

IF ~~ THEN BEGIN 19 // from: 12.6
  SAY #58579 /* ~A horde?  As you wish...~ */
  IF ~~ THEN DO ~ActionOverride(LastTalkedToBy,ReallyForceSpell(Myself,WISH_RABBIT))
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)
~ EXIT
END

IF ~~ THEN BEGIN 20 // from: 12.7
  SAY #58580 /* ~Protection granted.~ */
  IF ~~ THEN DO ~ActionOverride(Player1,ReallyForceSpell(Myself,CLERIC_NEGATIVE_PLANE_PROTECTION))
ActionOverride(Player2,ReallyForceSpell(Myself,CLERIC_NEGATIVE_PLANE_PROTECTION))
ActionOverride(Player3,ReallyForceSpell(Myself,CLERIC_NEGATIVE_PLANE_PROTECTION))
ActionOverride(Player4,ReallyForceSpell(Myself,CLERIC_NEGATIVE_PLANE_PROTECTION))
ActionOverride(Player5,ReallyForceSpell(Myself,CLERIC_NEGATIVE_PLANE_PROTECTION))
ActionOverride(Player6,ReallyForceSpell(Myself,CLERIC_NEGATIVE_PLANE_PROTECTION))
ActionOverride("A7Afaaq",ReallyForceSpell(Myself,CLERIC_NEGATIVE_PLANE_PROTECTION))
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)
~ EXIT
END

IF ~~ THEN BEGIN 21 // from: 12.8
  SAY #58581 /* ~Protection from undead granted, and I shall have to summon some undead for you to be protected from.~ */
  IF ~~ THEN DO ~DayNight(MIDNIGHT)
CreateCreatureObjectEffect("vamanc01","SPDIMNDR",LastTalkedToBy)
CreateCreatureObjectEffect("vamver01","SPDIMNDR",LastTalkedToBy)
CreateCreatureObjectEffect("vamold01","SPDIMNDR",LastTalkedToBy)
CreateCreatureObjectEffect("vammat01","SPDIMNDR",LastTalkedToBy)
CreateCreatureObjectEffect("vammat01","SPDIMNDR",LastTalkedToBy)
CreateCreatureObjectEffect("vammat01","SPDIMNDR",LastTalkedToBy)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)
~ EXIT
END
