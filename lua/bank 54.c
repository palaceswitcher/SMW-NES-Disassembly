enum soundEffects {};
enum powerupStates {PSTATE_SMALL, PSTATE_BIG, PSTATE_FIRE, PSTATE_CAPE, PSTATE_CAPEMOVE};
enum eatResponses {PSWITCH = 2, SPRING, FIRE, UNDEF, SWALLOW = 6, INEDIBLE};

const unsigned char OBJ_POWERUPS[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, PSTATE_BIG, PSTATE_FIRE, PSTATE_CAPE, 0, 0
};

if (objEatResponse != SWALLOW) {
	return;
}

if playerPowerup == PSTATE_CAPEMOVE {
	playerPowerup = PSTATE_CAPE;
}

int eatenObj = objectSlot[curObject]; //Object being eaten
if (eatenObj >= 16 && eatenObject == OBJ_MUSHROOM_STANDING || eatenObject == OBJECT_MUSHROOM_PRINCESS || eatenObject == OBJ_MUSHROOM_HIDDEN) {
	eatenObject = OBJ_MUSHROOM;
} else {
	return;
}

int powerup == OBJ_POWERUPS[x];
if (powerup == PSTATE_BIG && !playerPowerup) {
	if (itemBox) {
		itemBox = powerup; //Give item if item box is empty
	}
}
playerPowerup = powerup; //Give player powerup
if (playerPowerup) {
	itemBox = powerup; //Only put the player's powerup in the item box if the player has one
}

int powerupBufTime = 1;
sfxPlay = SFX_POWERUP;
if (eatenObject == OBJ_FEATHER) {
	sfxPlay = SFX_FEATHER;
	powerupBufTime = 0x81;
}
eventTrigger = 7;
YREG = curObject;
return;