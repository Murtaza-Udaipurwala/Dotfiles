static int instant = 0;
static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int fuzzy = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching     */

/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"FiraCode Nerd Font:size=11:style=medium",
	"NotoColorEmoji:size=13"
};

static const char *prompt = NULL;      /* -p  option; prompt to the left of input field */

static const char *colors[SchemeLast][2] = {
	/*                           fg          bg       */
	[SchemeNorm]            = { "#fff",     "#212120" },
	[SchemeSel]             = { "#000000",  "#88C0D0" },
	[SchemeSelHighlight]    = { "#fff",     "#10385f" },
	[SchemeNormHighlight]   = { "#ff0000",  "#212120" },
	[SchemeOut]             = { "#000",     "#00ffff" },
	[SchemeMid]             = { "#fff",     "#000"    },
};

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;

/* -h option; minimum height of a menu line */
static unsigned int lineheight = 22;
static unsigned int min_lineheight = 8;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static const unsigned int border_width = 2;
