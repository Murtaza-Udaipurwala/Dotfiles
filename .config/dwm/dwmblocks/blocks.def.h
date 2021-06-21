static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/		/*Update Signal*/

	{"", "cpu", 60, 1},
	{"", "mem", 60, 2},
	{"", "cpu-tempt", 60, 3},
	{"", "weather", 10800, 5},
	{"", "vol", 0, 10},
	{"", "brightness-indicator", 0, 14},
	{"", "battery", 60, 6},
	{"", "wifi-indicator", 0, 12},
	/* {"", "network-traffic", 1, 9}, */
	{"", "clock", 60, 7},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "  ";
static unsigned int delimLen = 5;
