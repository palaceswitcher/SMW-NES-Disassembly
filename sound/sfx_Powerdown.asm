Powerdown_P1Noise:
	sndspeed 1
	transpose 7
	duty 0
	pitch $64
	volenv $11
	notelen 5
	db D3-7, NRest, D3-7, NRest
	notelen 11
	db D3-7
	db $FF
Powerdown_Footer:
	sfxsq1 Powerdown_P1Noise
	sfxnoise Powerdown_P1Noise
	db $FF